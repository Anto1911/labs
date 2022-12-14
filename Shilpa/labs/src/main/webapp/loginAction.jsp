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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Action</title>        
    </head>
    <body >
        <% String filename = application.getRealPath("WEB-INF/users.xml"); %>
        <jsp:useBean id="userDAO" scope="application" class="com.model.dao.UserDAO" >
            <jsp:setProperty name="userDAO" property="fileName" value="<%= filename%>" />
        </jsp:useBean>
        <% 
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            User user = null;

            Users users = userDAO.getUsers();
            if(users != null){
                user = users.user(email, password);                     
            }                 
        
            if(user != null) { 
                session.setAttribute("user", user); 
                response.sendRedirect("main.jsp");
            } else {
              session.setAttribute("usernotexist", "User does not exist!!!");
              response.sendRedirect("login.jsp");
            }
        %>  
    
    </body>
</html>
