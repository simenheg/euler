# Using names.txt, a 46K text file containing over five-thousand first
# names, begin by sorting it into alphabetical order. Then working out the
# alphabetical value for each name, multiply this value by its alphabetical
# position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which
# is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So,
# COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

def name_score(name):
    return sum(map(lambda c: ord(c) - ord('A') + 1, name))

score = 0
for i, name in enumerate(sorted(open('names.txt').read().split(','))):
    score += (i + 1) * name_score(name.strip('"'))

print(score) # => 871198282
