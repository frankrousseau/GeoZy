/**
 * banner.js
 */
"use strict";

var React = require('React');

var Banner = React.createClass({
  getInitialState: function() {
    return {initialized: false};
  },

  componentDidMount: function() {
    this.setState({initialized: true});
  },

  render: function() {
    var classes = [
      'banner',
      this.state.initialized ? 'fadeIn' : ''
    ].join(' ');
    return (
      <h3 className={classes}>
        {this.props.bannerMessage}
      </h3>
    );
  }
});

module.exports = Banner;
