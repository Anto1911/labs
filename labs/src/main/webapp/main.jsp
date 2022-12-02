<%-- 
    Document   : main
    Created on : 29-Nov-2022, 3:09:58 PM
    Author     : 236336
--%>

<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main</title>
        <link rel="stylesheet" href="CSS/layout.css"/>
        <script type="text/javascript" src="JS/clock.js"></script>
    </head>
    <body onload = "startTime()">
        <% 
          User user = (User)session.getAttribute("user");
          session.setAttribute("user", user);
         %>
        </tr>
    <ul class="nav">
        <li><a href="logout.jsp">Logout</a></li>
        <li><a href="account.jsp">Account Settings</a></li>
    </ul>
        </tr>
            <table class="tables">             
            <caption>User Information</caption>
            <tr><td>ID </td><td> <%= user.getID() %></td></tr>
            <tr><td>Name: </td><td> <%= user.getName()  %></td></tr>
            <tr><td>Email: </td><td> <%= user.getEmail() %></td></tr>
            <tr><td>D.O.B.: </td><td> <%= user.getDOB() %></td></tr>
        </table>
<div id="clock" class="footer"></div>
    </body>
</html>
