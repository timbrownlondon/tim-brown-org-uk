#!/bin/env perl

my $url = 'https://s.tim-brown.org.uk/t';

while (<>){
  chomp;
  print '<a href="/img/', $_, '">';
  print '<img src="', $url, '/', $_, '/medium.jpg">';
  print "</a>\n";
}
