<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>My Profile</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/myprofile.css" rel="stylesheet">
</head>
<%

	String myUserName = (String)pageContext.getAttribute("myUserName", PageContext.SESSION_SCOPE);
	
%>
<body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/ShareWithYou">ShareWithYou</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          	<li><a href="/ShareWithYou/itempost.jsp">Post</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="/ShareWithYou/logout.jsp">Logout</a></li>
            <li><a href="/ShareWithYou/templete/about.html">About</a></li>
          </ul>
          <form class="navbar-form navbar-right" role="search" action="search.jsp" method="get">
              <div class="input-group">
                 <input type="text" class="form-control" placeholder="Search..." name="search" id="search" style="max-width: 100%; width: 100%; height:28px">
                 <div class="input-group-btn">
                     <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                 </div>
               </div>
           </form>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header"><%=myUserName%></h1>
<%
	ResultSet rs = main.DB.getFromDB("select money from users where userName='" + myUserName + "'");
	rs.next();
	float money = rs.getFloat(1);
%>
		  <h3>My money : $<%=money %> </h3>
		  <form class="col-md-2" role="addMoney" action="AddMoney" method="post">
              <div class="input-group">
                 <input type="text" class="form-control" name="addMoney" placeholder="Add Value" id="addMoney" style="max-width: 100%; width: 100%; height:34px">
                 <div class="input-group-btn">
                     <button class="btn btn-md btn-primary btn-block" type="submit">Add</button>
                 </div>
               </div>
           </form>
           <h3 class="col-md-12"></h3>
<!--  
            <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
          </div>
-->	  
          <h2 class="sub-header">My Posted Items</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th class='text-center'>#</th>
                  <th class='text-center'>Item Name</th>
                  <th class='text-center'>Rate/Day</th>
                  <th class='text-center'>Start Date</th>
                  <th class='text-center'>End Date</th>
                  <th class='text-center'>Action</th>
                </tr>
              </thead>
              <tbody>
<%
	rs = main.DB.getFromDB("select itemId, itemName, rate, startDate, endDate, lesseeId from items where ownerName='" + myUserName + "'");
	int count = 1;
	while(rs.next()){
		StringBuilder line = new StringBuilder("<tr><td class='text-center'>" + count + "</td>");
		for(int i = 2; i <= 5; ++i){
			line.append("<td class='text-center'>" + rs.getString(i) + "</td>");
		}
		if(rs.getInt(6) == 0){
			line.append("<td><div class='col-md-3'></div><div class='col-md-6'><form action='edititem.jsp' method='post'><input type='text' name='itemId' value='" + rs.getInt(1)
			+ "' hidden/><button class='btn btn-md btn-primary btn-block' type='submit'>Edit it</button></form></div></td>");
		}else{
			line.append("<td><div class='col-md-3'></div><div class='col-md-6'><form action='viewitem.jsp' method='post'><input type='text' name='itemId' value='" + rs.getInt(1)
			+ "' hidden/><button class='btn btn-md btn-info btn-block' type='submit'>View it</button></form></div></td>");
		}
		line.append("</tr>");
		++count;
		out.println(line);
	}
%>
<!--
	            <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>sit</td>
                </tr>
 -->                
              </tbody>
            </table>
          </div>
          
          <h2 class="sub-header">My Rent Items</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th class='text-center'>#</th>
                  <th class='text-center'>Item Name</th>
                  <th class='text-center'>Rate/Day</th>
                  <th class='text-center'>Owner</th>
                  <th class='text-center'>Rent Start Date</th>
                  <th class='text-center'>Rent End Date</th>
                  <th class='text-center'>Action</th>
                </tr>
              </thead>
              <tbody>
<%
	count = 1;
	rs = main.DB.getFromDB("select itemId, itemName, rate, ownerName, lessStartDate, lessEndDate from items where lesseeName='" + myUserName +"'");
	while(rs.next()){
		StringBuilder line = new StringBuilder("<tr><td class='text-center'>" + count + "</td>");
		for(int i = 2; i <= 6; ++i){
			line.append("<td class='text-center'>" + rs.getString(i) + "</td>");
		}
		line.append("<td><div class='col-md-3'></div><div class='col-md-6'><form action='ReturnItem' method='post'><input type='text' name='itemId' value='" + rs.getInt(1)
			+ "' hidden/><button class='btn btn-md btn-danger btn-block' type='submit'>Return it</button></form></div></td>");
		line.append("</tr>");
		++count;
		out.println(line);
	}
%>
<!--
	            <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>sit</td>
                </tr>
 -->                
              </tbody>
            </table>
          </div>
          
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>