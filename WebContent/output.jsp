<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Example Output</title>
</head>
<body>
	<h1>The following reflects your input</h1>
	<%
		String firstInpute = (String)request.getAttribute("firstinput");
		String secondInput = (String)request.getAttribute("secondinput");
		
		//out.print(firstName + " " + lastName);
	%>
	<table>
		<tr>
			<td>First Input: </td><td><%= firstInpute %></td>
		</tr>
		<tr>
			<td>Second Input: </td><td><%=secondInput %></td>
		</tr>
	</table>

</body>
</html>