#!/usr/bin/python
import sys
import re

if len(sys.argv) < 2:
   print "Usage: cat shakespeare.txt | startswith.py searchterm \n"
   sys.exit() 

term = sys.argv[1]

startswith = re.compile("^" + term)
nonletters = re.compile("[^a-z A-Z]")

for line in sys.stdin:
  line = line[:-1] # remove '\n'
  line = nonletters.sub("", line)
  words = line.split()
  for word in words:
     if startswith.match(word):
        print word
