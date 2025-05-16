#!/usr/bin/env perl
use strict;
use Data::Dumper;

# map collection membership
my $collection_members;

for my $F (glob '*/ids.txt'){
  my ($collection_dir) = $F =~m|(.*?)/|;

  open my $ids_fh, '<', $F or die $!;
  for my $id (<$ids_fh>){
    chomp $id;
    $collection_members->{$id}->{$collection_dir}++;
  }
  close $ids_fh;
}

# ingest image data
open my $data_file, '<', 'img-data.psv' or die $!;
my @data = <$data_file>;
close $data_file;


# write an ssi file for each image
for (@data){
  chomp;
  my ($id, $title, $desc, $ext, $text_flag) = split '\|';
  next unless $id; # ignore empty lines

  my $ssi_file = "ssi/$id.html";
  my $content = '<!--#set var="IMG_ID" value="' . $id . '"-->' .
                '<!--#set var="TITLE" value="' . $title . '"-->' .
                '<!--#set var="DESC" value="' . $desc . '"-->';

  $content .= '<!--#set var="EXT" value="' . $ext . '"-->' if $ext;
  $content .= '<!--#set var="TEXT" value="TRUE"-->' if $text_flag;

  for my $C (sort keys %{$collection_members->{$id}}){
    $C =~ s/[^\w]//g;
    $content .= '<!--#set var="';
    $content .= uc $C;
    $content .= '" value="TRUE"-->';
  }

  open my $outfile, '>', $ssi_file or die $!;
  print  $outfile $content;
  close $outfile;
}
