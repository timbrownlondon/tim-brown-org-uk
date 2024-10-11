#!/usr/bin/env perl
#
# usage:
# cat resources/titles.txt | resources/build-vars.pl
#
# this writes a set of vars files in the working directory

use strict;
my $n = 1;

while (<>){
  next if m/^#/;
  chomp;
  my @field = split /\|/, $_;

  my $file = 'vars-'.$n++.'.html';
  print "Writing to $file\n";

  open my $out, '>', $file or die $!;
  print $out "<!--#set var=\"TITLE\" value=\"$field[0]\"-->";
  print $out "\n";
  close $out
}
