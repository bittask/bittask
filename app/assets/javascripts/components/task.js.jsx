var Task = React.createClass({
  propTypes: {
    url: React.PropTypes.string
  },

  getInitialState: function() {
    return {data: []};
  },

  componentDidMount: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({
          title: data.title,
          choices: data.choices,
          cost: data.cost,
          address: data.address,
          balance: data.balance});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },

  render: function() {
    if (!this.state.choices) {
      return (<div>loading...</div>)
    }
    return (
      <div>
        <div>Title: {this.state.title}</div>
        <div>Choices: <ul>{this.state.choices.map(function(item) { return <li>{item}</li> })}</ul></div>
        <div>Cost: {this.state.cost}</div>
        <div>Address: {this.state.address}</div>
        <div>Balance: {this.state.balance}</div>
      </div>
    );
  }
});


// var CommentBox = React.createClass({
//   render: function() {
//     return (
//       <div className="commentBox">
//         Hello, world! I am a CommentBox.
//       </div>
//     );
//   }
// });
// React.render(
//   <CommentBox />,
//   document.getElementById('content')
// );