
<%-- 
    Document   : flightdetails
    Created on : Feb 26, 2012, 12:48:56 AM
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
        <title>Flight Details Page</title>
    </head>
    <body>
         <img src="header.jpg" alt="header img">
        <table align="center"><tr><td><img src="bg_img.jpg" alt="plane img" align="center"></td></tr></table>

        <%
        if(session.getAttribute("userid").toString().equals("-1"))
        {
           
        }
        else
        {
          out.println("<table align=\"right\"><tr><td align=\"right\"><a href=\"mpage.jsp\"> Logout <td><tr>");
        }
         String url = "jdbc:mysql://localhost:3306/Ticket";
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection(url, "root", "tiger");
 Statement stmt = con.createStatement();
 ResultSet rs = stmt.executeQuery("SELECT * FROM Flight");
 boolean foundany=false;
 out.println("<b><h3 align=\"center\">Flights for "+request.getParameter("sourcee")+" ---> " +request.getParameter("destination")+" </h3></b>");

 out.println("<table bordercolor=\"black\" border=\"1\" align=\"center\">");
 out.println("<tr><th>Flight ID</th><th>Flight NO.</th><th>Flight Name</th> <th>Departure Date</th><th>Departure Time</th><th>Reaching Date</th><th>Reaching Time</th><th>Delayed </th><th> Canceled</th><th>NO of seats available</th><th>Fare</th></tr>");
 out.print("<form name=\"flightdet\" action=\"payticket.jsp\" method=\"post\">");
 while(rs.next())
{
      String fare,fno,source,destination,depdate,deptime,arivdate,arivtime,inpdate, flightname;
      
      int seatsavailable,ontime=-1,canceled=-1,fid=-1;

      inpdate=request.getParameter("dd")+"-"+request.getParameter("dm")+"-"+request.getParameter("dy");
      out.println(inpdate);
      fid=rs.getInt(1);
      fno=rs.getString(2);
      destination=rs.getString(13);
      source=rs.getString(12);
      depdate=rs.getString(5);
      deptime=rs.getString(6);
      arivdate=rs.getString(7);
      arivtime=rs.getString(8);
      seatsavailable= rs.getInt(3)-rs.getInt(4);
      ontime=rs.getInt(9);
      canceled=rs.getInt(10);
      flightname=rs.getString(11);
      fare=rs.getString(15);

     if(request.getParameter("sourcee").equalsIgnoreCase(source) && request.getParameter("destination").equalsIgnoreCase(destination) && inpdate.equalsIgnoreCase(depdate))
     {
            out.println("<tr>");
            foundany=true;
            out.print("<td>"+fid+"</td>");
            out.print("<td>"+fno+"</td>");
            out.print("<td>"+flightname+"</td>");
            
            //out.print("<td>  "+source+"</td>");
            //out.print("<td>  "+destination+"</td>");
            out.print("<td>  "+depdate+"</td>");
            out.print("<td>"+deptime+"</td>");
            out.print("<td>  "+arivdate+"</td>");
            out.print("<td>"+arivtime+"</td>");
            if(ontime==0)
            {
                out.print("<td>NO</td>");
            }
            else if(ontime==1)
            {
                out.print("<td>YES</td>");
            }
            else
            {
                out.print("<td>DATA NOT AVAILABLE</td>");
            }
            if(canceled==0)
            {
                out.print("<td>NO</td>");
            }
            else if(canceled==1)
            {
                out.print("<td>YES</td>");
            }
            else
            {
                out.print("<td>DATA NOT AVAILABLE</td>");
            }

            if(seatsavailable>0)
            {
              out.print("<td> "+seatsavailable+" seats available</td>");
              out.print("<td> <b>"+fare+"</b></td>");
              out.print("<td> <input type=\"radio\" name= \"bookradio\" value="+fid+"> Book Now</td>");
            }
            else
            {
              out.print("<td> <b>All Booked</b></td>");
            }
             
            
             out.println("</tr>");

     }
    }
    out.print("<table align=\"center\">");
    out.print("<tr align=\"center\"><td>");
    out.println("<input type=\"submit\" value=\"Book Now\" align=\"center\"");
   out.print("</tr></td>");
   out.print("</table>");
    out.println("</table>");
    out.println("</form>");
     if(foundany==false)
         {
           out.println("<h2> NO Data found for Source= "+request.getParameter("sourcee")+" AND "+request.getParameter("destination")+"</h2>");
         }





        %>
        
    </body>
</html>
