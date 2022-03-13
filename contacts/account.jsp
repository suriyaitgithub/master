<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<% String useremail=(String)request.getAttribute("email"); %>
<h1>Contact form and contact list page</h1>
<form action="contacts.jsp" method="get">
<h3>Add Contacts</h3>
<label>Name</label>
<input type="text" name="name"></input>
<br>
<label>Ph.NO.</label>
<input type="text" name="number"></input>
<br>
<label>Email</label>
<input type="email" name="email"></input>
<br>
<input type="hidden" value="<%=useremail%>" name="useremail">
<input type="submit" style="background-color:royalblue;color:white" value="Save"></input>
<br>
<h3>My Contacts</h3>
<%
Class.forName("com.mysql.jdbc.Driver");
response.setContentType("text/html");
out.println("<html><body>");
try{
 	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contacts","root","admin123");
    Statement stmt=con.createStatement();
    String q1 = "select * from contactinfo WHERE useremail = '" + useremail + "'";
    ResultSet rs = stmt.executeQuery(q1);
    if(rs.next()){
    	String name = rs.getString(1);
    	String number = rs.getString(2);
    	String email = rs.getString(3);
    	out.println("<table border=1>");
    	out.println("<tr><th>Name</th><th>Ph.No.</th><th>Email</th></tr>");
    	out.println("<tr><td>"+name+"</td><td>"+number+"</td><td>"+email+"</td>");
    }
}catch(Exception e){
	e.printStackTrace();	
}
%>
</form>
</body>
</html>