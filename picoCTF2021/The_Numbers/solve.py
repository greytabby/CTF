flagHeaderNumbers = [16, 9, 3, 15, 3, 20, 6]
flagBodyNumbers = [20, 8, 5, 14, 21, 13, 2, 5, 18, 19, 13, 1, 19, 15, 14]

alpha = 'abcdefghijklmnopqrstuvwxyz'
flagHeader = ''
flagBody = ''

for i in flagHeaderNumbers:
    flagHeader += alpha[i-1]

for i in flagBodyNumbers:
    flagBody += alpha[i-1]

# Flag format is 'PICOCTF{}' in this problem.
print('{0}{{{1}}}'.format(flagHeader.upper(), flagBody.upper()))
