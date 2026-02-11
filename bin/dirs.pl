#!/usr/bin/env perl
use strict;

use FindBin;
use lib $FindBin::Bin;
use SiteTools;

my $tools = SiteTools->new();

print $tools->dirs();
