/**
 * layout
 */

var React = require('React');

/**
 * Component for performing some redundant site wrapping. Customize to your
 * liking, or create a new, similar module. `react-page` automatically ensures
 * that all fo the JavaScript used to generate the page, will be bundled and
 * sent into the response so that all the event handlers will work.
 *
 * Usage:
 * alternative home css
 * <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
 *
 * var React = require('React');
 * var SiteBoilerPlate = require('./components/SiteBoilerPlate.jsx');
 * var MyPage = React.createClass({
 *   render: function() {
 *     return (
 *       <SiteBoilerPlate>
 *          <div>Hello This Is My App!</div>
 *       </SiteBoilerPlate>
 *     );
 *   }
 * });
 */

var SiteBoilerPlate = React.createClass({
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

module.exports = SiteBoilerPlate;
