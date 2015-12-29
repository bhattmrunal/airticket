<%-- 
    Document   : cancel
    Created on : Apr 16, 2012, 6:31:44 PM
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
        <title>Cancellation Page</title>
    </head>
    <body>
        <img src="header.jpg" alt="header img">
        <table align="center"><tr><td><img src="bg_img.jpg" alt="plane img" align="center"></td></tr></table>
   <%

    if(session.getAttribute("username").equals(" ") || session.getAttribute("userid").equals("-1"))
    {
      out.println("Please login to cancel you ticket");

    }
    else
    {
        boolean flg=false,flightfound=false;

      out.println("Your ticket(s) ....");

     String url = "jdbc:mysql://localhost:3306/Ticket";
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection(url, "root", "tiger");

Statement stmt = con.createStatement();
 ResultSet rs = stmt.executeQuery("SELECT * FROM tickt");

 Connection co = DriverManager.getConnection(url, "root", "tiger");
 Statement stm = con.createStatement();
 ResultSet rst = stm.executeQuery("SELECT * FROM Flight");

 String usrid=session.getAttribute("userid").toString();
 
 out.println("<table bordercolor=\"black\" border=\"1\" align=\"center\"><tr><th> Ticket Id </th> <th>source</th> <th> destination</th> <th> departure Date</th><th>Cancel Now</th></tr>");
 out.println("<form name=\"cancelform\" action=\"cancelnow.jsp\" method=\"post\"");
 int count=0;
 while(rs.next())
   {
    // out.println("<br> ");
     if(rs.getString(5).equals(usrid))
     {
       //out.println(" ticket no  "+rs.getInt(1));
     
         //count++;
        //out.println(" yyy"+rs.getString(3));
        rst.beforeFirst();

        while(rst.next())
        {
            
            if(rs.getString(3).equals(Integer.toString(rst.getInt(1))))
            {
                //flightfound=true;

               out.println("<br><tr><td>"+rs.getString(3)+"</td>");
               out.println("<td>"+rst.getString(12)+"</td>");
               out.println("<td>"+rst.getString(13)+"</td>");
               out.println("<td>"+rst.getString(5)+"</td>");
               out.println("<td><input type=\"radio\" name=\"ticketid\" value="+rs.getInt(1)+"></td>");
               out.println("</tr>");
            }
            
        }
         

     }

   }
 out.println("</table>");

 //out.println("count="+count);
 out.println("<table align=\"center\">");
 out.println("<tr><td><input type=\"submit\" value=\"CANCEL NOW\" align=\"center\"></td></tr>");
 out.println("</table>");
 out.println("</form>");
 out.println("</table>");
 
 }


   %>
    </body>
</html>
