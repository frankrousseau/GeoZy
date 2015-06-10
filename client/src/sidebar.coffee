React = require 'react'
{div, p, a, button, input, label, h1, h2, br, span, i} = React.DOM

# Icon
#fa fa-list
#fa fa-location-arrow
#fa fa-map-marker
#fa fa-globe

# contient la liste des bookmarks disponibles.
module.exports = SideBar = React.createFactory React.createClass

    render: ->
        div className: 'sidebar',
            div className: 'home-button',
                button onClick: @props.onShowHomeDashToHomeClicked,'Show Home'
                button onClick: @props.onShowDashToListingsClicked, '.'
#                console.log "ETAT INITIAL home", @state.maplatlng
#                button onClick: @props.onShowZoomifyClicked, 'ZOOM'
#                button onClick: @props.onShowMeThatClicked, 'GO '
            div id: "asearch", className: 'search', 'search'
            input className: 'input', null

            div className: 'heading', 'My Places'
            BookmarkListComponent
                bookmarkDatas: @props.bookmarkDatas
#            MyPlaceStuffComponent
#                MyPlaceComponent: @props.MyPlaceComponent



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

    # Cette fonction renvoie à la liste des bookmarks qu'on veut générer.
    getBookmarkComponents: ->
        bookmarkComponents = []
        for bookmarkData in @state.bookmarkDatas
            bookmarkComponent = BookmarkComponent
                icoordinates: bookmarkData.features[0].geometry.coordinates # /!\ coordinates: [lng,lat]
                ilng: bookmarkData.features[0].geometry.coordinates[0]
                ilat: bookmarkData.features[0].geometry.coordinates[1]

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
            icoordinates: @props.icoordinates
            ilat: @props.ilat
            ilng: @props.ilng

            maplatlng: [@props.ilat, @props.ilng]
            markerlatlng: [@props.ilat, @props.ilng]
            homezoom: 15
        }

# Rendering items on listings sidebar
    render: ->
      div id: 'afk',                  # div afk : onclick = active && show on map (focus)
        div className: 'item',
            button onClick: @props.onShowDashToListingsClicked, '.'
            console.log "list-maplatlng", @state.maplatlng, "list-zoom", @state.homezoom, "list-Mrkpos", @state.markerlatlng
            p {className: "title"},
                "#{@state.label}"
                 br null, null
            span {className: "mygps"},
                "Lat: #{@state.ilat} Lng: #{@state.ilng}"
                 br null, null
            span className: 'irl',
                "#{@state.address} "
                "#{@state.postalCode} "
                "#{@state.city}, "    # ','Should be a if conditions
                "#{@state.state} "
                "#{@state.zip} "
                "#{@state.country}"

                div id: 'infow',
            p {className: 'kontact'},
                a href: @state.website, target: '_blank', @state.website + ' '
                a href: "mailto:@state.email", target: '_top', @state.email + ' '
                a href: "callto:@state.phone", target: '_top', @state.phone

             span {className: 'tag'},
                 "TAG: #{@state.tag}"
                                      # when click another cell unactive && unfocus the previous 1
