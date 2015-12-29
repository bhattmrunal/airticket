<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : addcust
    Created on : Mar 10, 2012, 2:30:36 AM
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
        <title>Adding Customer</title>
    </head>
    <body>
        <%

          String url = "jdbc:mysql://localhost:3306/Ticket";
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection(url, "root", "tiger");
 Statement stmt = con.createStatement();
 //ResultSet rs = stmt.executeQuery("SELECT * FROM customer");
String fname,lname,uname,addr,age,gender,password, phone;
int gen=0;
fname= request.getParameter("fname");
lname=request.getParameter("lname");
password=request.getParameter("pass");
age=request.getParameter("age");
gender=request.getParameter("gender");
addr=request.getParameter("addr");
phone=request.getParameter("phone");
if(gender.equalsIgnoreCase("male"))
    {
      gen=1;

    }
else
    {
      gen=0;
    }
fname="Gauravvvv";
lname="Sharmaaaa";
//int i=stmt.executeUpdate("INSERT INTO customer(firstname,lastname) VALUES('Gaura','Sharm'");
    
   out.println("User Successfully created <a href=\"signin.html\"> Click here to login</a>");
        %>
       

        <sql:update var="insrtcust" dataSource="jdbc/airticket">
            INSERT INTO customer(firstname, lastname,gender,address,phone,ticketid,password,uname)
            VALUES (?, ?, ?, ?, ?, ?, ?,?)

             <sql:param value="${param.fname}"/>
        <sql:param value="${param.lname}"/>
    <sql:param value="${param.gender}"/>
        <sql:param value="${param.addr}"/>
        <sql:param value="${param.phone}"/>
        <sql:param value="-1"/>
        <sql:param value="${param.pass}"/>
        <sql:param value="${param.uname}"/>

        </sql:update>
    </body>
</html>
