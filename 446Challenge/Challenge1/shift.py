#!/usr/bin/python

#shifts the packets in a pcap file to the specified date/time
#written by Dr. Jean Gourd
#last updated on 2017-01-05
#steal this and suffer...
#bool crap

#requires python-scapy

import datetime
import sys

from scapy.all import *

# display usage
args = sys.argv
if len(args) < 4:
	sys.stderr.write("Usage:\n");
	sys.stderr.write(" For a constant timestamp: " + args[0] + " <infile> <outfile> <yy-mm-dd hh:mm:ss>\n")
	sys.stderr.write(" For a timestamp range:    " + args[0] + " <infile> <outfile> <yy-mm-dd hh:mm:ss> <yy-mm-dd hh:mm:ss>\n")
	sys.exit(1)

# assume a constant date
range = False

# make sure the input/oputput files were specified
infile = args[1]
outfile = args[2]
if not os.path.exists(infile):
	sys.stderr.write(infile + " does not exist.\n")
	sys.exit(1)

# read the input file
paks = rdpcap(infile)

# set the date (either a constant or a range)
d = args[3]
# a date range was specified
if len(args) == 5:
	range = True

	# set the min and max dates in the range
	min_date = d
	max_date = args[4]
	# format them for the packets
	min_date = time.mktime(datetime.datetime.strptime(min_date, "%y-%m-%d %H:%M:%S").timetuple())
	max_date = time.mktime(datetime.datetime.strptime(max_date, "%y-%m-%d %H:%M:%S").timetuple())
	# compute the date difference and the delta (based on the number of packets in the input file)
	diff = max_date - min_date
	delta = diff / len(paks)

	# set the initial timestamp
	ts = min_date
# a constant date was specified
else:
	# set the timestamp to the constant date
	ts = time.mktime(datetime.datetime.strptime(d, "%y-%m-%d %H:%M:%S").timetuple())

for pak in paks:
	pak.time = ts
	# increase the timestamp by the delta id a range was specified
	if range:
		ts = ts + delta

# write the output file
wrpcap(outfile, paks)
