#!/usr/bin/perl

#"Usage: cat shakespeare.txt | wordslines.pl \n";

while (<STDIN>){
  chop;
  $_ =~ s/[^a-zA-Z ]//g;  # only letters and spaces remain after this.
  @words = split;
  $numwords = $#words + 1;
  if ($numwords > 0){
    print "LongValueSum:words\t$numwords\n";
    print "LongValueSum:lines\t1\n";
  }
}
