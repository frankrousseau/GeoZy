<<<<<<< HEAD
# Americano est la bibliothèque qui va nous permettre de générer le serveur
# HTTP de notre application. C'est lui qui va nous permettre de construire
# notre API.
americano = require 'americano'


# Ici on donne les options du serveur.
=======
americano = require 'americano'

>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
port = process.env.PORT or 3000
options =
    name: 'GeoZy'
    dbName: 'my-places-db'
<<<<<<< HEAD
    # C'est le port que va occuper notre serveur pour communiquer.
    # On pourra aisin se connecter sur le serveur avec l'URL:
    # http://localhost:9104/
    port: process.env.PORT or 9240
    # L'host permet d'autoriser l'accès au serveur dans certaines conditions.
    # Par exemple ici, on veut que le serveur soit accessible que depuis la
    # machine qui le fait tourner (localhost = 127.0.0.1).
=======
    port: process.env.PORT or 9240
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
    host: process.env.HOST or '127.0.0.1'

americano.start options, (err, app, server) ->
    console.log "server is listening on #{options.port}..."
