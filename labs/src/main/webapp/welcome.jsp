<%-- 
    Document   : welcome
    Created on : 24-Nov-2022, 11:53:40 AM
    Author     : 236336
--%>

<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link rel="stylesheet" href="CSS/layout.css"/>
        <script type="text/javascript" src="JS/clock.js"></script>
    </head>
    <body onload = "startTime()">
                <% 
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");

            
            String emailRegEx = "([a-zA-Z]+)[._-]([a-zA-Z]+)@.*(.com)";
            String passRegEx = "[A-Z][a-z]{5,}\\d{3,}";
            
            if(name.isBlank()|| email.isBlank() || password.isBlank() || dob.isBlank()){
                response.sendRedirect("register.jsp");
         
            } else if(!email.matches(emailRegEx) || !password.matches(passRegEx)){
                if(!email.matches(emailRegEx)){
                    session.setAttribute("emailError", "Incorrect email format");
                    }if(!password.matches(passRegEx)){
                        session.setAttribute("passError", "Incorrect password format");
                    }
                response.sendRedirect("register.jsp");
            }else{            
                User user = new User(name, email, password, dob);
                Users users = new Users();
                users.add(user);
                
                session.setAttribute("user", user);
                session.setAttribute("users", users);
               }
              
            
        %>
    <ul class="nav">
        <li><a href="logout.jsp">Logout</a></li>
        <li><a href="main.jsp">Main</a></li>
        
    </ul>
        <h1>Welcome <%= name %></h1>

        <table class="tableWelcome">
            <caption>User Information</caption>
            <tr><td>Name: </td><td> <%= name %></td></tr>
            <tr><td>Email: </td><td> <%= email %></td></tr>
            <tr><td>D.O.B.: </td><td> <%= dob %></td></tr>            
        </table> 
<div id="clock" class="footer"></div>
</body>
</html>
