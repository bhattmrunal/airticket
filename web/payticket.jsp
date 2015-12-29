<%-- 
    Document   : payticket
    Created on : Apr 18, 2012, 9:13:50 AM
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
        <title>Payment Details</title>
    </head>
    <body>
        <img src="header.jpg" alt="header img">
        <table align="center"><tr><td><img src="bg_img.jpg" alt="plane img" align="center"></td></tr></table>

 <%
 boolean flgfnd=false;
   String flight=request.getParameter("bookradio");
   String rate;
   String url = "jdbc:mysql://localhost:3306/Ticket";
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection(url, "root", "tiger");
 Statement stmt = con.createStatement();
 ResultSet rs = stmt.executeQuery("SELECT * FROM Flight");

   session.setAttribute("flightid",flight);
   if(session.getAttribute("userid").toString().equals("-1"))
   {
     out.println("Please login to book the tickets <a href=\"signin.html\">Click here</a> ");
   }
   else
   {
       while(rs.next())
       {
         if(Integer.toString(rs.getInt(1)).equals(flight))
         {
           flgfnd=true;
           //out.println("flight found");
           rate=rs.getString(15);
           session.setAttribute("rate",rate);
           //out.println("rate= "+rate);
         }
       }
       out.println("<table align=\"right\" border=0><tr><td><a href=mpage.jsp>Logout</a></td></tr></table>");

      out.println("<form name=\"payment\" action=\"booknow.jsp\" method=\"post\">");

      out.println("<table border=1 align=\"center\">");
      out.println("<tr><td>Please enter your card no. </td><td><input type=\"text\" name=\"cardno\" size=\"30\"></td></tr>");
      out.println("<tr><td>Please enter your password. </td><td><input type=\"text\" name=\"cardpass\" size=\"30\"></td></tr>");
      out.println("<center><input type=\"submit\" value=\"Paynow\"></center>");

      out.println("</table>");
      out.println("</form>");


   }

 %>
    </body>
</html>
