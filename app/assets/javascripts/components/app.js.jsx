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