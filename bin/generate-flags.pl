#!/usr/bin/env perl
#
# generates a randomly coloured St George's cross flag
# 1400x1000 px png
# placed in flags directory

use strict;

my @hex = split '', '0123456789abcdef';

sub rand_hex {
  return $hex[int rand()*16]
}

sub rand_hex_colour {
  return rand_hex() . rand_hex() . rand_hex(); 
}

my $bg = rand_hex_colour();
my $fg = rand_hex_colour();

qx(magick -size 1400x1000 canvas:#$bg -fill '#$fg' -draw 'rectangle 600,0 800,1000' -draw 'rectangle 0,400 1400,600' flags/$bg-$fg.png);
