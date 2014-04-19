# It is possible to show that the square root of two can be expressed as an
# infinite continued fraction.

# √ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...

# By expanding this for the first four iterations, we get:

# 1 + 1/2 = 3/2 = 1.5
# 1 + 1/(2 + 1/2) = 7/5 = 1.4
# 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
# 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

# The next three expansions are 99/70, 239/169, and 577/408, but the eighth
# expansion, 1393/985, is the first example where the number of digits in
# the numerator exceeds the number of digits in the denominator.

# In the first one-thousand expansions, how many fractions contain a
# numerator with more digits than denominator?

def num_dig(n):
    dig = 0;
    while n > 0:
        dig += 1;
        n /= 10;
    return dig;

num = 3;
den = 2;
sum = 0;
for i in range (0, 1000):
    old_den = den;
    den += num;
    num = old_den + den;
    if num_dig(num) > num_dig(den):
        sum += 1

print sum # => 153
