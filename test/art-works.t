use strict;
use Test::More; 
use lib 'lib';
use Data::Dumper;

use_ok 'ArtWorks';

my $str = q(
d50ef5|Rail lines North of Wandsworth Road Station|Ink and wash on paper 9 x 14 cm||
887aa0|<i>Magnetic Fields</i> by Takis at the Tate Modern 2019|Ink on paper 14 x 20 cm||
baf316|Sissinghurst Castle Garden|Ink and wash on paper 9 x 14 cm||
4e494b|The Imperial War Museum, SE1|Ink and wash on paper 9 x 14 cm||
a4bd86|<i>Bagdad Car</i> by Jeremy Deller at the Imperial War Museum|Ink and wash on paper 9 x 14 cm||
3f9859|Design for bike light sculpture|Ink and wash on paper||
c77f95|Buckingham Palace, SW1A|Ink and wash on paper 9 x 14 cm||
81538c|Broadgate Exeter|Ink and wash on paper 9 x 14 cm||
8cdd46|Cadogan Pier, SW3|Ink and wash on paper 12 x 18 cm||
9a1275|Whitelands House, SW3|Ink and wash on paper 9 x 14 cm, 2020||
);

my $AW = ArtWorks->new_from_str($str);
isa_ok $AW, 'ArtWorks';

print Dumper $AW;

is ($AW->title('baf316'), 'Sissinghurst Castle Garden', 'title() for item OK');
is ($AW->desc('3f9859'), 'Ink and wash on paper', 'desc() for item OK');



done_testing();
