var Answer = React.createClass({
  propTypes: {
    choice: React.PropTypes.string,
    task_id: React.PropTypes.string,
    on_click: React.PropTypes.string
  },

  handleClick: function(event) {
    event.preventDefault()
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
      error: function(XMLHttpRequest, textStatus, errorThrown) {
        console.log("error")
        on_click()
      }
    });
  },

  render: function() {
    return (
      <button onClick={this.handleClick}>{this.props.choice}</button>
    );
  }
});