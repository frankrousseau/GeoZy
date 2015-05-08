/**
 * my upper GeoZy panel
 */
"use strict";

var React = require('React');
var path = React.DOM.path;
//var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;


/**
 * An animated panel component. hidden to slide in
 */
var UpperPanel = React.createClass({
  getInitialState: function() {
    return {initialized: false};
  },

  componentDidMount: function() {
    this.setState({initialized: true});
  },

  render: function() {
    var classes = [
      'UpperPanel',
      this.state.initialized ? 'slideIn' : ''
    ].join(' ');
    return (

      
      <h3 className={classes}>
        {this.props.bannerMessage}
      </h3>


    );
  },
});
module.exports = UpperPanel;
