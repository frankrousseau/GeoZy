/**
* index.js
 */

var Banner = require('./elements/Banner/Banner.js');
var UpperPanel = require('./elements/upperpanel/UpperPanel.js');
var ZeMap = require('./elements/map/ZeMap.js');
var React = require('React');
var SiteBoilerPlate = require('./core/SiteBoilerPlate.js');
//var VectorWidget = require('./elements/VectorWidget/VectorWidget.js');
//var Alert = require('react-bootstrap/lib/Alert');

var index = React.createClass({
  render: function() {
    return (
      <SiteBoilerPlate>
      <UpperPanel bannerMessage="GeoZy"/>

        <ZeMap />


    </SiteBoilerPlate>
  );
}
});
module.exports = index;
