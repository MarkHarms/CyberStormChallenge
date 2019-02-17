#!/usr/bin/python

#note: /usr/lib/pymodules/python2.7/scapy/arch/linux.py can edited to redirect stderr to /dev/null when calling tcpdump
#written by Dr. Jean Gourd
#last updated on 2017-01-05
#steal this and suffer...
#bool crap

#requires python-scapy

import os
import sys
import datetime
import re
import textwrap
import string
import logging

logging.getLogger("scapy.runtime").setLevel(logging.ERROR)

from scapy.all import *

if os.geteuid() != 0:
	sys.stderr.write("You must be root.\n")
	sys.exit(1)

#packet processing function
def go(pak):
	#if there's no IP header, don't process the packet
	if not "IP" in pak:
		return

	#only display packets that match a payload text filter if specified
	if t_filter != "n" and t_filter != "N":
		if hasattr(pak[IP], "load"):
			if not t_filter in pak[IP].load:
				return
		else:
			return

	#display the packet header if not isolating payloads
	if payload != "y" and payload != "Y":
		timestamp = pak.time

		#display the packets to the console
		print "--------------------------------------------"
		sys.stdout.write("     Timestamp: " + datetime.datetime.fromtimestamp(int(timestamp)).strftime('%Y-%m-%d %H:%M:%S') + "\n")
		sys.stdout.write("    Sequence #: " + (str(pak[IP].seq) if hasattr(pak[IP], "seq") else "unknown") + "\n")
		sys.stdout.write("     Source IP: " + (pak[IP].src if hasattr(pak[IP], "src") else "unknown") + " (port " + (str(pak[IP].sport) if hasattr(pak[IP], "sport") else "unknown") + ")\n")
		sys.stdout.write("Destination IP: " + (pak[IP].dst if hasattr(pak[IP], "dst") else "unknown") + " (port " + (str(pak[IP].dport) if hasattr(pak[IP], "dport") else "unknown") + ")\n")
		sys.stdout.write("       Payload: " + ("{none}\n" if not hasattr(pak[IP], "load") else ""))

		#write the packets (as text) to a file if specified
		if out == "y" or out == "Y":
			out_f.write("--------------------------------------------\n")
			out_f.write("     Timestamp: " + datetime.datetime.fromtimestamp(int(timestamp)).strftime('%Y-%m-%d %H:%M:%S') + "\n")
			out_f.write("    Sequence #: " + (str(pak[IP].seq) if hasattr(pak[IP], "seq") else "unknown") + "\n")
			out_f.write("     Source IP: " + (pak[IP].src if hasattr(pak[IP], "src") else "unknown") + " (port " + (str(pak[IP].sport) if hasattr(pak[IP], "sport") else "unknown") + ")\n")
			out_f.write("Destination IP: " + (pak[IP].dst if hasattr(pak[IP], "dst") else "unknown") + " (port " + (str(pak[IP].dport) if hasattr(pak[IP], "dport") else "unknown") + ")\n")
			out_f.write("       Payload: " + ("{none}\n" if not hasattr(pak[IP], "load") else ""))

	#display the payload if one exists
	if hasattr(pak[IP], "load"):
		#isolating payloads means no text formatting
		if payload == "y" or payload == "Y":
			pak[IP].load = re.sub("[^" + string.printable[:-5] + "\n]", ".", pak[IP].load)
			print pak[IP].load
			if out == "y" or out == "Y":
				out_f.write(pak[IP].load + "\n")
		else:
			#otherwise, we pretty it up
			pak[IP].load = re.sub("[^" + string.printable[:-5] + "\n]", ".", pak[IP].load)
			pak[IP].load = textwrap.wrap(str(pak[IP].load), 60)
			#display the packet
			if len(pak[IP].load) > 0:
				print pak[IP].load[0]
				for l in pak[IP].load[+1:]:
					print "                " + l
			#write the packet to a file if specified
			if out == "y" or out == "Y":
				out_f.write(pak[IP].load[0] + "\n")
				for l in pak[IP].load[+1:]:
					out_f.write("                " + l + "\n")
	print
	if out == "y" or out == "Y":
		out_f.write("\n")

try:
	#check for a pcap filter
	sys.stderr.write("Do you want to filter the network traffic (y/n)? ")
	filter = raw_input()
	if filter == "y" or filter == "Y":
		sys.stderr.write("Filter: ")
		filter = raw_input()

	#check for a payload text search
	sys.stderr.write("Do you want to search the payloads for text (y/n)? ")
	t_filter = raw_input()
	if t_filter == "y" or t_filter == "Y":
		sys.stderr.write("Text: ")
		t_filter = raw_input()

	#check for isolation of payloads
	sys.stderr.write("Do you want to isolate payloads (y/n)? ")
	payload = raw_input()

	#check for saving the packets (as text) to an output file
	sys.stderr.write("Do you want to save (as text) to an output file (y/n)? ")
	out = raw_input()
	if out == "y" or out == "Y":
		out_f = raw_input("Filename: ")
		out_f = open("./" + out_f, "w")

	#chec for reading from a cap file
	sys.stderr.write("Do you want to read from a capture file (y/n)? ")
	file = raw_input()
	if file == "y" or file == "Y":
		sys.stderr.write("Filename: ")
		file = raw_input()
		if not os.path.exists(file):
			sys.stderr.write(file + " does not exist.\n")
			sys.exit(0)

		if filter != "n" and filter != "N":
			#make a new cap file that implements the filter
			os.system("sudo tcpdump -r " + file + " -w xxxxxx.cap '" + filter + "'")
			paks = rdpcap("xxxxxx.cap")
			os.system("rm xxxxxx.cap")
		else:
			#otherwise, use the entire cap file specified
			paks = rdpcap(file)

		#start sniffing
		sys.stdout.write("Start sniffing...\n")
		for pak in paks:
			go(pak)
		sys.stdout.write("End sniffing...\n")
	else:
#		#check for saving the packets as a cap file
#		sys.stderr.write("Do you want to save to a pcap file (y/n)? ")
#		out_cap = raw_input()
#		if out_cap == "y" or out_cap == "Y":
#			out_cap_f = raw_input("Filename: ")
#
		#sniff live traffic
		if filter == "n" or filter == "N":
			paks = sniff(prn=lambda x:go(x))
		else:
			paks = sniff(filter=filter, prn=lambda x:go(x))
except KeyboardInterrupt:
	sys.exit(0)
