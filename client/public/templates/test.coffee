React = require 'react'
{div, p, a, button, input, label, h1, h2, br, span, i} = React.DOM


# test SetActive
ItemComponent = React.createFactory React.createClass

  onItemComponentClicked: (event) ->
        className: 'active'
        return onItemComponentClicked

    render: ->
        div id: 'item',
            ItemComponent
            onClick: @onItemComponentClicked



"[#{@state.lat}, #{@state.lng}]"

getShowMeThat = (gotopin) ->
#    return [@state.coordinates]
     return [51.478978, -0.010642]


    getInitialState: ->
        return
            position: [51.478978, -0.010642]

    render: ->
        div className: 'main',

            SideBar
               onShowMeThatClicked: @onShowMeThatClicked


    onShowMeThatClicked: ->
        @setState
            position: getShowMeThat()
# need to fix: TypeError: latlng is undefined







JsonCoordinatesComponent = React.createFactory React.createClass

    getInitialState: ->
        return JsonCoordinates: @state.JsonLatLng
