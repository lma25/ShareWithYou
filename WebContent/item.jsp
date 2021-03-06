<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Item</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/index.css" rel="stylesheet">
</head>
<%
	String errorMessage = (String)request.getAttribute("errorMessage");
	if(errorMessage == null) errorMessage = "";
	String itemId = request.getParameter("itemId");
	ResultSet rs = main.Search.searchByItemId(itemId);
	rs.next();
	int col = rs.getMetaData().getColumnCount();
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
		<div class="row">
		<div class="col-md-6">      
 		<img src="image/default_item_image.jpg" class="img-rounded" alt="Item Image"  width="400" height="400"> 
		</div>
		<div class="col-md-6">
		  <form class="form-signin" action="RentItem" method="post">
	        <h2 class="form-signin-heading"><%=rs.getString("itemName") %></h2>
	        <h4 class="form-signin-heading">Rate : $<%=rs.getInt("rate") %> / Day</h4>
	        <h4 class="form-signin-heading">Select your start date and return date:</h4>      
	        <p style="color:red"><%=errorMessage%></p>
	        <input type="text" name="itemId" value="<%=itemId%>" hidden/>
	        <label>Start Date:</label>
        	<input type="date" class="form-control" style="height:40px" name="startDate" 
        	min="<%=rs.getString("startDate")%>" max="<%=rs.getString("endDate")%>" required/>
        	<label>Return Date:</label>
       		<input type="date"  class="form-control" style="height:40px" name="endDate" 
       		min="<%=rs.getString("startDate")%>" max="<%=rs.getString("endDate")%>" required/>
       		</br>
	        <button class="btn btn-lg btn-success btn-block" type="submit">Get It!</button>
	      </form>
        </div>
        
        </div>
        <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th class="text-center">Tag</th>
                  <th class="text-center">Value</th>
                </tr>
              </thead>
              <tbody>
<%	
	for(int i = 2; i <= col; ++i){
		String tag = rs.getMetaData().getColumnName(i);
		String val = rs.getString(i);
		out.println("<tr>");
		if(rs.wasNull()){
			out.println("<th class='text-center'>" + tag + "</th><th class='text-center'>" + "N/A" + "</th>");
		}else{
			out.println("<th class='text-center'>" + tag + "</th><th class='text-center'>" + val + "</th>");
		}
		out.println("</tr>");
	}
%>
			  </tbody>
            </table>
          
		</div>
      </div>
    </div>
</body>
</html>