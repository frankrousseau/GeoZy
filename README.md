# GeoZy
`status: in development for v0.2.0-rc1`  
> simple tool for rendering GeoBookmarks files with OpenStreetMap  

![screeshot](https://raw.githubusercontent.com/ChironGizmo/GeoZy/master/client/public/assets/img/0.png)

The server is based  on [shareable-app-coffee-americano](https://github.com/frankrousseau/shareable-app-coffee-americano/), with a standalone focus but also [CozyCloud](https://github.com/mycozycloud) friendly. The frontend is built with [React](https://facebook.github.io/react/), it used [OSM](http://osm.org) with [leaflet](http://leafletjs.com/) and [Ract-Leaflet](https://github.com/PaulLeCam/react-leaflet) witch provide components for Leaflet maps.

## Development
This project is still an attempt to provide a user friendly Geolocalisation WebbApp.
It's also a part of a french [mentorship programme](https://forum.cozy.io/t/app-geozy-en-developpement/511) with Cozy members.  

ATM:  
* organize some leaflets on map
* sidebar and map communications
* rendering bookmarks on map

SOON:
* enable search by tag/label and all properties
* [add leaflet-extra](http://leaflet-extras.github.io/leaflet-providers/preview/)
* [add leaflet.pouch](https://github.com/calvinmetcalf/leaflet.pouch)
* Responsive design

IN-MIND:  
import/export geolocalisation files and storage  
- In Version 0.2.0-rc1
 - there is no storage inside `pouchdb` yet.  
- working with .geojson with a focus on moving to .gpx but still accept .geojson
 - check [leaflet-ajax](https://github.com/calvinmetcalf/leaflet-ajax) and [leaflet-gpx](https://github.com/mpetazzoni/leaflet-gpx)
- keep track on App:
 - [Fancy Palces](https://github.com/gabm/FancyPlaces)
 - [Run-Bike-Hike](https://github.com/nicodel/Run-Bike-Hike)

*previous steps on CHANGELOG.md*

## Config

CoffeeScript should be already installed  
```bash
sudo npm install coffee-script -g
```
Then,  
```bash
git clone https://github.com/ChironGizmo/GeoZy
cd GeoZy
sudo npm install
coffee server.coffee
open http://localhost:9240
```
Client, debug
```bash
cd client
npm install
npm start
```
### usefull links
[https://switch2osm.org](https://switch2osm.org)  
[GPX file](http://en.wikipedia.org/wiki/GPS_Exchange_Format)  
[geojson](http://geojson.org/)
