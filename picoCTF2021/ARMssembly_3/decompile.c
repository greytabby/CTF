#include <stdio.h>
#include <stdlib.h>

unsigned long int func2(unsigned long int arg) {
    return arg+3;
}

unsigned long int func1(unsigned long int arg) {
    unsigned long int x29_28 = arg;
    unsigned long int x29_44 = 0;

    while (x29_28 != 0) {
        if ((x29_28 & 1) != 0) {
            x29_44 = func2(x29_44);
        }
        x29_28 = x29_28 >> 1;
    }
    return x29_44;
}

int main(int argc, char *argv[]) {
    unsigned long int arg = strtoul(argv[1], NULL, 10);
    printf("Arg: %ld\n", arg);
    unsigned long int result = func1(arg);
    printf("Result: %ld\n", result);
    printf("Flag: picoCTF{%08lx}\n", result); // printFlag
    return 0;
}
