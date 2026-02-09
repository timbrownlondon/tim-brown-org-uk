package SiteTools;

use strict;
use Data::Dumper;

my $collection_names = {
	algorithm => 'Algorithm',
	animals => 'Animals',
	maps => 'Maps',
	london => 'London',
	recent => 'Recently Added',
	coast => 'Coast',
	devices => 'Devices',
	encounter => 'Theatre of Encounter',
	'twenty-new-yorkers' => 'Twenty New Yorkers',
	ibsen => 'Ibsen sketchbooks',
	railways => 'Railways',
	gallery => 'At the Gallery',
	trees => 'Trees',
	italy => 'Italy',
	body => 'Body',
	'still-life' => 'Still Life',
	time => 'Time',
	'portraits' => 'Portraits',
	'memento-mori' => 'Memento Mori',
	'childrens-art' => 'Children\'s Art',
	'letters-numbers' => 'Letters, Numbers &amp; Words',
	disgrace => 'Disgracefully Cavalier',
};

sub new {
  my $class = shift;

  bless {names => $collection_names}, $class;
}

sub name_from_dir {
  my ($self, $dir) = @_;

  return $self->{names}->{$dir};
}

sub collection_dirs {
  my $self = shift;

  return keys %{$self->{names}};
}
1;
