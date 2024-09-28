#!/usr/bin/env perl
#
# cat people.psv | ./build-list.pl > people.html
use strict;

while (<>){
  chomp;
  my($image_id, $name, $birth_year, $death_year, $age) = split /\|/, $_;

  print "<h1>$name<br>$birth_year - $death_year<br>$age years</h1>$image_id";
  print "<img src=\"https://s.tim-brown.org.uk/$image_id/large.jpg\" class=\"responsive\">" if $image_id; 
  print "\n";
}
