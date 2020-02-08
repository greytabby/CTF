#!/bin/bash

# 普通にアクセスすると [NCSA Mosaicのバージョン2.0からアクセスしてください。] と言われるので
# UserAgentをNCSA Mosaicのバージョン2.0にしてアクセスする
# FLAG: WebC{D0_y0u_s7ill_u5e_Wind0ws_3.1_in_thi5_c3ntury?_cc6efe69}
curl https://awebc19.archiso.dev/problems/agent/ -A "NCSA_Mosaic/2.0 (Windows 3.1)" | grep --color=auto "WebC{.*}"
