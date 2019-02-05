# Team Name: Charity (Kimberly Atienza, Joesph Bingham, Keith Horace, Darren Johnson, Ryan Parker, Alexander Partain, Emiley Smith, Kenton Wilhelm)
# Date: 4/19/18
# Assignment: Chat Covert
# Description: This program connects to a chat server and tkes in an overt message
# then outputs the covert message.

import socket
import sys
from time import time
from collections import defaultdict

def brain_luck(code):
    p, i = 0, 0
    output = []
    data = defaultdict(int)
    while i < len(code):
        c = code[i]
        
        if c == '+': data[p] = (data[p] + 1) % 256
        elif c == '-': data[p] = (data[p] - 1) % 256
        elif c == '>': p += 1
        elif c == '<': p -= 1
        elif c == '.': output.append(chr(data[p]))
        elif c == '[':
            if not data[p]:
                depth = 1
                while depth > 0:
                    i += 1
                    c = code[i]
                    if c == '[': depth += 1
                    elif c== ']': depth -= 1
        elif c == ']':
            if data[p]:
                depth = 1
                while depth > 0:
                    i -= 1
                    c = code[i]
                    if c == ']': depth += 1
                    elif c == '[': depth -= 1
        
        i += 1
    return ''.join(output)
port = 31359
debug = True #debug mode to check timing

# Connect to chat server
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("138.47.149.166", port))

# recieve data and get the time intervals being sent in for each piece of data
while(True):
    data = s.recv(4096)
    print(brain_luck(data.decode('utf-8')))
