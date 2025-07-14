#!/bin/env perl

use strict;

for my $input_file (glob 'ideas/*txt'){
  my $output_file = output_file_for($input_file);
  print " $input_file -> $output_file\n";

  open my $IN, '<', $input_file or die $!;
  open my $OUT, '>', $output_file or die $!;

  while (<$IN>){
    chomp;
    print $OUT "<li>$_</li>\n";
  }
  close $IN;
  close $OUT;
}


sub output_file_for {
  my $filename = shift;
  $filename =~ s/\..*$/.html/;
  return $filename;
}
