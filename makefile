
import:
	mv /mnt/c/Users/Kai/Downloads/*.gpx /tmp/arun.gpx
	togeojson < /tmp/arun.gpx | python -m json.tool > /tmp/arun.json
	head -n-2 runs.js > /tmp/runs.js; echo ',' >> /tmp/runs.js
	cat /tmp/arun.json >> /tmp/runs.js; tail -n2 runs.js >> /tmp/runs.js
	mv /tmp/runs.js runs.js
