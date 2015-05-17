Bookmark = require '../models/bookmark'


module.exports =

<<<<<<< HEAD
    # Ce contrôleur va requêter la base de données pour obtenir toutes les
    # bookmarks pour ensuite les envoyer dans la réponse.
=======
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
    all: (req, res) ->
        Bookmark.all (err, bookmarks) ->
            return next err if err

            res.send bookmarks


<<<<<<< HEAD
    # Ce contrôleur va prendre les informations de la requête pour créer une
    # nouvelle bookmark dans la base de données. Une fois que la bookmark a été
    # créée, on la renvoie car elle contient maintenant son identifiant en base
    # de données. Ce qui sera utile au client pour faire d'autres opérations
    # sur la bookmark.
=======
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
    create: (req, res) ->
        bookmark = req.body

        if not bookmark? or not bookmark.link?
            res.status(400).send msg: 'Bookmark malformed.'

        else
<<<<<<< HEAD
            Bookmark.create bookmark, (err, bookmarkModel) ->

                if err
                    console.log err
                    res.status(500).send msg: err

                else
                    res.send bookmarkModel


    # Ici le client indique via l'url sur laquelle il envoie une requête
    # l'identifiant du bookmark à supprimer.
    # Ensuite le contrôleur va supprimer le bookmark et indiquer dans la
    # réponse que tout s'est bien passé.
    delete: (req, res, next) ->

        Bookmark.find req.params.id, (err, bookmark) ->
=======
            # On récupère le document pour voir s'il n'existe pas déjà.
            Bookmark.findByLink bookmark.link, (err, bookmark) ->

                if err
                    next err

                else if bookmark?
                    res.status(400).send msg: 'Bookmark already exists.'

                else

                    Bookmark.create bookmark, (err, bookmarkModel) ->

                        if err
                            console.log err
                            res.status(500).send msg: err

                        else
                            res.send bookmarkModel


    delete: (req, res, next) ->

        Bookmark.find req.params.id, (err, doc) ->
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da

            if err
                console.log err
                res.status(500).send msg: err

<<<<<<< HEAD
            else if not bookmark?
                res.status(404).send msg: 'Bookmark does not exist.'

            else
                # Suppression du bookmarkument.
                bookmark.destroy (err) ->
=======
            else if not doc?
                res.status(404).send msg: 'Bookmark does not exist.'

            else
                # Suppression du document.
                db.remove doc, (err) ->
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
                    if err
                        console.log err
                        res.status(500).send msg: err
                    else
                        res.sendStatus 204

