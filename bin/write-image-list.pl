#!/bin/env perl

use lib 'lib';

use ArtWorks;

my $AW = ArtWorks->new_from_file('img-data.psv');

my $url = 'https://s.tim-brown.org.uk/t';

while (<>){
  chomp;
  my $title =  $AW->title($_);
  die $title if $title =~ m/"/;

  print '<a href="/img/', $_, '">';
  print '<img src="', $url, '/', $_, '/medium.jpg" alt="', $title, '">';
  print "</a>\n";
}
