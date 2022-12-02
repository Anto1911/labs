<%-- 
    Document   : login
    Created on : 24-Nov-2022, 10:49:04 AM
    Author     : 236336
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="CSS/layout.css"/>
        <script type="text/javascript" src="JS/clock.js"></script>
    </head>
    <body onload = "startTime()">
           <% 
            String usernotexist = (String) session.getAttribute("usernotexist");
            session.removeAttribute("usernotexist");
        %>
        <ul class="nav">
            <li><a href="index.jsp">Home</a></li>
        </ul>
        <div style="margin: auto;">
            <form method="POST" action="loginAction.jsp">
                <table class="tables">
                    <caption>Sign In <span class="message"><%= (usernotexist != null) ? usernotexist : ""%></span></caption>
                    <tr><td>Email: </td><td><input type="text" name="email" placeholder="Enter your email" /></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password" placeholder="Enter your password" /></td></tr
                    <tr>
                        <td> </td>
                        <td>
                            <a class="btn" href="index.jsp">Cancel</a>
                            <input class="btn" type="submit" value="Sign In" />
                        </td>
                    </tr>
        <div id="clock" class="footer"></div>
    </body>
</html>
