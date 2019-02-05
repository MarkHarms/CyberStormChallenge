# Team Name: Charity (Kimberly Atienza, Joesph Bingham, Keith Horace, Darren Johnson, Ryan Parker, Alexander Partain, Emiley Smith, Kenton Wilhelm)
# Date: 4/19/18
# Assignment: Chat Covert
# Description: This program connects to a chat server and tkes in an overt message
# then outputs the covert message.

import socket
import sys
from time import time

port = 33334
debug = True #debug mode to check timing

# Connect to chat server
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("192.168.1.100", port))

# recieve data and get the time intervals being sent in for each piece of data
data = s.recv(4096)


print data
