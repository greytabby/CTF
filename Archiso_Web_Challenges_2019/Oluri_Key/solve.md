# Oluri Key

## Solve
アクセスするとログイン画面が表示される。
UserID,Passwordにシングルクォートを入力すると、処理中にエラーが発生しました　と表示
されるので、SQLInjectionがある。

User IDに`or 1 = 1;`を入力するとログインできて、フラグが表示された。
おそらくこんな感じでSQLを構築しているのかな。
`"SELECT * FROM users WHERE userid = '" + userid + "' AND password = '" + password + "'"`

## FLAG: WebC{N0w_y0u_c4n_l0gin_to_0ur_k3y_sys7em_0e789551}
