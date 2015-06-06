React = require 'react'
{div, p, a, button, input, label, h1, h2, br, span, i} = React.DOM


# test SetActive
ItemComponent = React.createFactory React.createClass

  onItemComponentClicked: (event) ->
        className: 'active'
        return onItemComponentClicked

    render: ->
        div id: 'item',
            ItemComponent
            onClick: @onItemComponentClicked
