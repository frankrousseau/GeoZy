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
# ici le Zoom de la Home
getHomeZoomify = (zoomme) ->
    return 12


# ici c'est les listings de sidebar
getDashToListings = (pinpoint) ->
    return [48.1337, 2.4242]
# ici c'est le zoom du marker
getListingsZoomify = (zoomthat) ->
    return 19



# C'est l'état Initial du composant MyPlace
MyPlaceComponent = React.createClass

    getInitialState: ->
        return markerlatlng: [51.478978, -0.010642], maplatlng: [51.478978, -0.010642], homezoom: 3, ilat: 51.003131, ilng: -0.01258888,


    render: ->
        div className: 'main',
            SideBar
                bookmarkDatas: @props.bookmarkDatas
                onShowHomeDashToHomeClicked: @onShowDashToHomeClicked
#               onShowHomeZoomifyClicked: @onShowHomeZoomifyClicked
                onShowDashToListingsClicked: @onShowDashToListingsClicked
#                onShowListingsZoomifyClicked: @onShowListingsZoomifyClicked
            MyMap
                markerlatlng: @state.markerlatlng
                maplatlng: @state.maplatlng
                homezoom: @state.homezoom
                BookmarkComponent: @state.BookmarkComponent

                console.log "MyMap-maplatlng", @state.maplatlng, "MyMap-zoom", @state.homezoom, "MyMap-Mrkpos", @state.markerlatlng
#                onShowListingsZoomifyClicked: @onShowListingsZoomifyClicked #need to fix cf: mymap 52,25


# Attribution de l'état du composant My Place
    onShowDashToHomeClicked: ->
        @setState
            maplatlng: getDashToHome()
            homezoom: getHomeZoomify()
            markerlatlng: getDashToHome()

# récupération des lat lng des items de sidebar


    onShowDashToListingsClicked: ->
        @setState
            maplatlng: [@props.ilat, @props.ilng]
            homezoom: getListingsZoomify()
            markerlatlng: [@props.ilat, @props.ilng]



# Ici on initialise l'application.
initApp = ->
    data = bookmarkDatas: bookmarkDatas
    React.render(React.createElement(MyPlaceComponent, data),
                 document.getElementById('app'))


initApp()
