#!/bin/env perl

use strict;

my $collections = {
      maps => 'Maps',
      london => 'London',
      coast => 'Coast',
      'twenty-new-yorkers' => 'Twenty New Yorkers',
      ibsen => 'Ibsen',
      railways => 'Railways',
      gallery => 'At the Gallery',
      trees => 'Trees',
      italy => 'Italy',
      body => 'Body',
      'memento-mori' => 'Memento Mori',
      'letters-numbers' => 'Letters, Numbers &amp; Words',
};

# algorithm => 'Algorithm',
# animals => 'Animals',
# 'childrens-art' => 'Children\'s Art',
# time => 'Time',
# portraits => 'Portraits',
# devices => 'Devices',
# recent => 'Recently Added',


for my $dir (keys %$collections){
  # read id of first image in collection
  open my $IN, '<', "$dir/ids.txt" or die $!;
  my $id = <$IN>;
  close $IN;
  chomp($id);

  my $name = $collections->{$dir};

  print '<a href="/', $dir, '/" class="collection-cover">';
  print '<img src="https://s.tim-brown.org.uk/t/', $id, '/large.jpg" alt="', $name, ' collection">';
  print '<div class="collection-title">', $name, "</div></a>\n";
}


