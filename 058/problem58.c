/*
  Starting with 1 and spiralling anticlockwise in the following way, a
  square spiral with side length 7 is formed.

  37 36 35 34 33 32 31
  38 17 16 15 14 13 30
  39 18  5  4  3 12 29
  40 19  6  1  2 11 28
  41 20  7  8  9 10 27
  42 21 22 23 24 25 26
  43 44 45 46 47 48 49

  It is interesting to note that the odd squares lie along the bottom right
  diagonal, but what is more interesting is that 8 out of the 13 numbers
  lying along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.

  If one complete new layer is wrapped around the spiral above, a square
  spiral with side length 9 will be formed. If this process is continued,
  what is the side length of the square spiral for which the ratio of primes
  along both diagonals first falls below 10%?
*/

#include <math.h>
#include <stdio.h>

int
is_prime(unsigned int x)
{
  int lim = sqrt(x) + 1;

  for (int j = 3; j < lim; j += 2)
    {
      if (x % j == 0)
        return 0;
    }

  return 1;
}

int
spiral_side_length(float ratio)
{
  int current = 1;
  int numbers = 1;
  int primes = 0;
  int step = 2;

  for (int i = 0; ; i++, step += 2)
    {
      for (int j = 0; j < 4; j++)
        {
          current += step;
          if (is_prime(current))
            primes++;
          numbers++;
        }
      
      if ((float)primes / numbers < ratio)
        return step + 1;
    }
}

int
main(void)
{
  printf("%d\n", spiral_side_length(0.1)); // => 26241
}
