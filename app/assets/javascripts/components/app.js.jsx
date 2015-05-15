var App = React.createClass({
  handleTaskUpdate: function() {
    this.forceUpdate()
  },
  render: function() {
    return (
      <div>
        <MenuUser /><MenuCreate />
        <p/>
        <Task updateTask={this.handleTaskUpdate} />
      </div>
    );
  }
});
