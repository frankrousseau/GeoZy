React = require 'react'
{div, p, a, button, input, label, h1, h2, br} = React.DOM

# Icon
#fa fa-list
#fa fa-location-arrow
#fa fa-map-marker
#fa fa-globe
#icon = React.createFactory React.createClass
#     className: 'fa fa-list' + @props.iconfa-list, null


# C'est la barre qui apparait à gauche. Elle contient la liste des bookmarks
# disponibles.
module.exports = SideBar = React.createFactory React.createClass

    render: ->
        div className: 'sidebar',
            div className: 'search',
#Search by properties when "fa fa-list"
#Search on map address when "fa fa-location-arrow".
#Click to select.
              id: "search", input className: 'input', ' ', a className: 'fa fa-list',
            div className: 'heading', 'My Places'
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

        div id: "bookmark-list", className: 'listings',
            # Ici on génère un composant bookmark par bookmark présentes
            # dans la liste.
            @getBookmarkComponents()

    # Cette fonction renvoie un la liste des bookmarks qu'on veut générer.
    getBookmarkComponents: ->
        bookmarkComponents = []
        for bookmarkData in @state.bookmarkDatas
            bookmarkComponent = BookmarkComponent
                coordinates: bookmarkData.features[0].geometry.coordinates
                #if [coordinates] are a sigle pinpoint then "type": "Point"
                #coordinates: lng lat
                type: bookmarkData.features[0].geometry.type
                #label and coordinates should be the 2 imperatives values
                #needed to build a new file.
                label: bookmarkData.features[0].properties.label

                address: bookmarkData.features[0].properties.address
                postalCode: bookmarkData.features[0].properties.postalCode
                city: bookmarkData.features[0].properties.city
                state: bookmarkData.features[0].properties.state
                zip: bookmarkData.features[0].properties.zip
                country: bookmarkData.features[0].properties.country

                website: bookmarkData.features[0].properties.website
                email: bookmarkData.features[0].properties.email
                phone: bookmarkData.features[0].properties.phone

                tag: bookmarkData.features[0].properties.tag


            bookmarkComponents.push bookmarkComponent
        return bookmarkComponents


# Le composant qui va définir une ligne de bookmark.
BookmarkComponent = React.createFactory React.createClass

    getInitialState: ->
        return {
            label: @props.label

            address: @props.address
            postalCode: @props.postalCode
            city: @props.city
            state: @props.state
            zip: @props.zip
            country: @props.country

            website: @props.website
            email: @props.email
            phone: @props.phone

            tag: @props.tag

            type: @props.type
            coordinates: @props.coordinates
        }

# Rendering items on listings sidebar
    render: ->
      div id: 'afk',                  # div afk : onclick = active && show on map (focus)
        div className: 'item',
            p {className: "title"},
                @state.label
                 br null, null
            a className: 'irl',
                "#{@state.address} "
                "#{@state.postalCode} "
                "#{@state.city}, "    # ','Should be a if conditions
                "#{@state.state} "
                "#{@state.zip} "
                "#{@state.country}"

                div id: 'infow',      # div infow : onclick = active + href target _blank
            p {className: 'kontact'},
                 "#{@state.website} " # Howto do a href target=_blank
                 "#{@state.email} "
                 "#{@state.phone} "

             h1 {className: 'tag'},
                 @state.tag
                 " #{@state.type}: "
                 "#{@state.coordinates}"
                                      # when click another cell unactive && unfocus the previous 1

# test SetActive
ItemComponent = React.createFactory React.createClass

  onItemComponentClicked: (event) ->
        className: 'active'
        return onItemComponentClicked

    render: ->
        div id: 'item',
            ItemComponent
            onClick: @onItemComponentClicked
