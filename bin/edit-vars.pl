#!/usr/bin/env perl
use strict;

for my $filename (<>){
  chomp $filename;
  open my $infile, '<', $filename;
  my $content = <$infile>;
  close $infile;

  my ($id) = $content =~ m/"ID" value="(.*?)"/;
  $id =~ s|^t/||;

  $content =~  s/"ID"/"IMG_ID"/;
  print $id, "\n";

  open my $outfile, '>', "ssi/$id.html";
  print  $outfile $content;
  close $outfile;
}
