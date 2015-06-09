React = require 'react'
{div} = React.DOM

SideBar = require './sidebar.coffee'
MyMap = require './mymap.coffee'
#bookmarkDatas = require './geojson/base.geojson'
#bookmarkxDatas = require './gpx/base.gpx'

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


# variable Dyn du composant MyPlace
# ici c'est Paris
getDashToHome = (myview) ->
    return [48.8567, 2.3508]
# ici le Zoom
getHomeZoomify = (zoomme) ->
    return 18
# ici c'est les listings de sidebar
getDashToListings = (pinpoint) ->
    return [48.8567, 2.3508]



# C'est l'état Initial du composant MyPlace
MyPlaceComponent = React.createClass

    getInitialState: ->
        return dash2home: [51.478978, -0.010642], markerlatlng: [51.478978, -0.010642], maplatlng: [51.478978, -0.010642], homezoom: 3,


    render: ->
        div className: 'main',
            MyMap
                dash2home: @state.dash2home
                markerlatlng: @state.markerlatlng
                maplatlng: @state.maplatlng
                homezoom: @state.homezoom
                console.log "MyMap-maplatlng", @state.maplatlng, "MyMap-zoom", @state.homezoom, "MyMap-Mrkpos", @state.markerlatlng
#                onShowZoomifyClicked: @onShowZoomifyClicked #need to fix cf: mymap 52,25
            SideBar
#                console.log @props.BookmarkComponents
#               MyPlaceComponent: @props.MyPlaceComponent
               bookmarkDatas: @props.bookmarkDatas
               onShowHomeDashToHomeClicked: @onShowDashToHomeClicked
#               onShowHomeZoomifyClicked: @onShowHomeZoomifyClicked
               onShowDashToListingsClicked: @onShowDashToListingsClicked



# Attribution de l'état du composant My Place
    onShowDashToHomeClicked: ->
        @setState
            maplatlng: getDashToHome()
            homezoom: getHomeZoomify()
            markerlatlng: getDashToHome()

    onShowDashToListingsClicked: ->
        @setState
            maplatlng: getDashToListings()
            homezoom: 19
            markerlatlng: getDashToListings()



# Ici on initialise l'application.
initApp = ->
    data = bookmarkDatas: bookmarkDatas
    React.render(React.createElement(MyPlaceComponent, data),
                 document.getElementById('app'))


initApp()
