<%-- 
    Document   : main
    Created on : 29-Nov-2022, 3:09:58 PM
    Author     : 236336
--%>

<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Main</title>
        <link rel="stylesheet" href="CSS/layout.css"/>
        <link rel="stylesheet" href="CSS/User_Info.css"/>
        <script type="text/javascript" src="JS/clock.js"></script>
    </head>
    <body onload = "startTime()">
        
        <% 
          User user = (User)session.getAttribute("user");
          session.setAttribute("user", user);
         %>
         
        <div>
            <ul class="nav">
                <li><a href="logout.jsp">Logout</a></li>
                <li><a href="account.jsp">Account Settings</a></li>
            </ul>
        </div>

        <div class="wrapper">
            <div class="left">
                <h2><%= user.getName() %></h2>
                <p><br>ID :<%= user.getID() %></p>
                           
            </div>
            <div class="right">
                <div class="info">
                    <h3>Information</h3>
                    <div class="info_data">                        
                        <div class="data">
                           <h4>Email</h4>
                           <p><%= user.getEmail() %></p>
                        </div>
                        <div class="data">
                           <h4>DOB</h4>
                            <p><%= user.getDOB() %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="clock" class="footer"></div>
    </body>
</html>
