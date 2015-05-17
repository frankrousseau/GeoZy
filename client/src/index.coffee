React = require 'react'
request = require 'superagent'
<<<<<<< HEAD
{div, p, a, button, input, label} = React.DOM
=======
slug = require 'slug'
{div, p, button, input, label} = React.DOM
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da


# Utilitaires pour requêter notre serveur.
data =

<<<<<<< HEAD
    # Avec cette fonction, on récupère les bookmarks depuis le serveur.
=======
    # On récupère les bookmarks.
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
    getBookmarks: (callback) ->
        request
            .get('/api/bookmarks')
            .set('Accept', 'application/json')
            .end (err, res) ->
                callback err, res.body


<<<<<<< HEAD
    # On demande au serveur de créer une bookmark.
=======
    # On crée une bookmark.
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
    createBookmark: (bookmark, callback) ->
        request
            .post('/api/bookmarks')
            .send(bookmark)
            .end (err, res) ->
                callback err, res.body

<<<<<<< HEAD
    # On demande au serveur de supprimer une bookmark.
    deleteBookmark: (bookmark, callback) ->
        request
            .del('/api/bookmarks/' + bookmark.id)
=======
    # On supprimme une bookmark (on trouve son identifiant à partir du lien).
    deleteBookmark: (bookmark, callback) ->
        request
            .del('/api/bookmarks/' + slug(bookmark.link))
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
            .end callback


# C'est le composant principal de l'application.
App = React.createClass
<<<<<<< HEAD

    # Ici on assure le rendu de ce composant.
    render: ->
        # Le div est un composant de base du DOM, représenté ici en React.
        div null,
            div null, 'My Bookmarks'
            # Ici c'est un composant spécifique que nous avons créé.
            BookmarkList
                bookmarks: @props.bookmarks


# Le composant liste de bookmark.
BookmarkList = React.createFactory React.createClass

    # On définit l'état initial du composant bookmarks, cela est utile pour le
    # rendu dynamique. En effet on lui indique par cet état la liste des
    # bookmarks à afficher. Il suffira de changer cette liste pour que le rendu
    # se déclenche et que l'écran soit mis à jour en fonction.
=======
    render: ->
        div null,
            div null, 'My Single Page Application2'
            #BookmarkList
            #    bookmarks: @props.bookmarks


# Le composant liste de bookmark.
BookmarkList = React.createClass

    # On définit l'état du composant bookmarks cela est utile pour le rendu
    # dynamique.
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
    getInitialState: ->
        return bookmarks: @props.bookmarks

    # Quand le bouton ajout est cliqué, on récupère les valeurs des
    # différents champs.
    # Puis on met à jour la liste des composants. Enfin on provoque un nouveau
<<<<<<< HEAD
    # rendu en changeant l'état.
    # Enfin, on envoie une requête de création au serveur.
=======
    # rendu en changeant l'état et on envoie une requête de création au serveur.
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
    onAddClicked: ->
        bookmarks = @state.bookmarks
        title = @refs.titleInput.getDOMNode().value
        link = @refs.linkInput.getDOMNode().value

        bookmark = title: title, link: link
        bookmarks.push bookmark

        # Changement d'état.
        @setState bookmarks: bookmarks
        # Requête au server.
        data.createBookmark bookmark, ->

    # Quand on supprime une ligne, on met à jour la liste des lignes. Puis on
<<<<<<< HEAD
    # provoque le rendu du composant en changeant l'état.
    # Enfin on envoie une requête de suppression au serveur.
=======
    # provoque le rendu du composant en changeant l'état. Pour enfin envoyer une
    # requête de suppression au serveur.
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
    removeLine: (line) ->
        bookmarks = @state.bookmarks
        index = 0

        while (index < bookmarks.length and bookmarks[index].link isnt line.link)
            index++

        if (index < bookmarks.length)
            bookmark = bookmarks.splice(index, 1)[0]

            # Changement d'état.
            @setState bookmarks: bookmarks
            # Requête au serveur.
            data.deleteBookmark bookmark, ->

    # Rendu du composant.
    render: ->
<<<<<<< HEAD

        div null,
            div null,
                label null, "title"
=======
        removeLine = @removeLine

        # Ici on prépare la liste à partir des proprités.
        div null,
            div null,
                label null, title
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
                input
                    ref: "titleInput"
                    type: "text"
            div null,
<<<<<<< HEAD
                label null, "url"
=======
                label null, url
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
                input
                    ref: "linkInput"
                    type: "text"
            div null,
                button
                    onClick: @onAddClicked
                , "+"
            div null,
<<<<<<< HEAD
                # Ici on génère un composant bookmark par bookmark présentes
                # dans la liste. La fonction map permet de constituer un
                # tableau de composant bookmark à partir d'une liste de
                # d'objet bookmark.
                @state.bookmarks.map (bookmark) =>
                    Bookmark
                        title: bookmark.title
                        link: bookmark.link
                        removeLine: @removeLine


# Le composant qui va définir une ligne de bookmark.
Bookmark = React.createFactory React.createClass

    # Quand le bouton supprimé est cliqué, on demande au parent de supprimer la
    # la ligne courante.
    onDeleteClicked: ->
        @props.removeLine @props

    # Rendu de la bookmark, on
=======
                @state.bookmarks.map (bookmark) ->
                    Bookmark
                        title: bookmark.title
                        link: bookmark.link
                        removeLine: removeLine


# Le composant qui va définir une ligne de bookmark.
Bookmark = React.createClass

    # On supprime la ligne courante du parent quand le bouton supprimé est
    # cliqué.
    onDeleteClicked: ->
        @props.removeLine @props

    # Le rendu se fait grâce à un format de template spécifique à base de
    # composant reacts.
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
    render: ->
        div null,
            p
                className: "title", @props.title
            p
                className: 'link'
            ,
                a
                    href: @props.link
                ,
                    @props.link
            p
<<<<<<< HEAD
                button onClick: @onDeleteClicked, "X"


# Ici on démarre !
#
# On récupère d'abord les bookmarks stockées sur le serveur.
data.getBookmarks (err, bookmarks) ->
    console.log bookmarks
=======
                button onClick: @onDeleteClicked, X


# Ici on démarre !
data.getBookmarks (err, bookmarks) ->
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da

    if not bookmarks?
        alert "Je n'ai pas réussi à récupérer les bookmarks"

    else
        # Attention le premier élément de react ne doit pas être attaché
        # directement à l'élément body.
<<<<<<< HEAD
        React.render(React.createElement(App , bookmarks: bookmarks),
=======
        React.render(React.createElement(App , bookmarks: bookmarks.rows),
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
                     document.getElementById('app'))

