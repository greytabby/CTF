# coding: utf-8

key = {'e': 't',
       'q': 'h',
       'b': 'e',
       'm': 'a',
       'x': 'n',
       'l': 'd',
       'z': 'i',
       'j': 'g',
       'w': 's',
       'a': 'u',
       'k': 'o',
       'v': 'b',
       'u': 'f',
       'o': 'l',
       's': 'v',
       'y': 'c',
       'd': 'p',
       'i': 'm',
       'c': 'w',
       'h': 'y',
       'g': 'k',
       'f': 'x',
       'r': 'r',
       'p': 'j',
       'n': 'q',
       't': 'z'
       }

f = open('cipher.txt', 'r')
txt = f.read()
f.close()

plain = ''

for s in txt:
    if s in key.keys():
        plain += key[s]
    else:
        plain += s

print(plain)
