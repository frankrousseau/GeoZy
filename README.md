### GeoZy webapp development
*simple tool for rendering .geojson files with MapBox*  

It should be a portage of [GeoZy-Ex](https://github.com/ChironGizmo/GeoZy-EX) into CoffeeScript based on [shareable-app-coffee-americano](https://github.com/frankrousseau/shareable-app-coffee-americano/blob/master/server.coffee), to ultimately being deployed on a  CozyCloud instance.

### ToDo
short terms:
* add a marker and be enable to save/edit as geojson with properties
* add a tool to creat/edit the listings files properties
* enable search by tag/label or all properties

### Documentations
[http://leafletjs.com/reference.html](http://leafletjs.com/reference.html)  
[https://www.mapbox.com/mapbox.js/example/v1.0.0/](https://www.mapbox.com/mapbox.js/example/v1.0.0/)  
[https://www.mapbox.com/mapbox.js/api/v2.1.9/](https://www.mapbox.com/mapbox.js/api/v2.1.9/)  
[http://geojson.org/](http://geojson.org/)  
[https://github.com/cozy](https://github.com/cozy)  

### How to Use and Install

**Early stage**  
**Need to fix some issues, thanks!!**  

CoffeeScript should be already installed, right!  
```
sudo npm install coffee-script -g
```
Then,  
```
git clone https://github.com/ChironGizmo/GeoZy
cd GeoZy
sudo npm install
coffee server.coffee
open http://localhost:9240
```
