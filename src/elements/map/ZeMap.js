/**
 * my GeoZy map
 */
var React = require('React');

/**
 * MAP
 */
var ZeMap = React.createClass({
  render: function() {
    return (
      <html>
        <head>
        <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.7.0/mapbox-gl.js'></script>
        <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.7.0/mapbox-gl.css' rel='stylesheet' />
        </head>

        <body>
        <div id='map'></div>
        <script src='src/main.js'></script>
        </body>
      </html>
    );
  }
});

module.exports = ZeMap;
