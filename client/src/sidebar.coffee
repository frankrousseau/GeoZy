React = require 'react'
{div, p, a, button, input, label, h1} = React.DOM

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
#Search by properties when "fa fa-list" Search on map address when "fa fa-location-arrow".
#Click to select.
              id: "search", input className: 'input', ' ', label className: 'fa fa-list', ' ', label className: 'fa fa-location-arrow',
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

    # Rendu de la cellule info
    render: ->
      div id: 'afk',
        div className: 'item',
            p {className: "title"},
                @state.label
            p {className: 'irl'},
#Should be a if conditions @state.state=1 and @state.city=1 then put ',' before.
#idem for country with '-'
                "#{@state.address} #{@state.postalCode} #{@state.city}, #{@state.state} #{@state.zip} - #{@state.country}"
                div id: 'infow',
            p {className: 'kontact'},
              #  "<a href=" + @state.website + " target=_blank>" + @state.website + "</a>"
              #  "<a href='#{@state.website}'>#{@state.website}</a>"

                "#{@state.website} #{@state.email} #{@state.phone}"
            p {className: 'tag'},
                @state.tag
#            p {className: 'tag'},
#                  "#{@state.type}: #{@state.coordinates}"
