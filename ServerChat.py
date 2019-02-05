import socket
import time
import _thread
import sys
import MySQLdb
def char2bf(char):
    """Convert a char to brainfuck code that prints that char."""

    result_code = ""
    ascii_value = ord(char)
    factor = ascii_value / 10
    remaining = ascii_value % 10

    result_code += "%s\n" % ("+" * 10)
    result_code += "[\n"
    result_code += "  >\n"
    result_code += "  %s\n" % ("+" * int(factor))
    result_code += "  <\n"
    result_code += "  -\n"
    result_code += "]\n"
    result_code += ">\n"
    result_code += "%s\n" % ("+" * int(remaining))
    result_code += ".\n"
    result_code += "[-]\n"

    return result_code


def str2bf(string):
    """Convert a string to brainfuck code that prints that string."""

    result = ""
    for char in string:
        result += char2bf(char)

    return result


def print_help():
    """Print the help message."""
    message = "python %s: missing arguments\n\n" % sys.argv[0]
    message += "Usage: %s [OPTIONS] STRING\n" % sys.argv[0]
    message += "Options:\n"
    message += "  -h, --help          displays this help message.\n"
    message += "  -s, --small         prints the code in one liner.\n"
    message += "  -n, --newline       adds a new line character "
    message += "at the end of the string.\n"
    sys.stderr.write(message)

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
password_list = ['chair', 'phone', 'knife','phone','chair', 'phone', 'knife','phone','tennis', 'baseball', 'hockey', 'basketball', 'golf','knife','phone','tennis', 'baseball', 'hockey', 'basketball', 'golf']
port = 31349
s.bind(("",port))
client_list = []
s.listen(0)

'','jsl039','Password','projectCSC446'
db = MySQLdb.connect(host="23.229.173.35", user="jsl039", passwd="Password", db="projectCSC446")
cur = db.cursor()

def startEncode(inputStr):
    """Reads the arguments from stdin and outputs the code."""
    add_new_line = False
    small_output = True
    input_string = " ".join(inputStr)

    result = str2bf(input_string + ("\n" * add_new_line))
    if small_output:
        result = result.replace(" ", "").replace("\n", "")


    #print(result
    return(result)
i = 0
def broadcast(message): 
    for clients in client_list: 
        try: 
            clients.send(message) 
        except: 
            clients.close() 
  
                # if the link is broken, we remove the client 
            remove(clients) 
  
def clientthread(conn, addr): 
    global i
    while True: 
        #output = '++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.'   
        #message_to_send = "<" + addr[0] + "> " + message
        cur.execute("UPDATE challengeTable SET Password = '"+password_list[i]+"' WHERE Challenge = '1' ")
        db.commit()
        broadcast(startEncode(password_list[i]).encode('utf-8')) 
        #conn.send(startEncode(password_list[i]).encode('utf-8'))
        time.sleep(15)
        i+=1
def remove(connection): 
    if connection in client_list: 
        client_list.remove(connection) 
                  

while True:
    conn, addr = s.accept() 
  
    """Maintains a list of clients for ease of broadcasting 
    a message to all available people in the chatroom"""
    client_list.append(conn)
    # creates and individual thread for every user  
    # that connects 
    _thread.start_new_thread(clientthread,(conn,addr))
    

c.close()



