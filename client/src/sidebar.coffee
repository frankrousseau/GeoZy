React = require 'react'
{div, p, a, button, input, label, h1} = React.DOM


# C'est la barre qui apparait à gauche. Elle contient la liste des bookmarks
# disponibles.
module.exports = SideBar = React.createFactory React.createClass

    render: ->
        div id: 'sidebar',
            h1 id: "title", 'My Places'
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
            # dans la liste.
            @getBookmarkComponents()

    # Cette fonction renvoie un la liste des bookmarks qu'on veut générer.
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

    # Rendu de la bookmark
    render: ->
        div null,
            p {className: "label"},
                @state.label
            p {className: 'address'},
                @state.address
