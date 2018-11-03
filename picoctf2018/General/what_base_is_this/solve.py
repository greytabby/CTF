from pwn import *
import codecs

host = "2018shell3.picoctf.com"
port = 15853

p = remote(host, port)
ret = p.recvline()
ret = p.recvline()
problem = str(p.recvline()).split(' ')

answer = ''
for b in problem:
    if b.isdigit():
        answer += chr(int(b, 2))

print(answer)
p.sendline(answer)

problem = str(p.recvline()).split(' ')
problem = str(p.recvline()).split(' ')
problem = str(p.recvline()).split(' ')
print(problem)
answer = codecs.decode(bytes(problem[4].encode("ascii")), encoding='hex')

print("anser", answer)
p.sendline(answer)

problem = str(p.recvline()).split(' ')
problem = str(p.recvline()).split(' ')
print(problem)
answer = ''
for b in problem:
    if b.isdigit():
        answer += chr(int(b, 8))

print("anser", answer)
p.sendline(answer)

p.interactive()
