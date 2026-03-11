package ArtWorks;

use strict;

sub new_from_str {
  my ($class, $str) = @_;

  # pipe separated variables
  bless {psv => $str}, $class;
}


1;
