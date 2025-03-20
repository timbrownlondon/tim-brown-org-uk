#!/usr/bin/env perl
use strict;

# usage:
# cat img-data.psv | bin/write-vars-from-data.pl

open my $data_file, '<', 'img-data.psv' or die $!;
my @data = <$data_file>;
close $data_file;

for (@data){
  chomp;
  my ($flickr_id, $img_id, $title, $desc) = split '\|';

  my $ssi_file = "ssi/$img_id.html";
  my $content = '<!--#set var="IMG_ID" value="' . $img_id . '"-->' .
                '<!--#set var="TITLE" value="' . $title . '"-->' .
                '<!--#set var="DESC" value="' . $desc . '"-->';

  if (-f $ssi_file){
    open my $old_file, '<', $ssi_file or die;
    my $old_content = join '', <$old_file>;

    next if $old_content eq $content;

    open my $outfile, '>', $ssi_file . '.new' or die;
    print  $outfile $content;
    close $outfile;
  }
}
