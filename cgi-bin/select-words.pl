#!/usr/bin/env perl

use strict;
use YAML;
use Data::Dumper;

print "Content-type: text/html\n\n";

my $filename = '/var/www/sites/tim-brown-org-uk/words/words.yaml';

my $data = YAML::LoadFile($filename);

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
