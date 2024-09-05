#!/usr/bin/env perl
#
# cat src-people.txt | ./build-list.pl > people.txt
use strict;

while (<>){
  my($name, $age) = m/(.*) (\d\d)\.$/ or die "$_ - is not well formatted\n";
  my $query = $name;
  $query =~ s/ /+/g;

  print "<a href=\"https://www.google.com/search?q=$query\">$name</a><br>lived to the age of $age.\n";
}
