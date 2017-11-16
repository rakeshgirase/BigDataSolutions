#!/usr/bin/perl

$#ARGV == 0 or die "Usage: cat shakespeare.txt | startswith.pl searchterm \n";

$term = $ARGV[0];

while (<STDIN>){
  chop;
  $line = $_;
  $_ =~ s/[^a-zA-Z ]//g;  # only letters and spaces remain after this.
  @words = split;
  for ($i=0; $i <= $#words; $i++){
      if ( $words[$i] =~ m/^($term)/ ){
         print "$line\n"; # to STDOUT
      }
  }
}
