<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/signin.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/ShareWithYou">Share With You</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-left">
            <li><a href="/ShareWithYou">Home</a></li>
            <li><a href="/ShareWithYou/templete/about.html">About</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/ShareWithYou/signup.jsp">Sign up</a></li>
			<li class="active"><a href="/ShareWithYou/signin.jsp">Sign in</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
	<%
		String errorMessage = (String)request.getAttribute("errorMessage");
		if(errorMessage == null) errorMessage = "";
		String userName = (String)request.getAttribute("userName");
		if(userName == null) userName = "";
	%>
	<div class="container">

      <form class="form-signin" action="Signin" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>        
        <p style="color:red"><%= errorMessage %></p>
        <input type="text" class="form-control" name="userName" value="<%=userName%>" placeholder="UserName" required>
        <input type="password" class="form-control" name="password" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

	</div> 
</body>
</html>