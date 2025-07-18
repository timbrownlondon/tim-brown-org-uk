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
	time => 'Time',
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
open my $template_file, '<', 'page/template.html' or die $!;
my $template = join '', <$template_file>;
close $template;

# write an html file for each line of data
for (@data){
  chomp;
  my ($id, $title, $desc, $ext, $text_flag) = split '\|';
  next unless $id; # ignore empty lines

  my $output_file = "page/$id.html";

  my $media = build_media_element($id, $title, $ext);
  my $links = build_collection_links($collection_members->{$id});

  my $content = fill_template($template, $id, $title, $desc, $media, $links);

  open my $out, '>', $output_file or die $!;
  print  $out $content;
  close $out;
}

sub build_media_element {
  my ($id, $title, $ext) = @_;

  return
    '<video controls autoplay muted loop class="responsive">' .
    '<source type="video/mp4" src="https://s.tim-brown.org.uk/t/'. $id . '/large.mp4" class="responsive" alt="'. $title . '">' .
    '</video>' if $ext eq 'mp4';

  $ext or $ext = 'jpg';

  # remove html tags from the title to use as alt value
  $title =~ s/<[^>]+>//g;
    
  return 
    '<img src="https://s.tim-brown.org.uk/t/'. $id .'/large.'. $ext .'" class="responsive" alt="'. $title .'">';
}

sub fill_template{
  my ($template, $id, $title, $desc, $media, $links) = @_;

  my $plain_title = $title;
  $plain_title =~ s/<[^>]+>//g;

  $template =~ s/__ID__/$id/sg;
  $template =~ s/__TITLE__/$title/sg;
  $template =~ s/__PLAIN_TITLE__/$plain_title/sg;
  $template =~ s/__DESC__/$desc/s;
  $template =~ s/__MEDIA__/$media/s;
  $template =~ s/__LINKS__/$links/s;

  return $template;
}

sub build_collection_links {
  my $collection_members = shift;

  my $return_value = '';
  for my $collection_dir (sort keys %$collection_members){
     $return_value .=  '<a href="/'. $collection_dir. '/">'. $collection_name{$collection_dir}. "</a><br>\n";
   }
   $return_value;
}
