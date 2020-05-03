#!/bin/bash
# import a GPX file downloaded from, for example,
#   https://www.strava.com/activities/3268461774

GPX=/tmp/arun.gpx
JSON=/tmp/arun.json
JS=/tmp/runs.js

if [ -f "$1" ]; then
    mv $1 $GPX
    togeojson < $GPX | python -m json.tool > $JSON
    head -n-2 runs.js > $JS; echo ',' >> $JS
    cat $JSON >> $JS; tail -n2 runs.js >> $JS
    mv $JS runs.js
    rm $GPX
else
    echo "$1 not found"
fi
