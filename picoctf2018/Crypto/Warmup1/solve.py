# coding: utf-8

cipher = "llkjmlmpadkkc"
key = "thisisalilkey"
tables_txt = "abcdefghijklmnopqrstuvwxyz"

table = []
for i in range(len(tables_txt)):
    table.append(tables_txt[i:len(tables_txt)] + tables_txt[:i])

flag = ''
for c, k in zip(cipher, key):
    use_row = table[tables_txt.index(k)]
    dec_index = tables_txt[use_row.index(c)]
    flag += dec_index

print(flag.upper())
