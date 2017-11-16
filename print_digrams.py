#!/usr/bin/python
import sys
import re

if len(sys.argv) < 2:
   print "Usage: cat shakespeare.txt | print_digrams.py searchterm1 searchterm2  ... \n"
   sys.exit() 

pattern = "|".join( sys.argv[1:] )  # append args[1], args[2] ... args[n]
print "pattern= ", pattern
searchterm = re.compile( pattern )

nonletters = re.compile("[^a-z A-Z]")

for line in sys.stdin:
  line = line[:-1]  # remove new line
  line = nonletters.sub("", line)
  words = line.split()
  for i in range(len(words)-1):
     if searchterm.match(words[i]):
        print words[i] + " " + words[i+1]

  
