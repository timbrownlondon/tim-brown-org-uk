#!/usr/bin/env perl
#
# cat people.psv | ./build-summary.pl > summary.html
use strict;

while (<>){
  chomp;
  my($image_id, $name, $birth_year, $death_year, $age) = split /\|/, $_;

  print "$name, $birth_year - $death_year, $age years<br>";
  print "<img src=\"https://s.tim-brown.org.uk/$image_id/small.jpg\"><p>" if $image_id; 
  print "\n";
}
