from pwn import *
import re
import time

host = "tekeisan-ekusutoriim.chall.beginners.seccon.jp"
port = 8690

p = remote(host, port)

pattern = r"[0-9]* \* [0-9]* ="
##[!!] Wrong, see you.
for i in range(11):
    r = p.recvline()
    print(r)

print("for end")
time.sleep(0.2)
for i in range(100):
    r = p.recvline()
    time.sleep(0.2)
    r = p.recv(200)
    print(r)
    ret = r.split()

    result = 0
    if ret[1] == "+":
        result = int(ret[0]) + int(ret[2])
    elif ret[1] == "-":
        result = int(ret[0]) - int(ret[2])
    elif ret[1] == "/":
        result = int(ret[0]) / int(ret[2])
    elif ret[1] == "*":
        result = int(ret[0]) * int(ret[2])

    p.sendline(str(result))

p.interactive()
