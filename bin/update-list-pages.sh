#!/usr/bin/bash

bin/list-medium-images-in-s3.sh
cat list/medium-images.txt | bin/split-image-list.pl 
bin/write-list-html.pl

