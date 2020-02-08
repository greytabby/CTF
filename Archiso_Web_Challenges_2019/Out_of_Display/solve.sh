#!/bin/bash

# HTMLのコメントにフラグが書かれている
# FLAG: WebC{0ops_y0u_c4n_find_m3_8356eb46}
curl https://awebc19.archiso.dev/problems/out_of_display/| grep --color=auto -r "WebC{.*}"
