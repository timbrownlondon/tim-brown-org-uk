#!/bin/env perl
use strict;

use FindBin;
use lib $FindBin::Bin;

use SiteTools;
my $tools = SiteTools->new();

for my $dir ($tools->dirs_for_homepage()){
  # read id of first image in collection
  warn '------ ', $dir;
  open my $IN, '<', "$dir/ids.txt.shuffled" or die "$dir/ids.txt.shuffled - $!";
  my $id = <$IN>;
  close $IN;
  chomp($id);

  my $name = $tools->name_from_dir($dir);

  print '<a href="/', $dir, '/" class="collection-cover">';
  print '<img src="https://s.tim-brown.org.uk/t/', $id, '/large.jpg" alt="', $name, '">';
  print '<div class="collection-title">', $name, "</div></a>\n";
}


