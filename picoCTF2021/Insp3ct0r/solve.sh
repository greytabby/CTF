#!/bin/bash

flag1=$(curl -s https://jupiter.challenges.picoctf.org/problem/41511/ | grep -e "flag: .*" | cut -d ':' -f 2 | cut -d ' ' -f 1 |  tr -d ' ')
flag2=$(curl -s https://jupiter.challenges.picoctf.org/problem/41511/mycss.css | grep -e "flag: .*" | cut -d ':' -f 2 | cut -d ' ' -f 1 | tr -d ' ')
flag3=$(curl -s https://jupiter.challenges.picoctf.org/problem/41511/myjs.js | grep -e "flag: .*" | cut -d ':' -f 2 | cut -d ' ' -f 1 | tr -d ' ')

echo ${flag1}${flag2}${flag3}
