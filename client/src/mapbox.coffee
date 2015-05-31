React = require 'react'
{div, p, a, button, input, label, h1} = React.DOM


# C'est la barre qui apparait à gauche. Elle contient la liste des bookmarks
# disponibles.
module.exports = MapBox = React.createFactory React.createClass

    render: ->
        div id: 'mapbox',
            null
