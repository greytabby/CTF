s = "cvpbPGS{arkg_gvzr_V'yy_gel_2_ebhaqf_bs_ebg13_MAZyqFQj}"

d = {}
for c in (65, 97):
    for i in range(26):
        d[chr(i+c)] = chr((i+13) % 26 + c)

print "".join([d.get(c, c) for c in s])
