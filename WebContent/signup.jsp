<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sign up</title>
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
            <li class="active"><a href="/ShareWithYou/signup.jsp">Sign up</a></li>
			<li><a href="/ShareWithYou/signin.jsp">Sign in</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
	<%
		String errorMessage = (String)request.getAttribute("errorMessage");
		if(errorMessage == null) errorMessage = "";
		String userName = (String)request.getAttribute("userName");
		if(userName == null) userName = "";
		String firstName = (String)request.getAttribute("firstName");
		if(firstName == null) firstName = "";
		String lastName = (String)request.getAttribute("lastName");
		if(lastName == null) lastName = "";
	%>
	<div class="container">

      <form class="form-signin" action="Signup" method="post">
        <h2 class="form-signin-heading">Please sign up</h2>        
        <p style="color:red"><%= errorMessage %></p>
        <input type="text" class="form-control" name="userName" value="<%=userName%>" placeholder="User Name" required>
        <input type="password" class="form-control" name="password" placeholder="Password" required>
        <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" required>
        <input type="text" class="form-control" name="firstName" value="<%=firstName%>" placeholder="First Name">
        <input type="text" class="form-control" name="lastName" value="<%=lastName%>" placeholder="Last Name">
        
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
      </form>

	</div> 
</body>
</html>