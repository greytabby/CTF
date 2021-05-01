#!/bin/bash

base64enc=bDNhcm5fdGgzX3IwcDM1
base64dec=$(echo ${base64enc} | base64 -d)

echo Flag is:
echo "picoCTF{${base64dec}}"
