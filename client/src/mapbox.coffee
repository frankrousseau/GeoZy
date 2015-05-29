toto  = 'a'

MapBoxComponent = require 'react-mapbox'


Icon = React.createComponent
    i className: 'fa fa-' + @props.iconName, null

    tata: 'b'


MapBox = React.createComponent
    toto: 'a'

    onMapBoxClicked: (event) ->
        console.log @toto
        console.log @tata



    render: ->

        div id: 'mapbox',
            Icon name: 'download'
            MapBoxComponent
                param1: 'test'
                onClick: @onMapBoxClicked
                param2
                    ...
