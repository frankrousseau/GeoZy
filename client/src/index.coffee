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


getHomePosition = (city) ->
    return [48.8567, 2.3508] # toujours Paris


# C'est le composant principal de l'application.
MyPlaceComponent = React.createClass

    getInitialState: ->
        return center: [51.545, -0.09]

    # Ici on assure le rendu de ce composant.
    render: ->
        console.log @state.center
        div className: 'main',
            # Ici c'est un composant spécifique que nous avons créé.
            SideBar
               bookmarkDatas: @props.bookmarkDatas
               onShowHomeClicked: @onShowHomeClicked
            MyMap
                center: @state.center

    onShowHomeClicked: ->
        @setState
            center: getHomePosition()




# Ici on initialise l'application.
initApp = ->
    data = bookmarkDatas: bookmarkDatas
    React.render(React.createElement(MyPlaceComponent, data),
                 document.getElementById('app'))


initApp()
