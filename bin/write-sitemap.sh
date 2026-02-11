#!/usr/bin/bash

URL=https://tim-brown.org.uk
echo $URL

DIRS=$(bin/dirs.pl)

for COLLECTION in $(echo $DIRS | sort)
do
  echo $URL/$COLLECTION/
done

for ID in $(cat img-data.psv | cut -f1 -d\| | sort)
do
  echo $URL/img/$ID
done

