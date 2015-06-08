React = require 'react'
{div} = React.DOM

SideBar = require './sidebar.coffee'
MyMap = require './mymap.coffee'
#bookmarkDatas = require './geojson/base.geojson'
#bookmarkxDatas = require './gpx/base.gpx'

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
# {lat: Number, lng: Number}
# C'est les data du composant MyPlace
getHomePosition = (city) ->
#    return [48.8567, 2.3508] # toujours Paris
    return [48.8567, 2.3508]

#    return [@state.coordinates]

getHomeZoom = (viewmycity) ->
    return [13]

getShowMeThat = (gotopin) ->
     return [48.8567, 2.3508]

#     return [51.478978, -0.010642]

# C'est l'état Initial du composant MyPlace
MyPlaceComponent = React.createClass

    getInitialState: ->
        return center: [51.478978, -0.010642], latlng: [51.478978, -0.010642], zoom: [3],


    render: ->
        div className: 'main',
            MyMap
                center: @state.center
                latlng: @state.latlng
                zoom: @state.zoom
                console.log @state.center
                console.log @state.latlng
                console.log @state.zoom

#                console.log @state.lat
#                console.log @state.lng
#                onShowZoomifyClicked: @onShowZoomifyClicked #need to fix cf: mymap 52,25
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
            latlng: getHomePosition()

    onShowZoomifyClicked: ->
        @setState
            zoom: getHomeZoom()

    onShowMeThatClicked: ->
        @setState
            center: getShowMeThat()
            zoom: [17]
            latlng: getShowMeThat()

# Ici on initialise l'application.
initApp = ->
    data = bookmarkDatas: bookmarkDatas
    React.render(React.createElement(MyPlaceComponent, data),
                 document.getElementById('app'))


initApp()
