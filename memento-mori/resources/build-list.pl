#!/usr/bin/env perl
#
# cat src-people.txt | ./build-list.pl > people.txt
use strict;

while (<>){
  chomp;
  my($name, $birth_year, $death_year, $age) = split ',', $_;

  print "$name<br>$birth_year - $death_year<br>$age years\n";
}
