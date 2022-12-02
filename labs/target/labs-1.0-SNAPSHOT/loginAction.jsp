<%-- 
    Document   : loginAction
    Created on : 26-Nov-2022, 12:16:45 PM
    Author     : 236336
--%>

<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Action</title>
        <link rel="stylesheet" href="CSS/layout.css"/>
        <script type="text/javascript" src="JS/clock.js"></script>
    </head>
    <bodyonload onload = "startTime()">
                <% 
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            User user = null;

                Users users = (Users) session.getAttribute("users");
                if(users != null){
                    user = users.user(email, password);                     
                }                
        %>

    <% if(user != null) { %>
        
    <ul class="nav">
        <li><a href="logout.jsp">Logout</a></li>
        <li><a href="main.jsp">Main</a></li>
    </ul>
        <h1>Welcome <%= user.getName() %></h1>


            <table class="tableWelcome">             
            <caption>User Information</caption>
            <tr><td>Email: </td><td> <%= email %></td></tr>
            </table>
            
    <%} else {
              session.setAttribute("usernotexist", ": User does not exist!");
              response.sendRedirect("login.jsp");
    }%>  
    <div id="clock" class="footer"></div>
    </body>
</html>
