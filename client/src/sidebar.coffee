React = require 'react'
request = require 'superagent'
{div, p, a, button, input, label} = React.DOM

# Utilitaires pour requêter notre serveur.
# On demande au serveur de créer une bookmark.
# On demande au serveur de supprimer une bookmark.

# C'est le composant principal de l'application.
Mysidebar = React.createClass



        React.render(React.createElement(Mysidebar),
                     document.getElementById('mysidebar'))
