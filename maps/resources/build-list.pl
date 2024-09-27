#!/usr/bin/env perl
#
# cat maps.csv | ./build-list.pl > maps.html
use strict;

while (<>){
  chomp;
  my($image_id, $title, $description) = split /\|/, $_;

  print "<h1>$title</h1>";
  print "<img src=\"https://s.tim-brown.org.uk/$image_id/large.jpg\" class=\"responsive\"><br>";
  print $description, '<br>';
  print "\n";
}
