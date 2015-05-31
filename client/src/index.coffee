React = require 'react'
{div, p, a, button, input, label, h1} = React.DOM


SideBar = React.createClass

    # Ici on assure le rendu de ce composant.
    render: ->
        div id: 'sidebar',
            h1 id: "title", 'My Places'
            # Ici c'est un composant spécifique que nous avons créé.
            BookmarkListComponent
                bookmarkDatas: @props.bookmarkDatas


# Le composant liste de bookmark.
BookmarkListComponent = React.createFactory React.createClass

    # On définit l'état initial du composant bookmarks, cela est utile pour le
    # rendu dynamique. En effet on lui indique par cet état la liste des
    # bookmarks à afficher. Il suffira de changer cette liste pour que le rendu
    # se déclenche et que l'écran soit mis à jour en fonction.
    getInitialState: ->
        return bookmarkDatas: @props.bookmarkDatas


    # Rendu du composant.
    render: ->

        div id: "bookmark-list",
            # Ici on génère un composant bookmark par bookmark présentes
            # dans la liste. La fonction map permet de constituer un
            # tableau de composant bookmark à partir d'une liste de
            # d'objet bookmark.
            @getBookmarkComponents()

    getBookmarkComponents: ->
        bookmarkComponents = []
        for bookmarkData in @state.bookmarkDatas
            bookmarkComponent = BookmarkComponent
                label: bookmarkData.features[0].properties.label
                address: bookmarkData.features[0].properties.address
            bookmarkComponents.push bookmarkComponent
        return bookmarkComponents



# Le composant qui va définir une ligne de bookmark.
BookmarkComponent = React.createFactory React.createClass

    getInitialState: ->
        return {
            label: @props.label
            address: @props.address
        }

    # Rendu de la bookmark, on
    render: ->
        div null,
            p {className: "label"},
                @state.label
            p {className: 'address'},
                @state.address

var MyPlaceComponent = React.createFactory(require('MyPlaceComponent'));

# C'est le composant principal de l'application.
MyPlaceComponent = React.createClass

    # Ici on assure le rendu de ce composant.
    render: ->
        div className: 'main',
            # Ici c'est un composant spécifique que nous avons créé.
            SideBar
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


# Ici on démarre !
#
# On récupère d'abord les bookmarks stockées sur le serveur.



React.render(React.createElement(MyPlaceComponent , bookmarkDatas: bookmarkDatas),
             document.getElementById('app'))
