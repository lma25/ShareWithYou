<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Search</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/index.css" rel="stylesheet">
	<link href="css/myprofile.css" rel="stylesheet">
</head>
<%
	String myUserName = (String)pageContext.getAttribute("myUserName", PageContext.SESSION_SCOPE);
	String myUserNameTag = main.Tags.getUserNameTag(myUserName);
	String search = request.getParameter("search");
%>
<body>
	<div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
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
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav navbar-left">
                <li><a href="/ShareWithYou">Home</a></li>
                <li><a href="/ShareWithYou/templete/about.html">About</a></li>
              </ul>
              <ul class="nav navbar-nav navbar-right">
				<%=main.Tags.getUserNameTag((String)session.getAttribute("myUserName")) %>
              </ul>
            </div>
            
          </div>
        </nav>

		<form class="navbar-form navbar-left" role="search" action="search.jsp" method="get">
              <div class="input-group">
                 <input type="text" class="form-control" placeholder="Search..." name="search" value="<%=search %>" style="max-width: 100%; width: 100%; height:28px">
                 <div class="input-group-btn">
                     <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                 </div>
              </div>
    	</form>
    	
    	<div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Item Name</th>
                  <th>Rate/Day</th>
                  <th>Zip Code</th>
                  <th>Owner ID</th>
                  <th>Start Date</th>
                  <th>End Date</th>
                </tr>
              </thead>
              <tbody>
<%
	ResultSet rs = main.Search.searchByItemName(search);
	int count = 1;
	while(rs.next()){
		StringBuilder line = new StringBuilder("<tr><td>" + count + "</td>");
		line.append("<td><a href='/ShareWithYou/item.jsp?itemId=" + rs.getString(1) + "'>" + rs.getString(2) + "</a></td>");
		line.append("<td>" + rs.getString(3) + "</td>");
		line.append("<td>" + rs.getString(4) + "</td>");
		line.append("<td>" + rs.getString(5) + "</td>");
		line.append("<td>" + rs.getString(6) + "</td>");
		line.append("<td>" + rs.getString(7) + "</td>");
		line.append("</td>");
		++count;
		out.println(line);
	}
%>
			  </tbody>
            </table>
          </div>
    	
      </div>
      
      
      
    </div>
    
</body>
</html>