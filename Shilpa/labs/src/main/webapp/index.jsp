<%-- 
    Document   : index
    Created on : 23-Nov-2022, 2:58:39 PM
    Author     : 236336
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home</title>
        <link rel="stylesheet" href="CSS/layout.css"/>
        <script type="text/javascript" src="JS/clock.js"></script>
    </head>
    <body onload = "startTime()">
               
    <div> 
            <ul class="nav"> 
            <li><a href="register.jsp">Register</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="admin.jsp">Admin</a></li>            
            <li><a href="strings.jsp">Strings</a></li>
        </ul>
    </div>
        <h1 style="text-align: center">Virtual Vision</h1> 
    <div id="clock" class="footer"></div>
</body>
</html>
