# The nth term of the sequence of triangle numbers is given by,
# tₙ = ½n(n+1); so the first ten triangle numbers are:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# By converting each letter in a word to a number corresponding to its
# alphabetical position and adding these values we form a word value. For
# example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word
# value is a triangle number then we shall call the word a triangle word.

# Using words.txt, a 16K text file containing nearly two-thousand common
# English words, how many are triangle words?

def word_score(word):
    return sum([ord(c) - ord('A') + 1 for c in word])

triangles = [n/2 * (n+1) for n in range(1, 100)]

print(sum(1 for word in open("words.txt").read().split(",")
          if word_score(eval(word)) in triangles)) # => 162
