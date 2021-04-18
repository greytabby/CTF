import binascii

def enc(flag):
    # for i in range(0, len(flag), 2):
    #     num1 = (ord(flag[i]) << 8) + ord(flag[i+1])
    #     num2 = ord(flag[i+1])
    #     print(num1, num2)
    # ''.join([hex((ord(flag[i]) << 8) + ord(flag[i + 1])) for i in range(0, len(flag), 2)])
    ''.join([hex((ord(flag[i]) << 8) + ord(flag[i + 1])) for i in range(0, len(flag), 2)])

hexenc = b'7069636f4354467b31365f626974735f696e73743334645f6f665f385f30346330373630647d'
print(hexenc.decode('hex'))
