// render call into divs map, listings //
//require('mapbox.js');
//require('mapbox-gl');
//require('./style/mapbox-"layer-name".json');
//require('geojson-extent');
//require('geojson-normalize');


L.mapbox.accessToken = 'pk.eyJ1Ijoicm9ieXJlbXp5IiwiYSI6InBTSzNKZWMifQ.q-4jrI_7B-3Cjv8nPVimgg';
var geojson = [
  {
    "type": "FeatureCollection",
    "features": [
      {
        "type": "Feature",
        "geometry": {
          "type": "Point",
          "coordinates": [
            2.3412171006202698,
            48.87195735509332
          ]
        },
        "properties": {
          "label": "MoZilla France",
          "address": "16 Boulevard Montmartre",
          "postalCode": "75009",
          "city": "Paris",
          "state": "",
          "country": "France",
          "phone": "+33 42 42 1337",
          "email": "foo@bar.io",
          "website": "http://foobar.io",
          "tag": "tag"
        }
      },
      {
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [
          2.381758689880371,
          48.864848860752446
        ]
      },
      "properties": {
        "label": "La Fine Mousse",
        "address": "6 et 4bis avenue Jean Aicard",
        "postalCode": "75011",
        "city": "Paris",
        "state": "",
        "country": "France",
        "phone": "+33 1 48 06 40 94",
        "email": "foo@bar.io",
        "website": "http://www.lafinemousse.fr/",
        "note": "all week 17:00/02:00",
        "marker-color": "",
        "marker-size": "",
        "marker-symbol": "",
        "tag": "bar, biere, french"
      }
    },
  ]
}
    ]
  }
];

// Features of the map
var map = L.mapbox.map('map', null).setView([48.857671288923, 2.352084142948], 13)
.addControl(L.mapbox.geocoderControl('mapbox.places', {
    autocomplete: true
}));

L.control.locate({

}).addTo(map);

L.control.fullscreen().addTo(map);

var layers = {
    Streets: L.mapbox.tileLayer('examples.map-i87786ca'),
    OpenStreetMap: L.mapbox.tileLayer('examples.ik7djhcc'),
    Satellite: L.mapbox.tileLayer('examples.map-igb471ik')
};

layers.Streets.addTo(map);
L.control.layers(layers).addTo(map);

var featureGroup = L.featureGroup().addTo(map);

var drawControl = new L.Control.Draw({
  edit: {
    featureGroup: featureGroup
  },
  draw: {
    polygon: true,
    polyline: false,
    rectangle: false,
    circle: false,
    marker: true
  }
}).addTo(map);

map.on('draw:created', showPolygonArea);
map.on('draw:edited', showPolygonAreaEdited);

function showPolygonAreaEdited(e) {
  e.layers.eachLayer(function(layer) {
    showPolygonArea({ layer: layer });
  });
}
function showPolygonArea(e) {
  featureGroup.clearLayers();
  featureGroup.addLayer(e.layer);
  e.layer.bindPopup((LGeo.area(e.layer) / 1000000).toFixed(2) + ' km<sup>2</sup>');
  e.layer.openPopup();
}

map.scrollWheelZoom.enable();



// Listing of the geojson files and show them on map
var listings = document.getElementById('listings');
var locations = L.mapbox.featureLayer().addTo(map);

// call the var geojson above
locations.setGeoJSON(geojson);

function setActive(el) {
var siblings = listings.getElementsByTagName('div');
for (var i = 0; i < siblings.length; i++) {
  siblings[i].className = siblings[i].className
  .replace(/active/, '').replace(/\s\s*$/, '');
}

el.className += ' active';
}

locations.eachLayer(function(locale) {

// Shorten locale.feature.properties to just `prop` so we're not
// writing this long form over and over again.
var prop = locale.feature.properties;

// marker popup on the map.
var popup = '<h3>' + prop.label + '</h3><div>' + prop.address + '<br />' + prop.postalCode + ' ' + prop.city;

var listing = listings.appendChild(document.createElement('div'));
listing.className = 'item';

var link = listing.appendChild(document.createElement('a'));
link.href = '#';
link.className = 'title';

// listing display
link.innerHTML = '<large class="hot">' + prop.label + '</large><br />' + prop.address + ' ' + prop.postalCode + ' ' + prop.city + ' ' + prop.country;
if (prop.website) {
popup += '<br /><small class="quiet">' + '<a href="' + prop.website + '" target="_blank">' + prop.website + '</a>' + '<br />' + prop.email + '</small>';
if (prop.tag) {
link.innerHTML += '<br><small class="tagz">' + prop.tag + '</small>';
  }
}

var details = listing.appendChild(document.createElement('div'));
if (prop.website) {
details.innerHTML +=  '<small>' + '<a href="' + prop.website + '" target="_blank">' + prop.website + '</a>' + '</small>';
if (prop.email) {
details.innerHTML += '<small class="quiet">' + ' &middot; ' + prop.email + '</small>';
if (prop.phone) {
details.innerHTML += '<small class="quiet">' + ' &middot; ' + prop.phone + '</small>';
    }
  }
}

link.onclick = function() {
setActive(listing);

// When a menu item is clicked, animate the map to center
// its associated locale and open its popup.
map.setView(locale.getLatLng(), 16);
locale.openPopup();
return false;
};

// Marker interaction
locale.on('click', function(e) {
// 1. center the map on the selected marker.
map.panTo(locale.getLatLng());

// 2. Set active the markers associated listing.
setActive(listing);
});

popup += '</div>';
locale.bindPopup(popup);

});
