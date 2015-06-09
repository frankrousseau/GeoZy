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

# C'est les data du composant MyPlace
getHomeMapCenter = (myview) ->
    return [48.8567, 2.3508]  # ici c'est Paris

getMarkerPosition = (pinpoint) ->
    return [48.8567, 2.3508]  # ici c'est centre de la carte

getZoomify = (zoomme) -> # ici le Zoom
    return [18]

getDashTo = (gotopin) -> #ici les coord du marker
     return [48.8567, 2.3508]


# C'est l'état Initial du composant MyPlace
MyPlaceComponent = React.createClass

    getInitialState: ->
        return center: [51.478978, -0.010642], markerlatlng: [51.478978, -0.010642], maplatlng: [51.478978, -0.010642], mapzoom: [3],


    render: ->
        div className: 'main',
            MyMap
                center: @state.center
                markerlatlng: @state.markerlatlng
                maplatlng: @state.maplatlng
                mapzoom: @state.mapzoom
#                bookmarkDatas: @props.bookmarkDatas
                console.log "MyMap-maplatlng", @state.maplatlng, "MyMap-zoom", @state.mapzoom, "MyMap-Mrkpos", @state.markerlatlng
#                onShowZoomifyClicked: @onShowZoomifyClicked #need to fix cf: mymap 52,25
            SideBar
#               MyPlaceComponent: @props.MyPlaceComponent
               bookmarkDatas: @props.bookmarkDatas
               onShowHomeMapCenterClicked: @onShowHomeMapCenterClicked
               onShowMarkerPositionClicked: @onShowMarkerPositionClicked
               onShowZoomifyClicked: @onShowZoomifyClicked
               onShowDashToClicked: @onShowDashToClicked


# Attribution de l'état du composant My Place
    onShowHomeMapCenterClicked: ->
        @setState
            maplatlng: getHomeMapCenter()
            mapzoom: getZoomify()
            markerlatlng: getHomeMapCenter()

    onShowMarkerPositionClicked: ->
       @setState
           markerlatlng: getMarkerPosition()

    onShowZoomifyClicked: ->
        @setState
            center: getDashTo()
            zoom: getZoomify()
            latlng: getDashTo()
            position: getDashTo()

    onShowDashToClicked: ->
        @setState
            center: getDashTo()
            zoom: [19]
            latlng: getDashTo()
            position: getDashTo()

# Ici on initialise l'application.
initApp = ->
    data = bookmarkDatas: bookmarkDatas
    React.render(React.createElement(MyPlaceComponent, data),
                 document.getElementById('app'))


initApp()
