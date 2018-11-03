def fib(n):
    fib = [0, 1]

    for i in range(n-2):
        temp = fib[1]
        fib[1] = fib[0] + fib[1]
        fib[0] = temp

    return fib


print(hex(fib(0x43b)[1]))
