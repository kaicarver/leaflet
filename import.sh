#!/bin/bash
# import a GPX file downloaded from, for example,
#   https://www.strava.com/activities/3268461774

mv $1 /tmp/arun.gpx
togeojson < /tmp/arun.gpx | python -m json.tool > /tmp/arun.json
head -n-2 runs.js > /tmp/runs.js; echo ',' >> /tmp/runs.js
cat /tmp/arun.json >> /tmp/runs.js; tail -n2 runs.js >> /tmp/runs.js
mv /tmp/runs.js runs.js

