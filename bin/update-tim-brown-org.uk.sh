#!/usr/bin/bash

set -eu

# ensure menu is up to date
bin/menu_links.pl  > menu/links.html

# ensure pages are up to date
bin/publish-image-pages.pl

# shuffle contents of collection pages
bin/update-collections.sh

# update homepage selection
bin/update-selection.pl  > collections.html

# shuffle contents of list pages
shuf list/medium-images.txt | bin/split-image-list.pl
bin/write-list-html.pl
