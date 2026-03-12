#!/usr/bin/env perl
#
# assumes 99 images in flags directory
# shuffles them into groups of 9
# and makes 3x3 montage for each group
# placed in montage directory

use strict;
use List::Util qw(shuffle);

my @files = shuffle glob 'flags/*';

for my $i (0..10){
  my $index = $i * 9;
  
  my $file_list =  join ' ', @files[$index..$index+8];
  my $cmd = "magick montage $file_list -tile 3x3 -geometry +0+0 montage/$i.png";
  qx ($cmd);
}

