package ArtWorks;

use strict;

sub new_from_file {
  my ($class, $filename) = @_;

  open my $IN, '<', $filename or die "$! $filename\n";

  my $obj = {};
  bless $obj, $class;

  while (<$IN>){
    $obj->add_data_from_pipe_separated_line($_);
  }
  close $IN;

  bless $obj, $class;
}

sub new_from_str {
  my ($class, $str) = @_;

  my $obj = {};
  bless $obj, $class;

  for my $line (split "\n", $str){
    $obj->add_data_from_pipe_separated_line($line);
  }
  return $obj;
}

sub add_data_from_pipe_separated_line {
  my ($obj, $line) = @_;

  chomp $line;
  # expects pipe separated fields
  my ($id, @fields) = split '\|', $line;
  return unless $id;
  $obj->{data}->{$id} = \@fields;
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
