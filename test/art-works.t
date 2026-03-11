use strict;
use Test::More; 
use lib 'lib';
use Data::Dumper;

use_ok 'ArtWorks';

my $AW = ArtWorks->new_from_str('a|b|c');
isa_ok $AW, 'ArtWorks';

print Dumper $AW;
done_testing();
