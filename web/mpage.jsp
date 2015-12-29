<%-- 
    Document   : mpage
    Created on : Apr 16, 2012, 6:19:39 PM
    Author     : mrunal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Air ticket Home Page</title>
    </head>
    
<BODY alink="yellow">


<center><img src="images\header.jpg"></center>
<center>
<H1><CENTER><u><FONT COLOR="balck"><FONT FACE="MATURA MT SCRIPT CAPITALS">Airline Reservation System</font></u></CENTER></H1></center>
<CENTER><IMG SRC="images\6.jpg"></CENTER><BR>
<center><marquee bgcolor="black" width="90%" height="7%"><FONT COLOR="blue" SIZE="14">Welcome to Online Airticket Reservation System</FONT></marquee></center>
<BR><center>
<img src="images\footer1.jpg"></center>








<%

   session.setAttribute("username", " ");
        session.setAttribute("userid", "-1");
        session.setAttribute("nextpage", "normal");
        session.setAttribute("flid","-1");
        session.setAttribute("company","noname");

%>
</BODY>
    
</html>
