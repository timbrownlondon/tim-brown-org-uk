#!/usr/bin/bash

set -eu

# shuffle contents of collection pages
bin/update-collections.sh

# update homepage selection
bin/update-collection-selections.pl  > collections.html

# shuffle contents of list pages
shuf list/medium-images.txt | bin/split-image-list.pl
bin/write-list-html.pl
