#!/bin/bash

# written by Dr. Jean Gourd
# last updated on 2017-01-05
# steal this and suffer
# bool crap

# requires nemesis, tcpdump, base64, mergecap, my shift script

# the interface
INT=enp0s3
# the source and destination IP addresses
SRC=10.0.0.100
DST=10.0.0.200
# the destination port
PORT=1337
# the number of noise packets to generate both before and after the chat packets
NOISE=100
# the date range for all packets
MIN_DATE="18-12-04 08:00:00"
MAX_DATE="18-12-04 13:30:00"
# the user to own the final pcap file
USER=jlester

###############################
# DO NOT EDIT BELOW THIS LINE #
###############################

if [ `whoami` != "root" ]; then
	echo "You must be root."
	exit
fi

# generates a random IP address in the 10.0.0.0/8 range
gen_ip()
{
	ip="10.$(($RANDOM % (254 - 1) + 1)).$(($RANDOM % (254 - 1) + 1)).$(($RANDOM % (254 - 1) + 1))"

	while [[ "$ip" == "$SRC" || "$ip" == "$DST" ]]; do
		ip=`gen_ip`
	done

	echo $ip
}

# generates a random port (not the destination port above)
gen_port()
{
	port=$(($RANDOM % (65535 - 1500) + 1500))

	while [[ "$port" == "$PORT" ]]; do
		port=`gen_port`
	done

	echo $port
}

# generates a random payload
gen_payload()
{
	dd if=/dev/urandom bs=1380 count=1 2>/dev/null | base64
}

# generates the noise packets
gen_noise()
{
	echo "Generating noise packets..."
	echo "-Starting tcpdump..."
	tcpdump -i $INT -qntAls 0 -Z $USER -w "noise$1.cap" "dst net 10.0.0.0/8" >/dev/null 2>&1 &
	sleep 3
	echo -n "-Injecting $NOISE packets"
	cat before.txt | while read l; do
                # we assume that the source alternates at every line of chat
                payload=`gen_payload`
                src=`gen_ip`
                dst=`gen_ip`
                s_pt=`gen_port`
                d_pt=`gen_port`

                # send the packet
                echo "$l" | nemesis tcp -d $INT -fP -FD -S $src -D $dst -x $s_pt -y $d_pt -P - >/dev/null 2>&1
		echo -n .
	done
	sleep 3
	echo
	echo "-Stopping tcpdump..."
	killall tcpdump
	sleep 1
}
gen_after_noise()
{
        echo "Generating noise packets..."
        echo "-Starting tcpdump..."
        tcpdump -i $INT -qntAls 0 -Z $USER -w "noise$1.cap" "dst net 10.0.0.0/8" >/dev/null 2>&1 &
        sleep 3
        echo -n "-Injecting $NOISE packets"
        cat after.txt | while read l; do
                # we assume that the source alternates at every line of chat
                payload=`gen_payload`
                src=`gen_ip`
                dst=`gen_ip`
                s_pt=`gen_port`
                d_pt=`gen_port`

                # send the packet
                echo "$l" | nemesis tcp -d $INT -fP -FD -S $src -D $dst -x $s_pt -y $d_pt -P - >/dev/null 2>&1
                echo -n .
        done
        sleep 3
        echo
        echo "-Stopping tcpdump..."
        killall tcpdump
        sleep 1
}

# generates the chat packets
gen_chat()
{
	echo "Generating chat packets..."
	echo "-Starting tcpdump..."
	tcpdump -i $INT -qntAls 0 -Z $USER -w "chat.cap" "dst net 10.0.0.0/8" >/dev/null 2>&1 &
	sleep 3
	echo -n "-Injecting packets"
	i=0
	cat 446Coordinates.txt | while read l; do
		# we assume that the source alternates at every line of chat
		if (($((i % 2)) == 0)); then
			src=$SRC
			dst=$DST
		else
			src=$DST
			dst=$SRC
		fi

		# send the packet
		echo "$l" | nemesis tcp -d $INT -fP -FD -S $src -D $dst -y $PORT -P - >/dev/null 2>&1
		echo -n 
		((i++))
	done
	sleep 3
	echo
	echo "-Stopping tcpdump..."
	killall tcpdump
	sleep 1
}

# generate the packets
gen_noise 1
gen_chat
gen_after_noise 2

# merge and shift the packets to the date range
echo "Merging..."
mergecap -a -s 1380 -F libpcap -w sample.cap noise1.cap chat.cap noise2.cap >/dev/null 2>&1
./shift.py sample.cap sample_shifted.cap "$MIN_DATE" "$MAX_DATE" >/dev/null 2>&1

# clean up
mv sample_shifted.cap sample.cap
rm noise1.cap noise2.cap chat.cap
chown $USER:$USER sample.cap
