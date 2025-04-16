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

# redirect flickr-data.psv to STDIN
while (<>){
  chomp;
  my ($id, $title, $url, $date) = split '\|';
  next if $map->{$id}; # only show images that are NOT on the website

  print '<img src="', $url, '"><br>';
  # print '<b>', $map->{$id}, '</b> ' if $map->{$id};
  print '(', $id, ')<br>';
  print $title, '<br>';
  print $date, "<br>\n";
}
