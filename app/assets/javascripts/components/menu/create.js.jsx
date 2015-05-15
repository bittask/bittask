var MenuCreate = React.createClass({

  handleClick: function(event) {

  },


  render: function() {
    return (
    	<li>
        <button type="button" className="btn button-nav" onClick={this.handleClick}>CREATE<br />YOUR TASK</button>
      </li>
    );
  }
});
