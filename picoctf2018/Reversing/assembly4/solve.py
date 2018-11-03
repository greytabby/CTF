s = 'pPi1clo3CdT_Ft{H11_5h_09p436_9y806u3_7c903m3'

flag = ''
for i in range(0, len(s), 2):
    flag += s[i]

for i in range(1, len(s), 2):
    flag += s[i]

print(flag)
