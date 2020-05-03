#!/bin/bash
# import all GPX file downloaded from, for example,
#   https://www.strava.com/dashboard?feed_type=my_activity

for f in /mnt/c/Users/Kai/Downloads/*.gpx; do
    if [ -f "$f" ]; then
	echo import $f
	./import.sh $f
    else
	echo "$f: no such file to import."
	echo "download from, for example,"
	echo "  https://www.strava.com/dashboard?feed_type=my_activity"
    fi
done

JS=runs.js
dupes=`grep name $JS | uniq -D`
if [ "$dupes" != "" ]; then
    echo "possible duplicates in $JS:"
    echo "$dupes"
fi
