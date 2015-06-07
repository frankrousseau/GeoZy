React = require 'react'
{div} = React.DOM

SideBar = require './sidebar.coffee'
MyMap = require './mymap.coffee'


# Met tes données de départ ici !
bookmarkDatas = [
     {
        "type": "FeatureCollection"
        "features": [
            {
                "type": "Feature"
                "geometry":
                    "type": "Point"
                    "coordinates": [
                        2.3412171006202698
                        48.87195735509332
                    ]
                "properties":
                    "label": "MoZilla France"
                    "address": "16 Boulevard Montmartre"
                    "postalCode": "75009"
                    "city": "Paris"
                    "state": ""
                    "zip": ""
                    "country": "France"
                    "phone": ""
                    "email": ""
                    "website": ""
                    "note": ""
                    "marker-color": ""
                    "marker-size": ""
                    "marker-symbol": ""
                    "tag": "mytag"
            }
        ]
    }
    {
        "type": "FeatureCollection"
        "features": [
            "type": "Feature"
            "geometry":
                "type": "Point"
                "coordinates": [
                  2.381758689880371
                  48.864848860752446
                ]
            "properties":
                "label": "La Fine Mousse"
                "address": "6 et 4bis avenue Jean Aicard"
                "postalCode": "75011"
                "city": "Paris"
                "state": "Ile de France"
                "zip": ""
                "country": "France"
                "phone": "+33 1 48 06 40 94"
                "email": "foo@bar.io"
                "website": "http://www.lafinemousse.fr/"
                "note": "all week 17:00/02:00"
                "marker-color": ""
                "marker-size": ""
                "marker-symbol": ""
                "tag": "bar biere french"
            ]
    }

]

# C'est les data du composant MyPlace
getHomePosition = (city) ->
    return [48.8567, 2.3508] # toujours Paris
#    return [@state.coordinates]

getHomeZoom = (viewmycity) ->
    return [13]

getShowMeThat = (gotopin) ->
    return [@state.coordinates]


# C'est l'état Initial du composant MyPlace
MyPlaceComponent = React.createClass

    getInitialState: ->
        return center: [51.478978, -0.010642], zoom: 3, position: [0,11 -0,11],

    render: ->
        div className: 'main',
            MyMap
                center: @state.center
                zoom: @state.zoom
                onShowZoomifyClicked: @onShowZoomifyClicked
            SideBar
               bookmarkDatas: @props.bookmarkDatas
               onShowHomeClicked: @onShowHomeClicked
               onShowZoomifyClicked: @onShowZoomifyClicked
               onShowMeThatClicked: @onShowMeThatClicked


# Attribution de l'état du composant My Place
    onShowHomeClicked: ->
        @setState
            center: getHomePosition()
            zoom: getHomeZoom()

    onShowZoomifyClicked: ->
        @setState
            zoom: getHomeZoom()

    onShowMeThatClicked: ->
        @setState
            position: getShowMeThat()

# Ici on initialise l'application.
initApp = ->
    data = bookmarkDatas: bookmarkDatas
    React.render(React.createElement(MyPlaceComponent, data),
                 document.getElementById('app'))


initApp()
