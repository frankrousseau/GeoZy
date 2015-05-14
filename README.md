### GeoZy webapp development
*simple tool for rendering .geojson files with MapBox*  

It should be a portage of [GeoZy-Ex](https://github.com/ChironGizmo/GeoZy-EX) into CoffeeScript based on [shareable-app-coffee-americano](https://github.com/frankrousseau/shareable-app-coffee-americano/blob/master/server.coffee), to ultimately be deployed on a  CozyCloud instance.



### How to Use and Install

**Early stage go to [GeoZy-Ex](https://github.com/ChironGizmo/GeoZy-EX)**  
**Need to fix some issues, thanks!!**  

CoffeeScript should be already installed, right!  
```
sudo npm install coffee-script -g
```
Then,  
```
git clone https://github.com/ChironGizmo/GeoZy
cd Geozy
sudo npm install
coffee server.coffee
open http://localhost:9240
```
