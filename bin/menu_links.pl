#!/usr/bin/env perl
use strict;

use lib 'lib';

use SiteTools;
my $tools = SiteTools->new();

print $tools->links_for_menu();
