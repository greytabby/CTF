#!/bin/bash

# <p>タグの中にフラグが書かれているが、文字色が白にされているので、画面上見えない
# FLAG: WebC{7his_f1ag_i5_whit3d_0ut_0d856efe}
curl https://awebc19.archiso.dev/problems/whited_out/ | grep --color=auto "WebC{.*}"
