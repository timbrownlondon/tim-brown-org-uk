use strict;
use Test::More; 
use lib 'lib';
use Data::Dumper;

use_ok 'SiteTools';

my $ST = SiteTools->new();
isa_ok $ST, 'SiteTools';

done_testing();
