#!/usr/bin/env perl
#
# cat items.psv | ./build-vars.pl > vars-for-all-pages.html
use strict;

while (<>){
  chomp;
  my($image_id, $title, $desc) = split /\|/, $_;

  print "<!--#set var=\"ID\" value=\"$image_id\"-->" if $image_id;
  print "<!--#set var=\"TITLE\" value=\"$title\"-->" if $title;
  print "<!--#set var=\"DESC\" value=\"$desc\"-->" if $desc;
  print "\n";
}
