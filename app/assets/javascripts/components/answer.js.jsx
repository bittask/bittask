var Answer = React.createClass({
  propTypes: {
    choice: React.PropTypes.string,
    task_id: React.PropTypes.string,
    on_click: function() {}
  },

  handleClick: function(event) {
    var answer = {
      task_id: this.props.task_id,
      choice: this.props.choice
    }
    var on_click = this.props.on_click
    $.ajax({
      type: "POST",
      url: "/api/v1/answers",
      data: answer,
      success: function(msg){
        on_click()
      },
      error: function(xhr, status, err) {
        on_click()
      }
    });
  },

  render: function() {
    return (
      <button className="btn btn-lg btn-default" onClick={this.handleClick}>{this.props.choice}</button>
    );
  }
});