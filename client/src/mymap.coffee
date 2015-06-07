React = require 'react'
# Optional L to use vanilla leaflet
L = require 'leaflet'
{div, p, a, button, span, input, label, h1} = React.DOM
{Map, TileLayer, Marker, Popup} = require 'react-leaflet'

# creat react-leaflet markers
Map = React.createFactory Map
TileLayer = React.createFactory TileLayer
Marker = React.createFactory Marker
Popup = React.createFactory Popup

# Custom


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
            center: @props.center
            zoom: @props.zoom
            style:
                width: (width - 440) + 'px'
                height: height + 'px'
                left: '440px'
                right: '0px'

        Map params,
            TileLayer
                url: 'http://{s}.tile.osm.org/{z}/{x}/{y}.png'
                attribution: '<a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
            Marker
                position: @props.center,
                Popup null,
                    span className: 'gpopup',
                        "Here is @: "
                        "#{@props.center}"
                        " my friend "
                        # can't do react action in popup? https://github.com/PaulLeCam/react-leaflet/issues/11
                        button onClick: @props.onShowZoomifyClicked, 'ZOOM'