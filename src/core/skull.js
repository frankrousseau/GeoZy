/**
 * HTML layout
 */

var React = require('React');

var skull = React.createClass({
  render: function() {
    return (
      <html>
        <head>
        <meta charset="UTF-8" />
        <title>GeoZy simple tool for creating, sharing pin-point</title>
                <meta
                  name="viewport"
                  content="width=device-width, initial-scale=1.0, user-scalable=no"
                />
                <link rel="stylesheet" type="text/css" href="/style.css" />
        </head>
        <body>
          {this.props.children}


          <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
          <script src="js/bootstrap.min.js"></script>
        </body>
      </html>
    );
  }
});
module.exports = skull;
