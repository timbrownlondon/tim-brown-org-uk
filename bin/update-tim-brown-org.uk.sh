#!/usr/bin/bash

set -eu

# update homepage selection
bin/update-daily-selection.pl > daily-selection.html 

# shuffle contents of collection pages
for C in body \
	 childrens-art \
	 coast \
         gallery \
         italy \
         journal \
         letters-numbers \
         london \
         maps \
         memento-mori \
         railways \
         trees
do
  echo $C
  cat $C/ids.txt | shuf | bin/write-image-list.pl > $C/image-list.html
done
