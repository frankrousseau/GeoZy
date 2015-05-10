/**
* index.js
*/
var React = require('React');
var UpperPanel = require('./elements/upperpanel/UpperPanel.js');
var SiteBoilerPlate = require('./core/SiteBoilerPlate.js');


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
