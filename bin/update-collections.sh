#!/usr/bin/sh

for COLLECTION in maps letters-numbers railway london coast body memento-mori journal
do
  DATA=$COLLECTION/ids.txt
  wc -l $DATA
  cat $DATA | bin/write-image-list.pl  > $COLLECTION/image-list.html
done
