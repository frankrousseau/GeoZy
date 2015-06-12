React = require 'react'
# Optional L to use vanilla leaflet
#L = require 'leaflet'

{mapCenter, setZoom} = require 'leaflet.defaultextent'
#L.control.locate = require 'leaflet.locatecontrol'

{div, p, a, button, span, input, label, h1} = React.DOM
{Map, TileLayer, ImageOverlay, Marker, Popup} = require 'react-leaflet'


# creat react-leaflet markers
Map = React.createFactory Map
TileLayer = React.createFactory TileLayer
ImageOverlay = React.createFactory ImageOverlay
Marker = React.createFactory Marker
Popup = React.createFactory Popup


# debug map size
width = window.innerWidth or \
    document.documentElement.clientWidth or \
    document.body.clientWidth

height = window.innerHeight or \
    document.documentElement.clientHeight or \
    document.body.clientHeight


module.exports = MyMap = React.createFactory React.createClass

    getInitialSate: ->
        return firstRender: true

    render: ->
        mapCenter = @props.maplatlng
        setZoom = @props.homezoom
        params =
            center: mapCenter   #@props.maplatlng         #LatLng (required, dynamic) Center of the map
            defaultExtentControl: true
            zoom: setZoom  #@props.homezoom             #Number (optional, dynamic)
            style:                        #Object (optional, dynamic)
                width: (width - 440) + 'px'
                height: height + 'px'
                left: '440px'
                right: '0px'

        @map = Map params,
            TileLayer
                url: 'http://{s}.tile.osm.org/{z}/{x}/{y}.png'
                attribution: '<a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
            Marker
                position: @props.markerlatlng
                Popup null,
                    span className: 'gpopup',
                        "Here is #{@props.label}: "
                        "#{@props.markerlatlng}"

    changePosition: ->
        alert 'change'
        console.log @map.leafletElement


# Custom
# get mouse coodrinates
# Mcoordinates = document.getElementById('coordinates')
# Map 'mousemove', (e) ->
#  m = e.LatLng
#  Mcoordinates.innerHTML = 'Latitude: ' + m.Lat + '<br />Longitude: ' + m.Lng
#  return
#  render: -> console.log m.Lat
