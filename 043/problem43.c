/*
  The number, 1406357289, is a 0 to 9 pandigital number because it is made
  up of each of the digits 0 to 9 in some order, but it also has a rather
  interesting sub-string divisibility property.

  Let d₁ be the 1ˢᵗ digit, d₂ be the 2ⁿᵈ digit, and so on. In this way, we
  note the following:

  d₂d₃d₄=406 is divisible by 2
  d₃d₄d₅=063 is divisible by 3
  d₄d₅d₆=635 is divisible by 5
  d₅d₆d₇=357 is divisible by 7
  d₆d₇d₈=572 is divisible by 11
  d₇d₈d₉=728 is divisible by 13
  d₈d₉d₁₀=289 is divisible by 17

  Find the sum of all 0 to 9 pandigital numbers with this property.
*/

#include <math.h>
#include <stdbool.h>
#include <stdio.h>

#define D 10

static int d[D] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
static int p[7] = {2, 3, 5, 7, 11, 13, 17};

static long sum = 0;

bool
has_property(void)
{
  for (int i = 1; i < D - 2; ++i)
    {
      int s = 100 * d[i] + 10 * d[i + 1] + d[i + 2];
      if (s % p[i - 1] != 0)
        return false;
    }
  return true;
}

bool
legal_digit(int n)
{
  for (int i = 0; i < D; ++i)
    if (d[i] == n)
      return false;
  return true;
}

void
permute_next(int index)
{
  if (index == D && has_property())
    {
      for (int i = 0; i < D; ++i)
        sum += d[i] * pow(10, D - i - 1);
      return;
    }

  for (int i = 0; i < D; ++i)
    {
      if (legal_digit(i) && !(i == 0 && index == 0))
        {
          d[index] = i;
          permute_next(index + 1);
          d[index] = -1;
        }
    }
}

int
main(void)
{
  permute_next(0);
  printf("%ld", sum); /* => 16695334890 */
}
