package ArtWorks;

use strict;

sub new_from_str {
  my ($class, $str) = @_;

  # expects pipe separated variables

  my $obj;
  for my $line (split "\n", $str){
    my ($id, @fields) = split '\|', $line;
    next unless $id;
    $obj->{data}->{$id} = \@fields;
  }
  bless $obj, $class;
}

sub item {
  my ($self, $id) = @_;

  $self->{data}->{$id};
}

sub field {
  my ($self, $id, $n) = @_;
  $self->item($id)->[$n];
}

sub title {
  my ($self, $id) = @_;
  $self->field($id,0);
}

sub desc {
  my ($self, $id) = @_;
  $self->field($id,1);
}



1;
