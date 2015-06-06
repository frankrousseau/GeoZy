## v0.2.0-rc1
remove from ./package.json
*	geojson-extent: 0.3.1
* geojson-normalize: 0.0.0
* mapbox-gl: 0.7.0
* mapbox.js: 2.1.8

______________________

- remane module MapBox to MyMap
- rename `mapbox.coffee` to `mymap.coffee`

## v0.2.0-beta.1 (5/06/15)
* leaflet: 0.7.3  
* react-leaflet: 0.6.1  

______________________

- remove MapBox, Leaflet and Font Awesome CDN
- materials are noved inside public/
    - /assets
    - /templates
    - /styles
- geojson data are moved to `index.coffee` as bookmarkDatas
  - geojson features are now `@states Components` inside `sidebar.coffee`
- map use now a TileLayer based on osm.org with basic params inside `mapbox.coffee`

## v0.1.0-beta.1 (27/05/15)
- Mockup in JS with MapBox and Leaflet CDN:
  - Components used L.leaflet.mapbox.
  - Geolocalisations data are also inside render.js declared as `var geojson`
- Change the DB name inside `/bin`
  - index.coffee is not hacked yet and the API is not used.
