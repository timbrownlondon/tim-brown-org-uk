#!/usr/bin/env perl
use strict;

use lib 'lib';

use Data::Dumper;
use SiteTools;
use ArtWorks;

my $ST = SiteTools->new();
my $AW = ArtWorks->new_from_file('img-data.psv');

print Dumper $AW;

