#!/usr/bin/env perl
use strict;

for my $filename (<>){
  chomp $filename;
  open my $infile, '<', $filename;
  my $content = <$infile>;
  close $infile;
  my ($id) = $content =~  m/"ID" value="(.*?)"/;
  $id =~ s|^t/||;
  print "$id\n";
  qx(cp $filename ssi/$id.html);
}
