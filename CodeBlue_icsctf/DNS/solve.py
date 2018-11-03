import base64

f = open('flag.txt','r')
dec = ""
flag_en = ""
flag = ""

for row in f:
    end = len(row) - 3

    ls = row[35:end].split("{")
    #print(ls[1])
    flag_en += ls[1]

#print(flag_en)

flag = flag_en.decode("base64")
print(flag)
