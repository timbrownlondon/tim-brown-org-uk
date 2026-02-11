package SiteTools;

use strict;
use Data::Dumper;

use List::Util qw(shuffle);

my $collection_names = {
	algorithm => 'Algorithm',
	animals => 'Animals',
	banned => 'Banned Words',
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
	uncategorised => 'Uncategorised',
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

sub dirs_for_homepage {
  my $self = shift;

  my @dirs = shuffle keys %{$self->{names}};

  @dirs[0..19];  # 20 random items
}


1;
