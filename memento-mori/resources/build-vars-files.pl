#!/usr/bin/env perl
#
# usage:
# cat resources/data.psv | resources/build-vars.pl
#
# this writes a set of vars files in the working directory

use strict;
my $n = 1;

while (<>){
  chomp;
  my($image_id, $extension, $title, $born, $died, $age) = split /\|/, $_;

  next unless $image_id;

  my $file = 'vars-'.$n++.'.html';
  print "Writing to $file\n";

  open my $out, '>', $file or die $!;
  print $out "<!--#set var=\"ID\" value=\"$image_id\"-->" if $image_id;
  print $out "<!--#set var=\"EXT\" value=\"$extension\"-->" if $extension;
  print $out "<!--#set var=\"TITLE\" value=\"$title\"-->" if $title;
  print $out "<!--#set var=\"BORN\" value=\"$born\"-->";
  print $out "<!--#set var=\"DIED\" value=\"$died\"-->";
  print $out "<!--#set var=\"AGE\" value=\"$age\"-->";
  print $out "\n";
  close $out
}
