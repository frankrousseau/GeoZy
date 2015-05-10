/**
* index.js
*/
var React = require('React');
var UpperPanel = require('./elements/upperpanel/UpperPanel.js');

var skull = require('./core/skull.js');
var SiteBoilerPlate = require('./core/SiteBoilerPlate.js');
//var ZeMap = require('./elements/map/ZeMap.js');
//var MapBox = require('./core/MapBox.js');
//var VectorWidget = require('./elements/VectorWidget/VectorWidget.js');
//var Alert = require('react-bootstrap/lib/Alert');

var index = React.createClass({
  render: function() {
    return (
      <SiteBoilerPlate>
      <UpperPanel upperpanel/>



      </SiteBoilerPlate>
    );
  }
});
module.exports = index;
