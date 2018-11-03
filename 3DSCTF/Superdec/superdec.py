def mangle(buf):
    l = len(buf)
    out = l*[0]
    i = 0
    while i < l:
        if buf[i] == 0xa:
            break
        out[i] = int(
            buf[i] + (
                (((i+22) / 2) ^ 0x1b) % 11
            )
        )
        i += 1
    return out


def demangle(buf):
    l = len(buf)
    out = l*[0]
    i = 0
    while i < l:
        if buf[i] == 0xa:
            break
        out[i] = int(
            buf[i] - (
                (((i+22) / 2) ^ 0x1b) % 11
            )
        )
        i += 1
    return out


def swap_5(buf):
    l = len(buf)
    out = l*[0]
    i = 0
    while i+4 < l:
        out[i+0] = buf[i+4]
        out[i+1] = buf[i+3]
        out[i+2] = buf[i+2]
        out[i+3] = buf[i+1]
        out[i+4] = buf[i+0]
        i += 5
    while i < l:
        out[i] = buf[i]
        i += 1
    return out


def swap_3(buf):
    l = len(buf)
    out = l*[0]
    i = 0
    while i+3 < l:  # typo? should be i+2<l
        out[i+0] = buf[i+2]
        out[i+1] = buf[i+1]
        out[i+2] = buf[i+0]
        i += 3
    while i < l:
        out[i] = buf[i]
        i += 1
    return out


def encrypt(buf):
    buf = list(map(ord, buf))
    return "".join(map(chr,
                       swap_3(swap_5(mangle(buf)))
                       ))


def decrypt(buf):
    buf = list(map(ord, buf))
    return "".join(map(chr,
                       demangle(swap_5(swap_3(buf)))
                       ))

if __name__ == "__main__":
    test = list(map(ord, "ABCDEFG"))
    assert swap_3(swap_3(test)) == test, "swap3 doesn't work"
    assert swap_5(swap_5(test)) == test, "swap5 doesn't work"
    assert demangle(mangle(test)) == test, "(de)mangle doesn't work"

    print(decrypt("dufhyuc>bi{{f0|;vwh<~b5p5thjq6goj}"))
