import hashlib

o = open('./2.txt', 'r').read()

string = ''
for i in o:
    if not i.isupper():
        string += i

md5string = hashlib.md5(string.encode('utf-8')).hexdigest()
flag = 'saudi_' + md5string
print(flag)

# saudi9991337 md5:a75ac3b19bf9378032b8f1f792175b76
# Flag: saudi_a75ac3b19bf9378032b8f1f792175b76
