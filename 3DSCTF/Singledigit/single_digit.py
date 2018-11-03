from pwn import *
import time
import sys

"""
+++     3DSCTF - Single Digit Problem     +++

 [+] For this game, you need to type an expression that the answer is the
     requested number.

 [+] Allowed symbols: ( + - * / )

 [+] Limit of 31 characters

 [+] Numbers need to be less than 100000

 [+] Type 'start' to start: start
     Let's go...

 [+] Challenge 1 - The number 1 using only the digit 5: 5/5
 [+] Correct!

 [+] Challenge 2 - The number 2 using only the digit 5: (5+5)/5
 [+] Correct!

 [+] Challenge 3 - The number 3 using only the digit 8:
 [-] Whops! Time over...
     Closing the connection...
"""

HOST = 'sdp01.3dsctf.org'
PORT = '8003'

#first enc for flag
conn = remote(HOST, PORT)

rec = conn.recvuntil("start:")
print(rec)
time.sleep(0.5)
conn.sendline("start")

for i in xrange(100):
    rec = conn.recvuntil(":")
    print(rec)
    s = ''
    if 'flag' in rec:
        break

    if "Challenge" in rec:
        tmp = rec.split(" ")[::-1]
        correct = tmp[5]
        only_use = tmp[0][0]
        change_flag = False
        root_flag = False

        intcor = int(correct)

        if intcor >= 22:
            if only_use == '2':
                only_use = '22'
                change_flag = True

        if intcor >= 33:
            if only_use == '3':
                only_use = '33'
                change_flag = True

        if intcor >= 44:
            if only_use == '4':
                only_use = '44'
                change_flag = True

        if intcor >= 55:
            if only_use == '5':
                only_use = '55'
                change_flag = True

        if intcor >= 66:
            if only_use == '6':
                only_use = '66'
                change_flag = True

        if intcor >= 77:
            if only_use == '7':
                only_use = '77'
                change_flag = True

        if intcor >= 88:
            if only_use == '8':
                only_use = '88'
                change_flag = True

        if intcor >= 99:
            if only_use == '9':
                only_use = '99'
                change_flag = True

        if intcor > 1:
            if only_use == '1':
                only_use = '11'
                change_flag = True

        payload = ''
        if int(only_use) ** 2 <= int(correct):
            payload += only_use + '*' + only_use
            print(correct)
            root_flag = True
            if int(only_use) ** 2 == int(correct):
                print(payload)
                conn.sendline(payload)
                continue
            else:
                correct = str(int(correct) - (int(only_use) ** 2))
                payload += '+'

        div = int(correct) // int(only_use)
        mod = int(correct) % int(only_use)
        div_pay = ''
        mod_pay = ''
        print(div, mod)

        if only_use == '11' and int(correct) > 89:
            tmp = 100 - int(correct)
            payload += '111-11'
            for c in range(tmp):
                payload += '-1'
            print(payload)
            conn.sendline(payload)
            continue

        if div > 0:
            div_pay += only_use
            for c in range(div - 1):
                div_pay += '+' + only_use

            if only_use == '11' and mod > 5:
                print('11change!!')
                #div_pay = div_pay[:len(div_pay)]
                div_pay += '+' + only_use
                only_use = '1'
                for c in range(11 - mod):
                    div_pay += '-' + only_use

                payload += div_pay
                print(payload)
                conn.sendline(payload)
                continue

            if mod != 0:
                if change_flag:
                    if only_use == '11':
                        only_use = '1'
                    elif only_use == '22':
                        only_use = '2'
                    elif only_use == '33':
                        only_use = '3'
                    elif only_use == '44':
                        only_use = '4'
                    elif only_use == '55':
                        only_use = '5'
                    elif only_use == '66':
                        only_use = '6'
                    elif only_use == '77':
                        only_use = '7'
                    elif only_use == '88':
                        only_use = '8'
                    elif only_use == '99':
                        only_use = '9'

                    cdiv = mod // int(only_use)
                    cmod = mod % int(only_use)
                    print('change')
                    print(cdiv, cmod)

                    cd_pay = ''
                    cd_pay += only_use
                    for c in range(cdiv - 1):
                        cd_pay += '+' + only_use

                    cm_pay = ''
                    cm_pay += '(' + only_use
                    for c in range(cmod - 1):
                        cm_pay += '+' + only_use
                    cm_pay += ')/' + only_use

                    payload += div_pay
                    if cdiv > 0 and cmod > 0:
                        payload += '+' + cd_pay + '+' + cm_pay
                    elif cdiv == 0 and cmod > 0:
                        payload += '+' + cm_pay
                    elif cdiv > 0 and cmod == 0:
                        payload += '+' + cd_pay

                    print(payload)
                    conn.sendline(payload)
                    continue


        if mod > 0:
            if only_use == '11':
                only_use = '1'
            elif only_use == '22':
                only_use = '2'
            elif only_use == '33':
                only_use = '3'
            elif only_use == '44':
                only_use = '4'
            elif only_use == '55':
                only_use = '5'
            elif only_use == '66':
                only_use = '6'
            elif only_use == '77':
                only_use = '7'
            elif only_use == '88':
                only_use = '8'
            elif only_use == '99':
                only_use = '9'

            mod_pay += '(' + only_use
            for c in range(mod - 1):
                mod_pay += '+' + only_use
            mod_pay += ')/' + only_use

        if div > 0 and mod > 0:
            payload += div_pay + '+' + mod_pay
        elif div == 0 and mod > 0:
            payload += mod_pay
        elif div > 0 and mod == 0:
            payload += div_pay

        print(payload)
        conn.sendline(payload)
        correct = ''
        only_use = ''

conn.interactive()
rec = conn.recvline()
print(rec)
