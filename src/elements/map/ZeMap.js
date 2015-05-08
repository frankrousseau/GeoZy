/**
 * my GeoZy map
 */
"use strict";

var React = require('React');
var path = React.DOM.path;
//var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;


/**
 * An animated panel component. hidden to slide in
 */
var ZeMap = React.createClass({
  getInitialState: function() {
    return {initialized: true};
  },

  componentDidMount: function() {
    this.setState({initialized: true});
  },

  render: function() {
    var classes = [
      'ZeMap',

    ].join(' ');

  },
});
module.exports = ZeMap;
