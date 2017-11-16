#!/usr/bin/python
import sys
import re

nonletters = re.compile("[^a-zA-Z ]")

for line in sys.stdin:
  line = nonletters.sub( "", line )
  words = line.split()
  if len(words) > 0:
        print "LongValueSum:words\t{0:d}".format( len(words) )
        print "LongValueSum:lines\t1"

