#!/usr/bin/env perl
#
# usage:
# cat resources/data.psv | resources/build-to-do.pl > to-do.html

use strict;

while (<>){
  my($image_id, $extension, $title, $born, $died, $age) = split /\|/, $_;

  next if $image_id;
  print;

}
