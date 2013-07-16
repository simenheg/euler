/*
  A perfect number is a number for which the sum of its proper divisors is
  exactly equal to the number. For example, the sum of the proper divisors
  of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect
  number.

  A number n is called deficient if the sum of its proper divisors is less
  than n and it is called abundant if this sum exceeds n.

  As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
  smallest number that can be written as the sum of two abundant numbers is
  24. By mathematical analysis, it can be shown that all integers greater
  than 28123 can be written as the sum of two abundant numbers. However,
  this upper limit cannot be reduced any further by analysis even though it
  is known that the greatest number that cannot be expressed as the sum of
  two abundant numbers is less than this limit.

  Find the sum of all the positive integers which cannot be written as the
  sum of two abundant numbers.
*/

#include <stdio.h>

int able[28123];
int abun[28123];

int
is_abundant(int n)
{
  int sum = 1;

  for (int i = n / 2; 1 < i; --i)
    if (n % i == 0) sum += i;

  if (n < sum)
    return 1;
  return 0;
}

int
main(void)
{
  for (int i = 1; i < 28123; ++i)
    if (is_abundant(i))
      abun[i] = 1;

  for (int i = 1; i < 28123 / 2; ++i)
    if (abun[i])
      for (int j = i; j < 28123 - i; ++j)
        if (!able[i + j] && abun[j])
          able[i + j] = 1;

  int sum = 0;
  for (int i = 1; i < 28123; ++i)
    if (!able[i]) sum += i;

  printf("%d\n", sum); /* => 4179871 */
}
