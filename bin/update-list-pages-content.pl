#!/bin/env perl

# write output files to main website
my $dir = '/var/www/sites/tim-brown-org-uk/list';
my $url = 'https://s.tim-brown.org.uk';

for my $image_list_file (glob "$dir/*/image-list.txt"){
  print $image_list_file, "\n";
  my ($this_dir) = $image_list_file =~ m|(.*)/|;

  open (my $infile, '<', $image_list_file) or die;
  open (my $outfile, '>', "$this_dir/image-list.html") or die;

  while ( <$infile> ){
    chomp;
    m|t/(\w+)|; # extract image id
    print $outfile '<a href="/img/', $1, '">';
    print $outfile '<img src="', $url, '/', $_, '">';
    print $outfile "</a>\n";
  }
  close $infile;
  close $outfile;
}
