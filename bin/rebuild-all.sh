#!/usr/bin/bash

set -eu

for DIR in body coast letters-numbers london maps memento-mori railway
do
  cd $DIR
  cat resources/data.psv | resources/build-list.pl > catalog/list.html 
  cat resources/data.psv | resources/build-vars-files.pl
  cd -
done
