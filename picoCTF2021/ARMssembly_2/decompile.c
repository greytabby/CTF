#include <stdio.h>
#include <stdlib.h>

long long func1(long long num1) {
    long long sp_12 = num1;
    long long sp_24 = 0;
    long long sp_28 = 0;

		for (; sp_28 < num1; sp_28++) {
        sp_24 = sp_24 + 3;
		}

    return sp_24;
}

int main(int argc, char *argv[]) {
    char *x29_28 = argv[1];
    char *x29_16 = argv[2];

    long long num1 = atoi(x29_16);
    printf("%lld\n", num1);
    long long x29_44 = func1(num1);
    printf("Result: %lld\n", x29_44);
    return 0;
}
