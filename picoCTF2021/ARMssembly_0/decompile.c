#include <stdio.h>
#include <stdlib.h>

int func1(int num1, int num2) {
	if (num1 < num2) {
		return num2;
	}
	return num1;
}

int main(int argc, char *argv[]) {
	// int num1 = atoi(argv[1]);
	// int num2 = atoi(argv[2]);
	int num1 = 1765227561;
	int num2 = 1830628817;
	int result = func1(num1, num2);
	printf("Flag: picoCTF{%x}\n", result);
	return 0;
}
