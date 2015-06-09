React = require 'react'
# Optional L to use vanilla leaflet
#L = require 'leaflet'
{div, p, a, button, span, input, label, h1} = React.DOM
{Map, TileLayer, ImageOverlay, Marker, Popup} = require 'react-leaflet'

# creat react-leaflet markers
Map = React.createFactory Map
TileLayer = React.createFactory TileLayer
ImageOverlay = React.createFactory ImageOverlay
Marker = React.createFactory Marker
Popup = React.createFactory Popup

# Custom

#get mouse coodrinates
#Mcoordinates = document.getElementById('coordinates')
#Map 'mousemove', (e) ->
#  m = e.LatLng
#  Mcoordinates.innerHTML = 'Latitude: ' + m.Lat + '<br />Longitude: ' + m.Lng
#  return
#  render: -> console.log m.Lat


# debug map size
width = window.innerWidth or \
    document.documentElement.clientWidth or \
    document.body.clientWidth

height = window.innerHeight or \
    document.documentElement.clientHeight or \
    document.body.clientHeight


module.exports = MyMap = React.createFactory React.createClass


    render: ->

        params =
#            id: geozymap                  #(optional) ReferenceError: geozymap is not defined
            center: @props.maplatlng         #LatLng (required, dynamic) Center of the map
            zoom: @props.mapzoom             #Number (optional, dynamic)
            style:                        #Object (optional, dynamic)
                width: (width - 440) + 'px'
                height: height + 'px'
                left: '440px'
                right: '0px'

        Map params,
            TileLayer
                url: 'http://{s}.tile.osm.org/{z}/{x}/{y}.png'    #String (required, dynamic)
                attribution: '<a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
#            ImageOverlay
#                url: '' #String (required, dynamic)
#                opacity: '' #Number (optional, dynamic)
#                attribution: ''  #String (optional)
            Marker
                position: @props.markerlatlng   #LatLng (required, dynamic) position du Marker
#                icon: 'Leaflet.Icon'        #optional, dynamic / ReferenceError: Leaflet is not defined
#                zIndexOffset: 'Number'      #(optional, dynamic)
#                opacity: 'Number'           #(optional, dynamic)
                Popup null,
#                    position: 'latlng'      #LatLng (optional, dynamic)
                    span className: 'gpopup',
                        "Here is #{@props.label}: "
                        "#{@props.center}"
                        # can't do react action in popup? https://github.com/PaulLeCam/react-leaflet/issues/11
                        #button onClick: @props.onShowZoomifyClicked, 'ZOOM'
