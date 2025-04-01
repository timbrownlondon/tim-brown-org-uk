#!/usr/bin/bash

set -eu

# update homepage selection
bin/update-daily-selection.pl > daily-selection.html 

# shuffle contents of collection pages
bin/update-collections.sh
