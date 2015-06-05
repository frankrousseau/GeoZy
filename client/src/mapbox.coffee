React = require 'react'
{div, p, a, button, input, label, h1} = React.DOM


# C'est la barre qui apparait à gauche. Elle contient la liste des bookmarks
# disponibles.

# a propos de Leaflet
# https://switch2osm.org/fr/utilisation-des-tuiles/debuter-avec-leaflet/
# https://github.com/Leaflet/Leaflet
# ou
# a propos de Open Layer
# https://github.com/openlayers/ol3
# ou
# la sandbox MapBox
# cf comments on index.html

module.exports = MapBox = React.createFactory React.createClass

    render: ->
        div id: 'mapbox',
            null
