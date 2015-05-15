var App = React.createClass({
  handleTaskUpdate: function() {
    this.forceUpdate()
  },
  render: function() {
    return (
      <div>
        <MenuNav />

        <div className="container" role="main">
          <div className="card">
            <h2>Earn bitcoin by completing tasks</h2>
          </div>
          <Task updateTask={this.handleTaskUpdate} />
        </div>
      </div>
    );
  }
});
