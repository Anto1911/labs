<%-- 
    Document   : adminAction
    Created on : 14-Dec-2022, 3:36:15 PM
    Author     : 236361
--%>

<%@page import="com.model.dao.AdminDAO"%>
<%@page import="com.model.Admins"%>
<%@page import="com.model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Action</title>
  </head>
  <body>
    <% String filename = application.getRealPath("WEB-INF/admin.xml"); %>
        <jsp:useBean id="adminDAO" scope="application" class="com.model.dao.AdminDAO" >
            <jsp:setProperty name="adminDAO" property="fileName" value="<%= filename%>" />
        </jsp:useBean>
        <% 
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Admin admin = null;

                Admins admins = adminDAO.getAdmins();
                if(admins != null){
                    admin = admins.admin(email, password);                     
                }                 
        %>

        <% if(admin != null) { 
                session.setAttribute("admin", admin); 
                response.sendRedirect("adminView.jsp");
            }else {
              session.setAttribute("usernotexist", "User does not exist!!!");
              response.sendRedirect("admin.jsp");
            }
        %>
    <h1>Hello World!</h1>
  </body>
</html>
