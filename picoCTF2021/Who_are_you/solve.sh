#!/bin/bash

# UserAgent must be PicoBrowser
# Referer must be same origin
# Date must be within 2018
# Do not track header must be 1(Not track)
# Need to access from sweaden
# Need to speak(accept) swedish
curl http://mercury.picoctf.net:1270/ -A 'PicoBrowser' -H "Referer:http://mercury.picoctf.net:1270/" -H "Date: Wed, 21 Oct 2018 07:28:00 GMT" -H "DNT: 1" -H "X-Forwarded-For: 2.16.66.1" -H "Accept-Language: sv-SE"
