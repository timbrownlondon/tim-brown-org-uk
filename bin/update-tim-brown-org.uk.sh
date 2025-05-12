#!/usr/bin/bash

set -eu
LOG=update-daily-selection.log
date >> $LOG

# update homepage selection
bin/update-daily-selection.pl > daily-selection.html 2>> $LOG

# shuffle contents of collection pages
bin/update-collections.sh

# shuffle contents of list pages
shuf list/medium-images.txt | bin/split-image-list.pl
bin/write-list-html.pl
