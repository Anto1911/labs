<%-- 
    Document   : admin
    Created on : 13-Dec-2022, 3:02:25 PM
    Author     : 236361
--%>

<%@page import="com.model.dao.XMLTransformer"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="com.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin View</title>
    </head>
    <body>
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <% String xslPath = application.getRealPath("/XSL/users.xsl");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        
        <% 
            Users users = userDAO.getUsers();
            XMLTransformer transformer = new XMLTransformer();
            transformer.transform(xslPath, users, new StreamResult(out));            
        %>
        
    </body>
</html>
