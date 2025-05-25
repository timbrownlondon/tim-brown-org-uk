#!/bin/env perl

use strict;
use Data::Dumper;

my $lists;
my $FH;

$lists->{a}->{name} = 'small/small-images.txt';
$lists->{b}->{name} = 'img-data.psv';
$lists->{c}->{name} = 'list/medium-images.txt';

# extract ids from a
open $FH, '<', $lists->{a}->{name} or die $!;
while (<$FH>){
  m|t/(\w+)|;
  $lists->{a}->{id}->{$1} = 1;
}
close $FH;

# extract ids from b
open $FH, '<', $lists->{b}->{name} or die $!;
while (<$FH>){
  m/(\w+)/;
  $lists->{b}->{id}->{$1} = 1;
}
close $FH;

# extract ids from c
open $FH, '<', $lists->{c}->{name} or die $!;
while (<$FH>){
  m|t/(\w+)|;
  $lists->{c}->{id}->{$1} = 1;
}
close $FH;


# print Dumper $lists;

print 'Not in ', $lists->{b}->{name}, ":\n";
for my $id (keys %{$lists->{a}->{id}}){
  print "$id\n" unless $lists->{b}->{id}->{$id};
}

print 'Not in ', $lists->{a}->{name}, ":\n";
for my $id (keys %{$lists->{b}->{id}}){
  print "$id\n" unless $lists->{a}->{id}->{$id};
}

print 'Not in ', $lists->{c}->{name}, ":\n";
for my $id (keys %{$lists->{b}->{id}}){
  print "$id\n" unless $lists->{c}->{id}->{$id};
}
