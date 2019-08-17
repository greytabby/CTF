import hashlib

string = 'MixedEggsWithJuice'
md5string = hashlib.md5(string.encode('utf-8')).hexdigest()
flag = 'saudi_' + md5string

print(flag)
