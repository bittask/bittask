var App = React.createClass({

  getInitialState: function() {
    return {data: []};
  },

  componentDidMount: function() {
  },

  render: function() {
    return (
      <div>
        <Task />
      </div>
    );
  }
});
