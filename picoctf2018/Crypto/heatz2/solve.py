# codeing: utf-8

# 頻度分析したり一部わかっている文字から単語を推測したりして無理やり解読

cipher = "Rdi xnfba ogemq tey snjhc ekig rdi uwzp lev. F bwq'r oiufiki rdfc fc cnbd wq iwcp hgeouij fq Hfbe. Fr'c wujecr wc ft F ceukil w hgeouij wugiwlp! Eawp, tfqi. Digi'c rdi tuwv: hfbeBRT{cnocrfrnrfeq_bfhdigc_wgi_ree_iwcp_kcbgcnlevm}'"

key = {'a': 'k',
       'b': 'c',
       'c': 's',
       'd': 'h',
       'e': 'o',
       'f': 'i',
       'g': 'r',
       'h': 'p',
       'i': 'e',
       'j': 'm',
       'k': 'v',
       'l': 'd',
       'm': 'w',
       'n': 'u',
       'o': 'b',
       'p': 'y',
       'q': 'n',
       'r': 't',
       's': 'j',
       't': 'f',
       'u': 'l',
       'v': 'g',
       'w': 'a',
       'x': 'q',
       'y': 'x',
       'z': 'z'
       }

plain = ''
for c in cipher:
    if c.lower() in key.keys():
        if c.isupper():
            plain += key[c.lower()].upper()
        else:
            plain += key[c.lower()]

        continue

    plain += c

print(plain)
