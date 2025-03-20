#!/usr/bin/env perl
use strict;

# usage:
# cat img-data.psv | bin/write-vars-from-data.pl

open my $data_file, '<', 'img-data.psv' or die $!;
my @data = <$data_file>;
close $data_file;

for (@data){
  chomp;
  my ($img_id, $title, $desc, $ext) = split '\|';

  my $ssi_file = "ssi/$img_id.html";
  my $content = '<!--#set var="IMG_ID" value="' . $img_id . '"-->' .
                '<!--#set var="TITLE" value="' . $title . '"-->' .
                '<!--#set var="DESC" value="' . $desc . '"-->';

  $content .= '<!--#set var="EXT" value="' . $ext . '"-->' if $ext;

  open my $outfile, '>', $ssi_file or die $!;
  print  $outfile $content;
  close $outfile;
}
