#!/usr/bin/bash

URL=https://tim-brown.org.uk

DIRS='algorithm animals body childrens-art coast devices gallery 
      ibsen ideas italy letters-numbers london maps memento-mori portraits 
      railways recent time trees twenty-new-yorkers uncategorised'

echo $URL

for COLLECTION in $(echo $DIRS | sort)
do
  echo $URL/$COLLECTION/
done

for ID in $(cat img-data.psv | cut -f1 -d\| | sort)
do
  echo $URL/img/$ID
done

