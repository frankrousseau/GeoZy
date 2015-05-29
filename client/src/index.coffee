React = require 'react'
{div, p, a, button, input, label, h1} = React.DOM
Sidebar = require './sidebar'
MapBox = require './mapbox'


# C'est le composant principal de l'application.
MyPlaceComonent = React.createClass

    # Ici on assure le rendu de ce composant.
    render: ->
        div className: 'main',
            # Ici c'est un composant spécifique que nous avons créé.
            SideBar
                bookmarkDatas: @props.bookmarkDatas
            MapBox
                bookmarkDatas: @props.bookmarkDatas




# Ici on démarre !
#
# On récupère d'abord les bookmarks stockées sur le serveur.
# Attention le premier élément de react ne doit pas être attaché
# directement à l'élément body.
#

bookmarkDatas = [
 # Met tes données de départ ici !
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
                    "country": "France"
                    "phone": "+33 42 42 1337"
                    "email": "foo@bar.io"
                    "website": "http://foobar.io"
                    "tag": "tag"
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
                "state": ""
                "country": "France"
                "phone": "+33 1 48 06 40 94"
                "email": "foo@bar.io"
                "website": "http://www.lafinemousse.fr/"
                "note": "all week 17:00/02:00"
                "marker-color": ""
                "marker-size": ""
                "marker-symbol": ""
                "tag": "bar biere, french"
            ]
    }
]
React.render(React.createElement(MyPlaceComponent , bookmarkDatas: bookmarkDatas),
             document.getElementById('app'))
