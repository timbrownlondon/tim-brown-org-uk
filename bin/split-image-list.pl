#!/bin/env perl

# write output files to main website
my $dir = '/var/www/sites/tim-brown-org-uk/list';
my $page_size = 50;

# STDIN is a list of file paths like...
# t/003c03/medium.jpg
# t/00952a/medium.jpg
my @lines = <>;

for my $page (1 .. int(scalar @lines / $page_size) + 1){
  print $page, ' ', $page * $page_size, "\n";
  my $this_dir = sprintf "%s/%02d", $dir, $page;
  qx(mkdir -p $this_dir);

  my $start_index = ($page - 1) * $page_size;
  open (my $outfile, '>', "$this_dir/image-list.txt") or die "cannot open $dir_this/image-list.txt";
  print $outfile @lines[$start_index .. $start_index + $page_size - 1];
  close $outfile;
}
