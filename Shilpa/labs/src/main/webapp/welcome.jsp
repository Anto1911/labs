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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Welcome</title>        
    </head>
    <body>
        <%String filename = application.getRealPath("/WEB-INF/users.xml"); %>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        <% 
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            boolean nextPage = false;
            String error ="";
            
            String emailRegEx = "[a-zA-Z0-9_%+-]+[.][a-zA-Z0-9_%+-]+@[a-zA-Z0-9-]+(.com)";
            String passRegEx = "[A-Z][A-Za-z]{5,}\\d{2,}";
            
           if(!email.matches(emailRegEx) || !password.matches(passRegEx)){
                error = "Incorrect ";
                if(!email.matches(emailRegEx)){
                    error += "email";
                    
                }                
                if(!password.matches(passRegEx)){
                    if(error.contains("email")){
                        error += " and ";
                    }
                    error += "password";                    
                }
                error += " format";                
            }else{            
                User user = new User(name, email, password, dob);
               // Users users = new Users();
                Users users = userDAO.getUsers();
                User userXml = users.user(email);
                
                if(userXml != null){
                    error = "User already exists";               
                }else{
                   nextPage = true;
                   users.add(user);
                   userDAO.save(users, filename);
                   session.setAttribute("user", user);
                   session.setAttribute("users", users);
                   
                }
            }
            if(nextPage){
                response.sendRedirect("main.jsp");
            }else{
                session.setAttribute("error", error);
                response.sendRedirect("register.jsp");
            }
        %>
        
    </body>
</html>
