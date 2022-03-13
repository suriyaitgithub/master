<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.servlet.RequestDispatcher"%>
<%
String INSERT_USERS_SQL="INSERT INTO userreg VALUES"+"(?,?,?);";


String email=request.getParameter("email"); 

String password=request.getParameter("pswd"); 

String secret=request.getParameter("secret"); 
 int result;
Class.forName("com.mysql.jdbc.Driver");
try{
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contacts","root","admin123");
	Statement st=con.createStatement();
	PreparedStatement preparedStatement=con.prepareStatement(INSERT_USERS_SQL);
	preparedStatement.setString(1, email);
	preparedStatement.setString(2, password);
	preparedStatement.setString(3, secret);
	out.println(preparedStatement);
	result=preparedStatement.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("signin.html");  
    rd.forward(request,response); 
}catch(SQLException e){
	e.printStackTrace();
}

	
%>
</br>
<a href="signin.html">Go to Sign In</a></br>
<!-- </br>
<a href="index.html">HomePage</a> -->
</body>
</html>