# coding:utf-8
from stegano import lsb

plain = lsb.reveal('./pico2018-special-logo.bmp')
print(plain)
