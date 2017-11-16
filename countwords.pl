#!/usr/bin/perl

$#ARGV >= 0 or die "Usage: cat shakespeare.txt | countwords.pl searchterm1 searchterm2 ... \n";

@terms = @ARGV;

while (<STDIN>){
  chop;
  $_ =~ s/[^a-zA-Z ]//g;  # only letters and spaces remain after this.
  @words = split;
  for ($i=0; $i <= $#words; $i++){
      for ($j=0; $j <= $#terms; $j++){
         if ( $words[$i] eq $terms[$j] ){
            print "LongValueSum:$terms[$j]\t1\n";
         }
      }
  }
}
