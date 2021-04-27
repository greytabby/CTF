#!/bin/bash

flag1=$(curl -s http://mercury.picoctf.net:44070 | grep -e "flag: .*" | cut -d ':' -f 2 | cut -d ' ' -f 2)
flag2=$(curl -s http://mercury.picoctf.net:44070/mycss.css | grep -e "part 2: .*" | cut -d ':' -f 2 | cut -d ' ' -f 2)
flag3=$(curl -s http://mercury.picoctf.net:44070/robots.txt | grep -e "Part 3: .*" | cut -d ':' -f 2 | cut -d ' ' -f 2)
flag4=$(curl -s http://mercury.picoctf.net:44070/.htaccess | grep -e "Part 4: .*" | cut -d ':' -f 2 | cut -d ' ' -f 2)
flag5=$(curl -s http://mercury.picoctf.net:44070/.DS_Store | grep -e "Part 5: .*" | cut -d ':' -f 2 | cut -d ' ' -f 2)

echo ${flag1}${flag2}${flag3}${flag4}${flag5}
