#!/bin/env perl

use strict;
use Data::Dumper;

my $lists;

$lists->{a}->{name} = 'small/small-images.txt';
$lists->{b}->{name} = 'img-data.psv';

# extract ids from a
open my $A, '<', $lists->{a}->{name} or die $!;
while (<$A>){
  m|t/(\w+)|;
  $lists->{a}->{id}->{$1} = 1;
}
close $A;

# extract ids from b
open my $B, '<', $lists->{b}->{name} or die $!;
while (<$B>){
  m/(\w+)/;
  $lists->{b}->{id}->{$1} = 1;
}
close $B;

# print Dumper $lists;

print 'Not in ', $lists->{b}->{name}, ":\n";
for my $id (keys %{$lists->{a}->{id}}){
  print "$id\n" unless $lists->{b}->{id}->{$id};
}

print 'Not in ', $lists->{a}->{name}, ":\n";
for my $id (keys %{$lists->{b}->{id}}){
  print "$id\n" unless $lists->{a}->{id}->{$id};
}
