# coding: UTF-8
import urllib2
from bs4 import BeautifulSoup

# アクセスするURL
url = "http://bitmap01.3dsctf.org:8010/"

# URLにアクセスする htmlが帰ってくる
html = urllib2.urlopen(url)

# htmlをBeautifulSoupで扱う
soup = BeautifulSoup(html, "html.parser")

#td get
td_tag = soup.find_all('td')


#tdのなかのbgcolorを取得して文字列に変換
bites = []
for i in td_tag:
    c = i.get('bgcolor')
    bites.append(chr(int(c[1:3], 16)))
    bites.append(chr(int(c[3:5], 16)))
    bites.append(chr(int(c[5:7], 16)))

print("".join(bits))
