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
