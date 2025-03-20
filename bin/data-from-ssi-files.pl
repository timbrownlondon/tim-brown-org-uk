#!/usr/bin/env perl
use strict;
use Data::Dumper;

my @data;

for my $file (glob 'ssi/*.html'){

  open my $read, '<', $file or die;
  my $content = join '', <$read>;
  close $read;

  my $record;
  for my $expr (split '-->', $content){
    my ($var_name) = $expr =~ m/var="(.*?)"/; 
    my ($value) = $expr =~ m/value="(.*?)"/; 
    
    $record ->{$var_name} = $value if $var_name;
    # $count->{$var_name}++ if $var_name;
  }
  push @data, $record;
}

for my $R (@data){ 
  $R->{IMG_ID} =~ s|^t/||;
  print $R->{IMG_ID}, '|', $R->{TITLE};
  print ' (', $R->{BORN}, ' ', $R->{DIED}, ') ', $R->{AGE}, ' years' if $R->{DIED};
  print '|', $R->{DESC}, '|';
  print $R->{EXT} unless $R->{EXT} eq 'jpg';
  print "|\n";

}
  #       EXT
  #       BORN
  #       TITLE
  #       DESC
  #       IMG_ID
  #       AGE
  #       DIED
