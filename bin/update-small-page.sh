#!/usr/bin/bash

TEXT_FILE=small/small-images.txt
HTML_FILE=small/small-images.html

# list the small images that are stored in S3
aws s3 ls --recursive s3://i.tim-brown.org.uk/t/ | grep small | awk '{print $4}' > $TEXT_FILE

cat $TEXT_FILE | bin/write-html-for-image-list.pl > $HTML_FILE
