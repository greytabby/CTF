#!/bin/bash

# アクセスすると[Google検索(https://www.google.com/)からこのサイトにアクセスしてください。]と言われる
# Refelerをhttps://www.google.com/にしてアクセスする
# FLAG: WebC{N0w_you_acc3ssed_7his_sit3_fr0m_go0g1e_0ec9b975}
curl -H "Referer: https://www.google.com/" https://awebc19.archiso.dev/problems/ref/ | grep --color=auto -r "WebC{.*}"
