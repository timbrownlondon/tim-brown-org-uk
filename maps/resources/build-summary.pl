#!/usr/bin/env perl
#
# cat maps.csv | ./build-summary.pl > summary.html
use strict;

while (<>){
  chomp;
  my($image_id, $title, $description) = split /\|/, $_;

  print "$title, $description<br>";
  print "<img src=\"https://s.tim-brown.org.uk/$image_id/small.jpg\"><p>\n";
}
