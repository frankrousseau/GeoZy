<<<<<<< HEAD
# Dépendances nécessaires
path = require 'path'
americano = require 'americano'
path = require 'path'

# Ici construit le chemin ou se trouver les fichiers statiques qu'on veut
# servir.
# Les fichiers statiques sont notammeent le client qui sera chargé dans le
# navigateur (code, styles, fonts et images).
=======
path = require 'path'
americano = require 'americano'
path = require 'path'
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
staticPath = path.resolve(path.join __dirname, '..', 'client', 'public')

config =
    common:
        use: [
<<<<<<< HEAD
            # Ce sont des plugins standards, ils permettent de gérer proprement
            # les requêtes constitués de JSON.
            #
            americano.bodyParser()
            americano.methodOverride()
            # Ici on indique qu'il faut servir les fichiers du dossier statique
            # à la racine l'API.
=======
            americano.bodyParser()
            americano.methodOverride()
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
            americano.static staticPath,
                maxAge: 86400000
        ]
        useAfter: [
            americano.errorHandler
                dumpExceptions: true
                showStack: true
        ]

    development: [
        americano.logger 'dev'
    ]

    production: [
        americano.logger 'short'
    ]

    plugins: [
<<<<<<< HEAD
        # Le plugin qui va nous permettre d'utiliser PouchDB simplement.
=======
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
        'cozy-db-pouchdb'
    ]

module.exports = config
