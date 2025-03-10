#!/usr/bin/env perl
#
# cat people.psv | ./build-list.pl > people.html
use strict;

while (<>){
  chomp;
  my($image_id, $ext, $name, $birth_year, $death_year, $age) = split /\|/, $_;
  next unless $image_id;

  print "<p>$name</p><img src=\"https://s.tim-brown.org.uk/t/$image_id/small.jpg\"><hr>\n";
}
