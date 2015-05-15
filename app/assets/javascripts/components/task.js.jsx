var Task = React.createClass({
  getInitialState: function() {
    return {};
  },

  loadNextTask: function() {
    $.ajax({
      url: "/api/v1/tasks/latest",
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({
          loaded: true,
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

  componentDidMount: function() {
    this.loadNextTask();
  },

  render: function() {
    if (!this.state.loaded) {
      return (<div>test</div>)
    }
    var choices = [];
    var task_id = this.state.id
    var boundClick = this.loadNextTask; // When answer is clicked, we want to run loadNextTask
    if (this.state.choices) {
      this.state.choices.forEach(function(choice) {
        choices.push(<Answer choice={choice} task_id={task_id} on_click={boundClick} />);
      });
    } else {
      choices.push(<Answer choice="Free form" task_id={task_id} on_click={boundClick} />);
    }
    return (
      <div>
        <div>{this.state.title}</div>
        {choices}
        <div>Cost: {this.state.cost}</div>
        <div>Address: {this.state.address}</div>
        <div>Balance: {this.state.balance}</div>
      </div>
    );
  }
});
