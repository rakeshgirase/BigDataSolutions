#!/usr/bin/perl


$#ARGV >= 0 or die "Usage: cat shakespeare.txt | print_digrams2.pl searchterm1 searchterm2 ... \n";

$first_words = join('|',@ARGV);

undef $/;

$_ = <STDIN>;

# better perl than print_digrams.pl, but harder to explain to someone who doesn't know perl ...
tr/[a-zA-Z]//cs;
while(/(\b($first_words)\b \b\w+\b)/g){
   print "$1\n";
}
