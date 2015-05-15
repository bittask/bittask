var MenuNav = React.createClass({

  render: function() {
    return (
      <nav className="navbar navbar-inverse navbar-fixed-top">
      	<div className="container">
      	      <div className="navbar-header">
		        <a className="navbar-brand" href="/"><span className="logo"></span></a>
		      </div>
	      <div id="navbar" className="navbar-collapse collapse">
	        <ul className="nav navbar-nav">
        		<MenuUser />
        		<MenuCreate />
	        </ul>
	      </div>
	    </div>
	  </nav>

    );
  }
});






