#!/usr/bin/sh

for DATA in $(ls */ids.txt)
do
  wc -l $DATA
  COLLECTION=$(dirname $DATA)
  shuf $DATA > tmp
  mv tmp $DATA
  cat $DATA | bin/write-image-list.pl > $COLLECTION/image-list.html
done
