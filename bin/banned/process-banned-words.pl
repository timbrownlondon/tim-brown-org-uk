#!/bin/env perl
use strict;
use Digest::MD5 qw(md5_hex);

# cat bin/banned/banned-words-list.txt | bin/banned/process-banned-words.pl > banned/words.js

print "const data = [\n";

# STDIN is list of words or phrases
for my $txt ( <> ){
  chomp $txt;

  my $fg = '#' . substr(md5_hex($txt), 0, 6);

  my $red   = hex(substr($fg, 1, 2));
  my $green = hex(substr($fg, 3, 2));
  my $blue  = hex(substr($fg, 5, 2));

  my $bg = sprintf('#%02x%02x%02x', 255 - $red, 255 - $green, 255 - $blue);
  print qq({fg: "$fg", bg: "$bg", txt: "$txt"},\n);
}

print "];\n";

