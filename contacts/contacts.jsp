<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.servlet.RequestDispatcher"%>
<%
String INSERT_USERS_SQL="INSERT INTO contactinfo VALUES"+"(?,?,?,?);";


String email=request.getParameter("email"); 

String number=request.getParameter("number"); 

String name=request.getParameter("name");
String useremail=request.getParameter("useremail");
 int result;
Class.forName("com.mysql.jdbc.Driver");
try{
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contacts","root","admin123");
	Statement st=con.createStatement();
	PreparedStatement preparedStatement=con.prepareStatement(INSERT_USERS_SQL);
	preparedStatement.setString(1, name);
	preparedStatement.setString(2, number);
	preparedStatement.setString(3, email);
	preparedStatement.setString(4, useremail);
	out.println(preparedStatement);
	result=preparedStatement.executeUpdate();
	request.setAttribute("email",useremail);
	RequestDispatcher rd=request.getRequestDispatcher("account.jsp");  
    rd.forward(request,response);
	response.sendRedirect("account.jsp");
}catch(SQLException e){
	e.printStackTrace();
}

	
%>
</body>
</html>