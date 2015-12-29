<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : booknow
    Created on : Mar 15, 2012, 9:02:50 AM
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
        <title>Booking Ticket</title>
    </head>
    <body>
<img src="header.jpg" alt="header img">
        <table align="center"><tr><td><img src="bg_img.jpg" alt="plane img" align="center"></td></tr></table>

        <%
         boolean crd=false;
          if(session.getAttribute("userid").toString().equals("-1"))
          {
             out.println("please login first");
          }
          else
          {
          out.println("<a href=\"mpage.jsp\"> logout </a> "+session.getAttribute("username"));

          String usrid;
   usrid=session.getAttribute("userid").toString();

      String url = "jdbc:mysql://localhost:3306/Ticket";
 Class.forName("com.mysql.jdbc.Driver");
 Connection conn = DriverManager.getConnection(url, "root", "tiger");
 Statement stm = conn.createStatement();
 
 ResultSet rst = stm.executeQuery("SELECT * FROM customer");

   if(session.getAttribute("userid").toString().equals("-1"))
   {
     out.println("Sorry !! you have to login to complete the transaction");
   }
   else
   {
     String rt;
     int rate,bal,rem;
     boolean usrfnd=false;
     while(rst.next() && usrfnd==false)
     {
        if(Integer.toString(rst.getInt(1)).equals(usrid))
        {
           //out.println("user found");
           if(rst.getString(10).equalsIgnoreCase(request.getParameter("cardno")) && rst.getString(12).equals(request.getParameter("cardpass").toString()))
           {
             //out.println("card no correct");
             crd=true;
             rt=session.getAttribute("rate").toString();
             rate=Integer.parseInt(rt);
             bal=Integer.parseInt(rst.getString(11));
             if(bal>=rate)
             {
               rem=bal-rate;
               out.println("remining bal="+rem);
             }
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

    if(crd==true)
   {                          //String flight=request.getParameter("bookradio");
        String flight=session.getAttribute("flightid").toString();
        String flid,ticno;

          //String url = "jdbc:mysql://localhost:3306/Ticket";
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection(url, "root", "tiger");

Statement stmt = con.createStatement();
 ResultSet rs = stmt.executeQuery("SELECT * FROM tickt");
 boolean flg=false;
usrid=session.getAttribute("userid").toString();
  while(rs.next() && flg==false)
{
      if(rs.getString(3).equals(flight) && rs.getString(5).equals(usrid))
      {
        flg=true;
      }

 }
        if(flg==false)
         {

        out.println("flid="+flight);
        out.println("usrid= "+session.getAttribute("userid"));
        //flight="1";//session.getAttribute("flid").toString();
        usrid=session.getAttribute("userid").toString();
        //usrid="1";
        String query="INSERT INTO tickt(flightid,customerid) VALUES ( ?, ?)";

        PreparedStatement ps= con.prepareStatement(query);
        ps.setString(1, flight);
        ps.setString(2, usrid);

                int numRowsChanged = ps.executeUpdate();

                 out.println("<br><br><br><center><h3>Transaction Successful Your ticket is booked now !!!</h3></center>");
         response.sendRedirect("showticket.jsp"); 
        }
         else
         {
           out.println("You already have the ticket in that flight");
         }
}
 else
 {

   out.println("card no. not valid");
}
}
%>
      
    </body>
</html>
