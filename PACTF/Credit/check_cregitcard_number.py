# coding:utf-8
import sys

"""
クレジットカード番号が正しい番号かどうか判定する
判定方法
1.クレジットカード番号の奇数桁をそれぞれ2倍にする
2.2倍した結果が10以上となる場合は、その数字から9を引く
3.それらの数字を全て足し、10の倍数であれば正しいクレジットカード番号
"""
def check_number(digits):
    _sum = 0
    alt = False
    for d in reversed(digits):
        assert 0 <= d <= 9
        if alt:
            d *= 2
            if d > 9:
                d -= 9
        _sum += d
        alt = not alt
    return (_sum % 10) == 0

f = open("cc_leak.txt.eecc6f896436", "r")
for line in f.readlines():
    num = [x for x in line]
    ls = []
    for i in range(16):
        ls.append(int(num[i]))

    if check_number(ls):
        pass
    else:
        print("flag :%s\n" % line)

c = 0
#for line in f.readlines():
#    card_number = [x for x in line]
#    odd_list = []
#    for i in range(16):
#        if i % 2 == 0:
#            num = int(card_number[i]) * 2
#            if num > 10:
#                num -= 9
#            odd_list.append(num)
#        else:
#            num = int(card_number[i])
#            odd_list.append(num)
#
#    result = sum(odd_list)
#    if result % 10 != 0:
#        print("flag :%s\n" % line)
#        #sys.exit()
#    print(c)
#    c += 1

f.close()

