<%-- 
    Document   : logout
    Created on : 24-Nov-2022, 11:10:48 AM
    Author     : 236336
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Logout</title>
        <link rel="stylesheet" href="CSS/layout.css"/>
        <script type="text/javascript" src="JS/clock.js"></script>
    </head>
    <body onload = "startTime()">
        <% session.invalidate(); %>
        <ul class="nav">
            <li><a href="index.jsp">Home</a></li>
        </ul>
        <h1>You have been logged out</h1>
        <h1>Thank you!</h1>
        <div id="clock" class="footer"></div>
    </body>
</html>
