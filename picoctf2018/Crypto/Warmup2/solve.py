# coding: utf-8

def rot13(charcter):
    if (ord(charcter) >= 65 and ord(charcter) < 78) or (ord(charcter) >= 97 and ord(charcter) < 110):
        return chr(ord(charcter) + 13)

    if (ord(charcter) >+ 78 and ord(charcter) < 91) or (ord(charcter) >= 110 and ord(charcter) < 123):
        return chr(ord(charcter) - 13)

    return charcter


# cipher = 'cvpbPGS{guvf_vf_pelcgb!}'
cipher = 'domnuaiixifxwuymulwcjbylnivlpglc'
flag = ''

for i in cipher:
    flag += rot13(i)

print('picoCTF{' + flag + '}')
