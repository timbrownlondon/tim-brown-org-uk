#!/usr/bin/env perl
#
# cat resources/data.psv | resources/build-list.pl > catalog/list.html

use strict;

while (<>){
  chomp;
  my($image_id, $title, $description) = split /\|/, $_;
  next unless $image_id;

  print "<p>$title</p><img src=\"https://s.tim-brown.org.uk/$image_id/medium.jpg\"><hr>\n";
}
