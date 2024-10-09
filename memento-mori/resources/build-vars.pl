#!/usr/bin/env perl
#
# cat data.psv | ./build-vars.pl > vars-for-all-pages.html
use strict;

while (<>){
  chomp;
  my($image_id, $extension, $title, $born, $died, $age) = split /\|/, $_;

  print "<!--#set var=\"ID\" value=\"$image_id\"-->" if $image_id;
  print "<!--#set var=\"EXT\" value=\"$extension\"-->" if $extension;
  print "<!--#set var=\"TITLE\" value=\"$title\"-->";
  print "<!--#set var=\"BORN\" value=\"$born\"-->";
  print "<!--#set var=\"DIED\" value=\"$died\"-->";
  print "<!--#set var=\"AGE\" value=\"$age\"-->";
  print "\n";
}
