#!/usr/bin/python
import sys

for line in sys.stdin:
  fields = line.split()
  if len(fields) > 0:
        # from to TAB 1
        print "LongValueSum:{0} {1}\t1".format( fields[0], fields[1] )

