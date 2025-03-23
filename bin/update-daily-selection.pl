#!/bin/env perl

use strict;

my $url = 'https://s.tim-brown.org.uk/t';

open my $data, '<', 'img-data.psv' or die $!;
my @images = <$data>;
close $data;

my @selected = select_some_lines(@images);

for my $i (@selected){
  my ($id) = split '\|', $images[$i];
  print '<a href="/img/', $id, '">';
  print '<img src="', $url, '/', $id, '/medium.jpg">';
  print "</a>\n";
}


sub select_some_lines {
  my @lines = @_;

  my $count = scalar @lines;

  my $selected;
  while (scalar keys %$selected < 12){
    my $n = int(rand() * $count);
    $selected->{$n}++;
  }
  return keys %$selected;
}

