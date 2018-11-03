# coding: utf-8
# encodeを解析してdecode関数を自作する

def ROR(x, n, bits = 32):
    mask = (2**n) - 1
    mask_bits = x & mask
    return (x >> n) | (mask_bits << (bits - n))
 
def ROL(x, n, bits = 32):
    return ROR(x, bits - n, bits)

cipher = map(lambda i: '0x' + i, '11 80 20 E0 22 53 72 A1 01 41 55 20 A0 C0 25 E3 45 20 35 05 70 20 95 50 C1'.split(' '))
xor = 0x16

flag = ''

for c in cipher:
    after_xor = int(c, 16) ^ xor
    flag += chr(ROR(after_xor, 4, 8))

print(flag)
