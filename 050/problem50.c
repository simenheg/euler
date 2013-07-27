/*
  The prime 41, can be written as the sum of six consecutive primes:

      41 = 2 + 3 + 5 + 7 + 11 + 13

  This is the longest sum of consecutive primes that adds to a prime below
  one-hundred.

  The longest sum of consecutive primes below one-thousand that adds to a
  prime, contains 21 terms, and is equal to 953.

  Which prime, below one-million, can be written as the sum of the most
  consecutive primes?
*/

#include <stdbool.h>
#include <stdio.h>

#define LIM 1000000

static bool prime[LIM];

bool
is_prime(int x)
{
  return prime[x] == 0;
}

void
init_prime_sieve(void)
{
  for (int i = 2; i < LIM; ++i)
    {
      if (!prime[i])
        {
          for (unsigned int j = i*i; ; j += i)
            {
              if (j >= LIM)
                break;
              prime[j] = 1;
            }
        }
    }
}

int
main(void)
{
  int terms_max = 0;
  int sum_max = 0;

  init_prime_sieve();

  for (int i = 2; i < LIM; ++i)
    {
      if (is_prime(i))
        {
          int terms = 1;
          int sum = i;

          for (int j = i + 2; j < LIM; j += 2)
            {
              if (is_prime(j))
                {
                  ++terms;
                  sum += j;

                  if (sum > LIM)
                    break;

                  if (is_prime(sum) && terms > terms_max)
                    {
                      sum_max = sum;
                      terms_max = terms;
                    }
                }
            }
        }
    }

  printf("%d\n", sum_max); /* => 997651 */
}
