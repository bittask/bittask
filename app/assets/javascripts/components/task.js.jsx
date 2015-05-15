var Task = React.createClass({
  propTypes: {
    url: React.PropTypes.string
  },

  getInitialState: function() {
    return {data: []};
  },

  componentDidMount: function() {
    var url = "/api/v1/tasks/latest";
    if (this.props.url) {
      url = this.props.url
    }
    $.ajax({
      url: url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({
          id: data.id,
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
    var rows = [];
    var task_id = this.state.id
    this.state.choices.forEach(function(choice) {
      rows.push(<Answer choice={choice} task_id={task_id} />);
    });
    return (
      <div>
        <div>Title: {this.state.title}</div>
        <div>Choices: <ul>{this.state.choices.map(function(item) { return <li>{item}</li> })}</ul></div>
        <div>Cost: {this.state.cost}</div>
        <div>Address: {this.state.address}</div>
        <div>Balance: {this.state.balance}</div>
        {rows}
      </div>
    );
  }
});
