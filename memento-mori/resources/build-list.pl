#!/usr/bin/env perl
#
# cat people.txt | ./build-list.pl > people.html
use strict;

while (<>){
  chomp;
  my($name, $birth_year, $death_year, $age, $image_id) = split ',', $_;

  print "<h1>$name<br>$birth_year - $death_year<br>$age years</h1>";
  print "<img src=\"https://s.tim-brown.org.uk/$image_id/large.jpg\" class=\"responsive\">" if $image_id; 
  print "\n";
}
