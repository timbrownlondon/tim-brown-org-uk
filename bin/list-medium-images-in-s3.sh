#!/usr/bin/bash

OUTFILE=list/medium-images.txt
echo writing to $OUTFILE

# list the meadium size images that are stored in S3
# as the basis for making image list pages
aws s3 ls --recursive s3://i.tim-brown.org.uk/t/ | grep medium | awk '{print $4}'  > $OUTFILE

