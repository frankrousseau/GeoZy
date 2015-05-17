cozydb = require 'cozy-db-pouchdb'


<<<<<<< HEAD
# On décrit le modèle des données que l'on persistera et requêtera.
# Ici c'est notr objet bookmark constitué de deux champs : le titre et le lien
# de la bookmark.
module.exports = Bookmark = cozydb.getModel 'Bookmark',
=======
module.exports = Bookmark = cozydb.getModel 'Event',
>>>>>>> 571115d9dee1f2db4a2f0821a13f948e2df947da
    title: type: String
    link: type: String
