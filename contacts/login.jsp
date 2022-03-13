<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%

    String email=request.getParameter("email"); 

    String password=request.getParameter("pswd"); 

    Class.forName("com.mysql.jdbc.Driver");
    try{
     	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contacts","root","admin123");
        Statement stmt=con.createStatement();
        String q1 = "select * from userreg WHERE email = '"+ email +"' AND pwd = '" + password + "'"; 
        ResultSet rs = stmt.executeQuery(q1);
        if(rs.next()) 
        { 
        	request.setAttribute("email",email);
            RequestDispatcher rd=request.getRequestDispatcher("account.jsp");  
            rd.forward(request,response); 
            response.sendRedirect("account.jsp");  
        }
        else if(rs.next()==false){
    	   out.println("<h3>invalid login or password</h3>");
        }
        con.close();
    }
    catch(SQLException e)
    {
        e.printStackTrace();
    }
 %>
 </br>
 </br>
 <a href="Reset.html">Reset Password</a></br>
 </br>
 </br>
<a href="signin.html">Go to Sign In</a>
</body>
</html>