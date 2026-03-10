#!/usr/bin/sh

for DATA in $(ls */ids.txt)
do
  wc -l $DATA
  COLLECTION=$(dirname $DATA)
  if [ "$COLLECTION" = "encounter" ]; then
    { head -1 $DATA; tail -n +2 $DATA | shuf; } > $DATA.shuffled
  else
    shuf $DATA > $DATA.shuffled
  fi
  cat $DATA.shuffled | bin/write-image-list.pl > $COLLECTION/image-list.html
done

