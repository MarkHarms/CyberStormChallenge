import socket
import sys
from time import time
from collections import defaultdict

def startDecoder(code):
    p, i = 0, 0
    output = []
    data = defaultdict(int)
    while i < len(code):
        c = code[i]        
        if c == '+':
            #Insert line for + option
        elif c == '-':
            #Insert line for - option
        elif c == '>':
            #Insert line for > option
        elif c == '<':
            #Insert line for < option
        elif c == '.':
            #Insert line for . option
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
ip = ""
port = 0
# Connect to chat server
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((ip, port))

# recieve data and get the time intervals being sent in for each piece of data
while(True):
    print(s.recv(1024).decode())  
    #print(startDecoder(s.recv(1024).decode()))

