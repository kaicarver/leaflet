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

This is a nice super-simple approach to having a heatmap effect: just use opacity and line thickness.

https://gis.stackexchange.com/a/118610/69718

Here's the current super-manual procedure to add a run to the map:

1. Download the GPX file from Strava.
2. Do this:

```bash
$ mv /mnt/c/Users/Kai/Downloads/*.gpx data/arun.gpx
$ togeojson < data/arun.gpx | python -m json.tool > data/arun.json
```

3. copy the pretty-printed JSON into the `runs` array in `runs.js`.


## TODOs

* when first displayed, the form should match the URL params 
* lat/lon should be displayable and/or updated by clicking on the map
* GPS tracks should be
  * optionally displayed
  * distinguishable
  * clickable to show date and distance and time info
  * transparent for heatmap effect
  * enterable by pasting in GeoJSON or a Strava etc. URL
* try to keep from bloating to another Acme Maps...
  * I mean keep in mind this nice app which does not need reinventing https://mapper.acme.com/?ll=48.87917,2.38472&z=11&t=M

## Notes

An old but good tip for quickly styling form elements:

https://css-tricks.com/styling-texty-inputs-only
