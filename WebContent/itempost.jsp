<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Item Post</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/signin.css" rel="stylesheet">
</head>
<body>
	<%
		String errorMessage = (String)request.getAttribute("errorMessage");
		if(errorMessage == null) errorMessage = "";
		String itemName = (String)request.getAttribute("itemName");
		if(itemName == null) itemName = "";
		String rate = (String)request.getAttribute("rate");
		if(rate == null) rate = "";
		String street = (String)request.getAttribute("street");
		if(street == null) street = "";
		String city = (String)request.getAttribute("city");
		if(city == null) city = "";
		String state = (String)request.getAttribute("state");
		if(state == null) state = "";
		String zipCode = (String)request.getAttribute("zipCode");
		if(zipCode == null) zipCode = "";
	%>
	<div class="container">

      <form class="form-signin" action="ItemPost" method="post">
        <h2 class="form-signin-heading">Please post your item</h2>        
        <p style="color:red"><%= errorMessage %></p>
        <input type="text" class="form-control" name="itemName" value="<%=itemName%>" placeholder="Item Name" required>
        <input type="text" class="form-control" name="rate" value="<%=rate%>" placeholder="Rate/Day" required>
        <input type="text" class="form-control" name="street" value="<%=street%>" placeholder="Street">
        <input type="text" class="form-control" name="city" value="<%=city%>" placeholder="City">
        <input type="text" class="form-control" name="state" value="<%=state%>" placeholder="State">
        <input type="text" class="form-control" name="zipCode" value="<%=zipCode%>" placeholder="Zip Code">
        <label>Start Date:</label>
        <input type="date" class="form-control" style="height:40px" name="startDate"/>
        <label>End Date:</label>
       	<input type="date"  class="form-control" style="height:40px" name="endDate"/>
        </br>
        
        
        <button class="btn btn-lg btn-primary btn-block" type="submit">Post</button>
      </form>

	</div> 
</body>
</html>