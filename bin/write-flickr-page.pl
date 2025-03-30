#!/bin/env perl

use strict;
my $map;

open my $in, '<', 'mapping.csv' or die $!;
while (<$in>){
  chomp;
  my ($flickr, $id) = split ',';
  $map->{$flickr} = $id;
}
close $in;

while (<>){
  chomp;
  my ($id, $title, $url, $date) = split '\|';

  print '<img src="', $url, '"><br>';
  print '<b>', $map->{$id}, '</b> ' if $map->{$id};
  print '(', $id, ')<br>';
  print $title, '<br>';
  print $date, "<br>\n";
}
