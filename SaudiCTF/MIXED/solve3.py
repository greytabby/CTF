import hashlib

# secret word :butWithoutKetchupHaha
# Flag :saudi_f91e71ac8ac062e1191e3a15d754d611

f = open('3.txt', 'r')
s = f.read()
f.close()
o = 'PIZZAwithCheese'
l = len(o)

cp = 'CheesePIZZA'

strings = s.split('with')

for i in strings:
    if i != cp:
        print(i)

string = 'butWithoutKetchupHaha'
md5string = hashlib.md5(string.encode('utf-8')).hexdigest()
flag = 'saudi_' + md5string
print(flag)
