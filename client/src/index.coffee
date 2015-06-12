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

# Dash To listings
getDashToListings = (pinpoint) ->
    return [48.1337, 2.4242]
# zoom on bookmark marker
getListingsZoomify = (zoomthat) ->
    return 19



# C'est l'état Initial du composant MyPlace
MyPlaceComponent = React.createClass

    getInitialState: ->
        return {
            markerlatlng: [50.901389, 4.484444]
            maplatlng: [50.901389, 4.484444]
            homezoom: 8
        }


    render: ->
        div className: 'main',
            SideBar
                bookmarkDatas: @props.bookmarkDatas
                showDashToListingsClicked: @showDashToListingsClicked
            MyMap
                markerlatlng: @state.markerlatlng
                maplatlng: @state.maplatlng
                homezoom: @state.homezoom


    # Attribution de l'état du composant My Place
    showDashToListingsClicked: (ilat, ilng) ->
        @setState
            maplatlng: [ilat, ilng]
            homezoom: getListingsZoomify()
            markerlatlng: [ilat, ilng]



# Ici on initialise l'application.
initApp = ->
    data = bookmarkDatas: bookmarkDatas
    React.render(React.createElement(MyPlaceComponent, data),
                 document.getElementById('app'))


initApp()
