# include <stdio.h>
extern int asm3(int, int, int);

int main() {
    int answer;
    answer = asm3(0xb5e8e971,0xc6b58a95,0xe20737e9);
    printf("Answer: 0x%x\n", answer);
    return 0;
}


