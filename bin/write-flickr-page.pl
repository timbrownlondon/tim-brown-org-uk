#!/bin/env perl

while (<>){
  chomp;
  my ($id, $title, $url, $date) = split '\|';

  print '<img src="', $url, '"><br>';
  print $title, '<br>';
  print $date, "<br>\n";
}
