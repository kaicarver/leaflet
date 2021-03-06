[![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/kaicarver/leaflet) 
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/kaicarver/leaflet)

# leaflet

## Experiment with web mapping using [Leaflet](https://leafletjs.com/)

Web app: where Kai (or anyone else) can go jogging these days
(but, in Paris, not after 10 am or before 7 pm).

https://raw.githack.com/kaicarver/leaflet/master/index.html

## TODOs

* lat/lon should be displayable and/or updated by hovering, clicking on the map
* be responsive, with map taking whole page, no weird scrolling
* handle #hash parameters same as regular URL parameters?
  * would allow no-reload, more [SPA](https://en.wikipedia.org/wiki/Single-page_application)-like
  * why am I rolling my own SPA?... laziness?...
* Handle [FOUC](https://en.wikipedia.org/wiki/Flash_of_unstyled_content), more like FODT or FONJT (default, non JS)
* GPS tracks should be
  * optionally displayed
  * distinguishable
  * clickable to show date and distance and time info
  * transparent for heatmap effect
  * enterable by pasting in GeoJSON or a Strava etc. URL
  * ...imported automatically from Strava or Garmin or other
* try to keep from bloating to another Acme Maps...
  * I mean keep in mind this nice app which does not need reinventing<br>
  https://mapper.acme.com/?ll=48.87917,2.38472&z=11&t=M
* but copy some of its nice features:
  * allow (or require? avoid TMTOWTDI) `ll=x,y` param instead of tedious `lat=x&lon=y` 5 keys longer
  * add `z` zoom param and `t` type of map param
  * should update URL params like lat, lon, zoom
* handle no-Javascript case:
  * at least, show an image of what it would look like
  * at best, generate the right image server-side

### TODONEs

* when first displayed, the form should match the URL params

#### Show Strava / Garmin runs on map

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

#### How to add runs

Here's the current super-manual procedure to add a run to the map:

1. Download the GPX file from Strava.
2. Do this:

```bash
$ mv /mnt/c/Users/Kai/Downloads/*.gpx data/arun.gpx
$ togeojson < data/arun.gpx | python -m json.tool > data/arun.json
```

3. copy the pretty-printed JSON into the `runs` array in `runs.js`.

UPDATED manual method!

1. Download the GPX file from Strava to `/mnt/c/Users/Kai/Downloads/`
2. `npm run build`
3. `emacs runs.js /tmp/arun.json`
4. copy the contents of `arun.json` as the last element
   of the `runs` array in `runs.js`

UPDATED again:

1. Download one or more GPX files from Strava to `/mnt/c/Users/Kai/Downloads/`
2. `make`

## Notes

An old but good tip for quickly selecting certain form elements for styling:

https://css-tricks.com/styling-texty-inputs-only
