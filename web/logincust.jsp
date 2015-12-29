<%-- 
    Document   : logincust
    Created on : Mar 8, 2012, 2:58:15 AM
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
        <title>Login Page</title>
    </head>
    <body>
         <img src="header.jpg" alt="header img">
         <%
           
           out.println("<h5 align=\"right\">"+session.getAttribute("username")+"</h5>");
         %>
        <table align="center"><tr><td><img src="bg_img.jpg" alt="plane img" align="center"></td></tr></table>

        <%
         boolean found=false;
         boolean shown=false;
         int usrid;
         String url = "jdbc:mysql://localhost:3306/Ticket";
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection(url, "root", "tiger");
 Statement stmt = con.createStatement();
 ResultSet rs = stmt.executeQuery("SELECT * FROM customer");
 //ResultSet rss=stmt.executeQuery("SELECT * FROM tickt");
 String ticno,frmuname,dbuname,uid,frmpassword,dbpassword,firstname,lastname;

frmuname=request.getParameter("loname");
frmpassword=request.getParameter("pass");

//out.println("frm => "+frmuname);
//out.println("frm => "+frmpassword);

  while(rs.next() && found==false)
 {

     dbuname=rs.getString(9);
     dbpassword=rs.getString(8);
     out.println("<table border=1 align=\"center\">");


     if(dbuname.equalsIgnoreCase(frmuname) && dbpassword.equals(frmpassword))
     {
         found=true;
         session.setAttribute("username",rs.getString(9));
         session.setAttribute("userid", rs.getInt(1));
         usrid=rs.getInt(1);



         //out.println("<tr><td><table align=\"right\"><tr><th>User =>"+session.getAttribute("username")+"</th></tr></table></td></tr>");
          firstname=rs.getString(2);
          lastname=rs.getString(3);
         out.println("<tr><td><b>Name: </b></td> <td> "+firstname+" "+lastname+" </td></tr>");
         out.print("<tr><td><b>Gender: </b></td> <td> ");
             out.print(rs.getString(4)+" </td></tr>");
         

          out.println("<tr><td><b>Address: </b></td><td> "+rs.getString(5)+"</td></tr>");
          out.println("<tr><td><b> Phone: </b></td><td> "+rs.getString(6)+"</td></tr>");
           //out.println("User Found");
}
          Connection conn = DriverManager.getConnection(url, "root", "tiger");

Statement stm = conn.createStatement();
 ResultSet rst = stm.executeQuery("SELECT * FROM tickt");

 boolean flg1=false;
   String flight="-1";
   //out.println("User id ="+session.getAttribute("userid"));
        while(rst.next() && flg1==false)
        {
            
          if(rst.getString(5).equals(session.getAttribute("userid").toString()))
          {
             // out.println("found=true");
              out.println("<tr><td><b>Ticket no= </td><td>"+rst.getString(1)+"</b></td></tr>");

              ticno=rst.getString(1);
            flight=rst.getString(3);
            flg1=true;
           
          }
        }
        if(flg1==false && shown==false)
        {
            shown=true;
            out.println("<tr><td><b>Ticket not booked </b></td> <td> <a href=\"ticketform.html\"> TO book ticket click here</a></tr>");
        }
        else
        {
            Connection co = DriverManager.getConnection(url, "root", "tiger");
 Statement stt = co.createStatement();
 ResultSet res = stt.executeQuery("SELECT * FROM Flight");
 flg1=false;
  while(res.next() && flg1==false)
  {
    if(res.getInt(1)==Integer.parseInt(flight))
    {
       flg1=true;
       out.println("<tr><td><b>Flight No.</b></td><td>"+res.getString(2)+"</td></tr>");
       out.println("<tr><td><br><b>Source : </b></td><td>"+res.getString(12)+"</td></tr>");
       out.println("<tr><td><br><b>Destination :</b></td><td>"+res.getString(13)+"</td></tr>");
       out.println("<tr><td><br><b>Departure date</b> :</td><td>"+res.getString(5)+"</td></tr>");
       out.println("<tr><td><br><b>Arrival Date :</b></td><td>"+res.getString(7)+"</td></tr>");
       out.println("<tr><td><br><b>Fare : </b></td><td>"+res.getString(15)+"</td></tr>");
       //out.println("</center> <br><br>");
    }
  }

/*          if(rs.getInt(7)==-1)
              out.println("<tr><td><b>Ticket not booked </b></td> <td> <a href=\"ticketform.html\"> TO book ticket click here</a></tr>");
          else
          {
             out.println("<tr><td><b>Ticket Details</b></td></tr>");
             
          }*/

     }                           
 out.println("</table>");
  }
out.println("<center><a href=\"mpage.jsp\"> logout Now </a> "+session.getAttribute("username")+"</center>");
 //out.println("uname passed is "+request.getParameter("loname"));

  if(found==false)
  {
    out.println("<h2> No user found </h2>");
    out.println("<a href=\"signup.html\"> please Sign up for an account here ...</a>");
  }

        %>
    </body>
</html>
