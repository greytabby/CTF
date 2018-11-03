#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <limits.h>

#define MAX_NUM_LEN 12
#define HOTSTREAK 3
#define MAX_WINS 16
#define ONE_BILLION 1000000000
#define ROULETTE_SIZE 36
#define ROULETTE_SPINS 128
#define ROULETTE_SLOWS 16
#define NUM_WIN_MSGS 10
#define NUM_LOSE_MSGS 5

long cash = 0;

long get_rand(long s) {
  long seed;
  seed = s;
  if (seed < 0) seed = seed * -1;
  srand(seed);
  return seed;
}

int main(int argc, char *argv[]) {
  setvbuf(stdout, NULL, _IONBF, 0);
  long l;
  printf("Enter first cash of roulette: ");
  scanf("%ld", &l);

  cash = get_rand(l);
  long tmp;
  char s;
  for (int i = 0; i < 16; i++) {
      printf("%d Next: %ld\n", i, (rand() % ROULETTE_SIZE) + 1);
      tmp = rand();
      scanf("%c", &s);
  }

  return 0;
}
