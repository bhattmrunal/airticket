<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : cancelnow
    Created on : Apr 17, 2012, 2:59:18 AM
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
        <title>Ticket Cancel</title>
    </head>
    <body>
  <%
     String tid=request.getParameter("ticketid");
      String url = "jdbc:mysql://localhost:3306/Ticket";
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection(url, "root", "tiger");

 String query="DELETE FROM tickt WHERE ticketid ='"+tid+"'";
out.println(query);
 Statement stmt = con.createStatement();
 int del = stmt.executeUpdate(query);
 
if(del!=0)
{
 out.println("Ticket Deleted Successfully !!!");
}
 //out.println("Ticket id= "+request.getParameter("ticketid"));

  %>
    </body>
</html>
