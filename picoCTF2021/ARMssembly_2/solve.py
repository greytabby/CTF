inputNum = 3848786505
print(hex(inputNum*3))
print(hex((3 * inputNum) & 0xffffffff))
print(bin(inputNum*3))
print(bin((3 * inputNum) & 0xffffffff))
flag = hex((3 * inputNum) & 0xffffffff)[2:]
print("Flag is: picoCTF{{{}}}".format(flag))
