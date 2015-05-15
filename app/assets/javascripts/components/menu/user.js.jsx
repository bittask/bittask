var MenuUser = React.createClass({

  getInitialState: function() {
    return {balance: 0};
  },

  loadUser: function() {
    $.ajax({
      url: "/api/v1/users",
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({
          id: data.id,
          address: data.address,
          balance: data.balance});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(status, err.toString());
      }.bind(this)
    });
  },

  componentDidMount: function() {
    this.loadUser();
  },

  componentWillReceiveProps: function(nextProps) {
    this.loadUser();
  },

  render: function() {
    return (
      <div>
        <div>ID: {this.state.id}</div>
        <div>Address: {this.state.address}</div>
        <div>Balance: {this.state.balance}</div>
      </div>
    );
  }
});
