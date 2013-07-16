/*
  If p is the perimeter of a right angle triangle with integral length
  sides, {a,b,c}, there are exactly three solutions for p = 120.

  {20,48,52}, {24,45,51}, {30,40,50}

  For which value of p ≤ 1000, is the number of solutions maximised?
*/

#include <stdio.h>

int
main(void)
{
  int sol;
  int sol_max = 0;
  int p_max = 3;

  for (int p = 3; p <= 1000; p++)
    {
      sol = 0;
      for (int a = 1; a < p / 4; a++)
        {
          for (int b = a; b < p / 2; b++)
            {
              int c = p - a - b;
              if (a*a + b*b == c*c)
                sol++;
            }
        }
      if (sol_max < sol)
        {
          sol_max = sol;
          p_max = p;
        }
    }

  printf("%d\n", p_max); /* => 840 */
}
