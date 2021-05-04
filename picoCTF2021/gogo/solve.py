from ptrlib import *

password = b'reverseengineericanbarelyforward'
unhashed_key = b'goldfish'

sock = Socket('mercury.picoctf.net', 35862)
sock.sendlineafter(b'Enter Password: ', password)
sock.sendlineafter(b'What is the unhashed key?\n', unhashed_key)

sock.interactive()
