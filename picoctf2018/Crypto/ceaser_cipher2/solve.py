# coding: utf-8

cipher = 'd]Wc7H:oW5YgUFS7]D\9fGS^iGHSUF9bHSg9WIf9q'
plain = ''

for c in cipher:
    plain += chr(ord(c) + 12)

print(plain)
