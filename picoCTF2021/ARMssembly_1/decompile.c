# include <stdio.h>
# include <stdlib.h>

int func(int num1) {
	int sp_12 = num1;
	int sp_16 = 85;
	int sp_20 = 6;
	int sp_24 = 3;

	int sp_28 = sp_16 << sp_20;
	sp_28 = sp_28 / sp_24;
	sp_28 = sp_28 - sp_12;
	return sp_28;
}

void solve() {
	int ret = func(0);
	printf("The flag is: picoCTF{%08x}\n", ret);
}

int main(int argc, char *argv[]) {
	// add x0, x0, 8
	char *x29_28 = argv[1];
	char *x29_16 = argv[2];
	int num1 = atoi(x29_16);
	
	int ret = func(num1);
	if (ret == 0) {
		printf("%s\n", "You win!");
	} else {
		printf("%s\n", "You Lose :(");
	}

	solve();
	return 0;
}
