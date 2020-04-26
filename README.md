# leaflet

## Experiment with web mapping using [Leaflet](https://leafletjs.com/)

Example: where Kai can go jogging these days
(but not after 10 am or before 7 pm)

https://raw.githack.com/kaicarver/leaflet/master/index.html

### Show Strava / Garmin runs on map

We'll need to use GeoJSON.

https://leafletjs.com/examples/geojson/

I can export from Strava to GPX

https://support.strava.com/hc/en-us/articles/216918437-Exporting-your-Data-and-Bulk-Export

and convert from GPX to GeoJSON

https://github.com/tmcw/togeojson

also available as a command-line tool

https://github.com/tmcw/togeojson-cli

Tip to display JSON legibly:

```bash
python -m json.tool arun.json | less
```

Github actually shows GeoJSON as a map by default, nice:

https://github.com/kaicarver/leaflet/blob/master/arun.json

This looks worth checking out, a tool to export Strava runs from command-line via the API

https://github.com/node-geojson/strava-geojson

And this is a nice Jupyter notebook demonstrating what you can do to analyze the Strava data

https://knanne.github.io/notebooks/visualize_strava_data_in_python.html

This is a nice site that allows testing out a GeoJSON file by just pasting it in

http://geojson.io/#map=14/48.8824/2.3836

I guess GeoJSON is not ideal for tracking, since it's more for geographical features, not tracking movement.

https://dret.typepad.com/dretblog/2015/11/gps-data-on-the-web.html

But I guess it's good enough.
