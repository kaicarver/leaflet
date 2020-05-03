#!/bin/bash
# import all GPX file downloaded from, for example,
#   https://www.strava.com/dashboard?feed_type=my_activity

for f in /mnt/c/Users/Kai/Downloads/*.gpx; do
    echo import $f
    ./import.sh $f
done
