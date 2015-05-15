var Answer = React.createClass({
  propTypes: {
    choice: React.PropTypes.string,
    task_id: React.PropTypes.string
  },

  getInitialState: function() {
    return {data: []};
  },

  componentDidMount: function() {
    // var url = "/api/v1/tasks/latest";
    // if (this.props.url) {
    //   url = this.props.url
    // }
    // $.ajax({
    //   url: url,
    //   dataType: 'json',
    //   cache: false,
    //   success: function(data) {
    //     this.setState({
    //       id: data.id,
    //       title: data.title,
    //       choices: data.choices,
    //       cost: data.cost,
    //       address: data.address,
    //       balance: data.balance});
    //   }.bind(this),
    //   error: function(xhr, status, err) {
    //     console.error(this.props.url, status, err.toString());
    //   }.bind(this)
    // });
  },

  handleClick: function(event) {
    event.preventDefault()
    var answer = {
      task_id: this.props.task_id,
      choice: this.props.choice
    }
    $.post( "/api/v1/answers", answer, function( data ) {
      // success
      console.log("success")
    });
  },

  render: function() {
    return (
      <button onClick={this.handleClick}>{this.props.choice}</button>
    );
  }
});