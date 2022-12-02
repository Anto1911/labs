<%-- 
    Document   : register
    Created on : 24-Nov-2022, 10:45:54 AM
    Author     : 236336
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="CSS/layout.css"/>
        <script type="text/javascript" src="JS/clock.js"></script>
    </head>
    <body onload = "startTime()">
        <% 
            String emailError = (String) session.getAttribute("emailError");
                    session.removeAttribute("emailError");
            String passError = (String) session.getAttribute("passError");
                    session.removeAttribute("passError");
        %>
        <div style="margin: auto;">
            <form method="POST" action="welcome.jsp">
                <table class="tables">
                    <caption>Sign Up</caption>
                    <tr><td>Name: </td><td><input type="text" name="name" placeholder="Enter your name" /></td></tr>
                    <tr><td>Email: </td><td><input type="text" name="email" placeholder="<%= (emailError !=null) ? emailError :"Enter your email" %>" /></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password" placeholder="<%= (passError !=null) ? passError : "Enter your password" %>" /></td></tr>
                    <tr><td>DOB: </td><td><input type="date" name="dob"/></td></tr>
                    <tr>
                        <td> </td>
                        <td>
                            <a class="btn" href="index.jsp">Cancel</a>
                            <input class="btn" type="submit" value="Sign Up" />
                        </td>
                    </tr>
                    <ul class="nav">
                        <li><a href="login.jsp">Login</a></li>
                        <li><a href="index.jsp">Home</a></li>
                    </ul>
                    </tr>
                </table>
            </form>
        </div>
        <div id="clock" class="footer"></div>
    </body>
</html>
