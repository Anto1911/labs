<%-- 
    Document   : delete
    Created on : 08-Dec-2022, 11:22:54 AM
    Author     : 236361
--%>

<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Delete</title>
    <link rel="stylesheet" href="CSS/layout.css"/>
    <script type="text/javascript" src="JS/clock.js"></script>
  </head>
  <body onload = "startTime()">
    <ul class="nav">
            <li><a href="index.jsp">Home</a></li>
    </ul>
    
    <% String filename = application.getRealPath("/WEB-INF/users.xml"); %>
    <jsp:useBean id="userDAO" scope="application" class="com.model.dao.UserDAO" >
    <jsp:setProperty name="userDAO" property="fileName" value="<%=filename %>" />
    </jsp:useBean>
    <% 
        Users users = userDAO.getUsers();
        User user;
        String userViewEmail = (String)session.getAttribute("email");
        if(userViewEmail != null){
            user = users.user(userViewEmail);
            session.removeAttribute("email");
        }else{
            user = (User)session.getAttribute("user");
        }
        
        if(user != null){            
            userDAO.delete(users, user);
            //out.println(userViewEmail);
            if(userViewEmail != null){
                response.sendRedirect("admin.jsp");
            }else{
    %>
   
        <h1> Account of <%=user.getName() %> deleted</h1>
    <%      } 
        } else{ %>
        <h1>You have been logged out click <a href="index.jsp">here </a> to go back home</h1>
    <% } 
        session.invalidate();%>
    <div id="clock" class="footer"></div>
  </body>
</html>
