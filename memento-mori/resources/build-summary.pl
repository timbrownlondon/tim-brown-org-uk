#!/usr/bin/env perl
#
# cat people.csv | ./build-summary.pl > summary.html
use strict;

while (<>){
  chomp;
  my($name, $birth_year, $death_year, $age, $image_id) = split ',', $_;

  print "$name, $birth_year - $death_year, $age years<br>";
  print "<img src=\"https://s.tim-brown.org.uk/$image_id/small.jpg\"><p>" if $image_id; 
  print "\n";
}
