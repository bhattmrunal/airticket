<%--
    Document   : index
    Created on : Feb 25, 2012, 1:06:36 PM
    Author     : mrunal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to AirTicket website.</title>
    </head>
    <body>
        <img src="header.jpg" alt="header img">
        <table align="center"><tr><td><img src="bg_img.jpg" alt="plane img" align="center"></td></tr></table>


        <h1><marquee>Welcome to Air ticket booking website !!! </marquee></h1>
        <!--<h3 align="right"><b><a href="signup.html"> Sign up to book ticket</a></b>&nbsp;&nbsp; or sign in <b><a href="signin.html"> Existing Users</a></b></h3>-->
        <%
        /*session.setAttribute("username", " ");
        session.setAttribute("userid", "-1");
        session.setAttribute("nextpage", "normal");
        session.setAttribute("flid","-1");
        session.setAttribute("company","noname");*/

        %>
        <form name="flightdata" action="flightdetails.jsp" method="POST">
            <table align="center" border="1" bordercolor="black" bgcolor="lightblue" width="500">
                <tr><td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <h2>Journey Details</h2></td></tr>
            <tr><td>
            <h3>Leaving From => <!--<input type="text" name="sourcee" value="" size="50"/>-->
            <select name="sourcee">
                    <option value="pune">Pune</option>
                    <option value="mumbai">Mumbai</option>
                    <option value="chennai">Chennai</option>
                    <option value="delhi">Delhi</option>
                    <option value="kolkatta">Kolkatta</option>
                    <option value="london">London</option>
                    <option value="berlin">Berlin</option>
                    <option value="banglore">Banglore</option>
                    <option value="goa">Goa</option>
                    <option value="ahemdabad">Ahemdabad</option>
                </select>
            </h3></td></tr>
                    <tr><td><h3>Going To =>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--<input type="text" name="destination" value="" size="50"/>-->
                            <select name="destination">
                    <option value="pune">Pune</option>
                    <option value="mumbai">Mumbai</option>
                    <option value="chennai">Chennai</option>
                    <option value="delhi">Delhi</option>
                    <option value="kolkatta">Kolkatta</option>
                    <option value="london">London</option>
                    <option value="berlin">Berlin</option>
                    <option value="banglore">Banglore</option>
                    <option value="goa">Goa</option>
                    <option value="ahemdabad">Ahemdabad</option>
                </select>
                            </h3></td></tr>

                    <tr><td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;dd &nbsp;&nbsp;&nbsp; mm&nbsp;&nbsp;&nbsp;&nbsp; yyyy<br>
                            <h3>Departure Date =><input type="text" name="dd" value="" size="2"/>-<input type="text" name="dm" value="" size="2" />-<input type="text" name="dy" value="" size="4" /></h3>

                        </td>
                    </tr>
                    <tr><td align="center"><input type="submit" value="GO" name="gobutton" /></td></tr>
        </table>
            </form>
<img src="images\footer1.jpg">

    </body>
</html>
