#!/usr/bin/env perl
#
# usage:
# cat resources/data.psv | resources/build-vars-files.pl
#
# this writes a set of vars files in the working directory

use strict;
my $n = 1;

while (<>){
  chomp;
  my($image_id, $title, $desc) = split /\|/, $_;

  my $file = 'vars-'.$n++.'.html';
  print "Writing to $file\n";

  open my $out, '>', $file or die $!;
  print $out "<!--#set var=\"ID\" value=\"$image_id\"-->" if $image_id;
  print $out "<!--#set var=\"TITLE\" value=\"$title\"-->" if $title;
  print $out "<!--#set var=\"DESC\" value=\"$desc\"-->" if $desc;
  print $out "\n";
  close $out
}
