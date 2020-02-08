#!/bin/bash

# 問題ページがリンクしているCSSの中にフラグが書かれている
# FLAG: WebC{sty1esh3et5_c4n_be_1ink3d_6y_re1_4ttribu7e_192ecb0e}
curl https://awebc19.archiso.dev/problems/rel/style.css | grep --color=auto "WebC{.*}"
