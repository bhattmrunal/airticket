<%-- 
    Document   : paynow
    Created on : Apr 18, 2012, 9:13:28 AM
    Author     : mrunal
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.Level" %>
<%@ page import="java.io.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paying now</title>
    </head>
    <body>
        
 <%
   String usrid;
   usrid=session.getAttribute("userid").toString();

      String url = "jdbc:mysql://localhost:3306/Ticket";
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection(url, "root", "tiger");
 Statement stmt = con.createStatement();
 ResultSet rs = stmt.executeQuery("SELECT * FROM customer");
 
   if(session.getAttribute("userid").toString().equals("-1"))
   {
     out.println("Sorry !! you have to login to complete the transaction");
   }
   else
   {
     boolean usrfnd=false;
     while(rs.next() && usrfnd==false)
     {
        if(Integer.toString(rs.getInt(1)).equals(usrid))
        {
           out.println("user found");
           if(rs.getString(10).equalsIgnoreCase(request.getParameter("cardno")))
           {
             out.println("card no correct");
           }
           else
           {
             out.println("card no not correct");
           }
              usrfnd=true;
        }                          
     }  
  
    if(usrfnd==false)
    {
      out.println("User not found");
    }
   }


 %>

   </body>
</html>
