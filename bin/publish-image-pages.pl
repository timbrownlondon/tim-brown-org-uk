#!/usr/bin/env perl
use strict;
use Data::Dumper;

my %collection_name = (
	maps => 'Maps',
	london => 'London',
	recent => 'Recently Added',
	coast => 'Coast',
	ibsen => 'Ibsen',
	railways => 'Railways',
	gallery => 'At the Gallery',
	trees => 'Trees',
	italy => 'Italy',
	journal => 'Journal',
	body => 'Body',
	'self-portraits' => 'Self Portraits',
	'memento-mori' => 'Memento Mori',
	'childrens-art' => 'Children\'s Art',
	'letters-numbers' => 'Letters, Numbers &amp; Words',
);

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

# read template
open my $template_file, '<', 'ssi/page-template.html' or die $!;
my $template = join '', <$template_file>;
close $template;

# write a html file for each image
for (@data){
  chomp;
  my ($id, $title, $desc, $ext, $text_flag) = split '\|';
  next unless $id; # ignore empty lines

  my $output_file = "test/$id.html";

  my $links = build_collection_links($collection_members->{$id});
  my $content = fill_template($template, $id, $title, $desc, $ext, $links);

  open my $out, '>', $output_file or die $!;
  print  $out $content;
  close $out;
}

sub fill_template{
  my ($template, $id, $title, $desc, $ext, $links) = @_;

  $ext or $ext = 'jpg';

  $template =~ s/__ID__/$id/sg;
  $template =~ s/__TITLE__/$title/sg;
  $template =~ s/__DESC__/$desc/sg;
  $template =~ s/__EXT__/$ext/sg;
  $template =~ s/__LINKS__/$links/sg;

  return $template;
}

sub build_collection_links {
  my $collection_members = shift;

  my $return_value = '';
  for my $collection_dir (sort keys %$collection_members){
     next if $collection_dir eq 'time';
     $return_value .=  '<a href="/'. $collection_dir. '/">'. $collection_name{$collection_dir}. "</a><br>\n";
   }
   $return_value;
}
