<%-- 
    Document   : bookticket
    Created on : Mar 7, 2012, 4:10:43 AM
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
        <title>Book Your Ticket Here</title>
    </head>
    <body>

        <form name="bkticket" action="booknow.jsp" method="post">
        <%
         String url = "jdbc:mysql://localhost:3306/Ticket";
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection(url, "root", "tiger");
 Statement stmt = con.createStatement();
 
 ResultSet rs = stmt.executeQuery("SELECT * FROM seats");
 ResultSetMetaData md = rs.getMetaData();

              String usname,usid;
              boolean found=false;
              int flightid=0;
              usname=session.getAttribute("username").toString();
              usid=session.getAttribute("userid").toString();

             if(session.getAttribute("username")==" " && session.getAttribute("userid")== "-1")
             {
                 session.setAttribute("nextpage", "bookticket.jsp");
                 out.print("<a href=\"signin.html\"> You are not logged in, please login here to book ticket</a>");
             }
             else
             {
                out.println("<h3>Welcome "+usname+"</h3>");
                 flightid=Integer.parseInt(request.getParameter("bookradio"));
                 session.setAttribute("flid",request.getParameter("bookradio"));
                 out.println("<table border=0> ");
                 out.println("FLight ID="+session.getAttribute("flid"));
                 out.print("<tr><td>Please Enter Your Bank account Name </td> ");
                out.println("<td><input type=\"text\" name=\"bkname\"> </td></tr><br>");
                out.print("<tr><td>Please Enter Your credit card Number  </td>");
                out.println("<td><input type=\"text\" name=\"creditno\"></td></tr> <br>");
                out.println("</table>");
                out.println("<input type=\"submit\" name=\"submit\" value=\"OK\"/>");
             }

          //out.println("<h2>"+request.getParameter("bookradio")+"</h2>");
        %>
        </form>
       
    </body>
</html>
