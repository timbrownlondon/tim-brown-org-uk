#!/bin/env perl
use strict;

use FindBin;
use lib $FindBin::Bin;

use SiteTools;
my $tools = SiteTools->new();

for my $dir ($tools->collection_dirs()){
  # read id of first image in collection
  open my $IN, '<', "$dir/ids.txt.shuffled" or die $!;
  my $id = <$IN>;
  close $IN;
  chomp($id);

  my $name = $tools->name_from_dir($dir);

  print '<a href="/', $dir, '/" class="collection-cover">';
  print '<img src="https://s.tim-brown.org.uk/t/', $id, '/large.jpg" alt="', $name, '">';
  print '<div class="collection-title">', $name, "</div></a>\n";
}


