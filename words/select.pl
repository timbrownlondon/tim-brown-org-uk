#!/usr/bin/env perl

use strict;
use YAML;
use Data::Dumper;


my $data = YAML::Load(join '', <>);

# print Dumper $data;

for my $n (1, 2, 3, 4, 5){
  my $category = pick_from_array(keys %$data);
  print "$n. $category  : ", pick_from_arrayref($data->{$category}->{list}), "\n";
}


sub pick_from_arrayref {
  my $list = shift;
  $list->[rand @$list];
}

sub pick_from_array {
  my @list = @_;
  $list[rand @list];
}
