<%-- 
    Document   : account
    Created on : 29-Nov-2022, 3:24:54 PM
    Author     : 236336
--%>

<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Settings</title>
        <link rel="stylesheet" href="CSS/layout.css"/>
        <script type="text/javascript" src="JS/index.js"></script>
    </head>
    <body onload="startTime()">
        <%! 
            User user;
        %>
        
                <%
            String submitted = request.getParameter("submitted");

            if (submitted != null && submitted.equals("submitted")) {
                int ID = Integer.parseInt(request.getParameter("ID"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                user = (User) session.getAttribute("user");
                user.update(ID, name, email, password, dob);     
                session.setAttribute("user", user);
            }else{
                user = (User) session.getAttribute("user");
            }
        %>
        
                <div style="margin: auto;">
            <form method="POST" action="account.jsp">
                <table class="tables">
                    <caption>User <span class="message"><%= (submitted != null) ? ": Update is Successful" : ""%></span></caption>
                    <tr><td>ID: </td><td><input type="text" name="ID" value="${user.ID}" readonly="true" /></td></tr>
                    <tr><td>Name: </td><td><input type="text" name="name" value="${user.name}" /></td></tr>
                    <tr><td>Email: </td><td><input type="text" name="email" value="${user.email}" readonly="true"/></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password" value="${user.password}" /></td></tr>
                    <tr><td>DOB: </td><td><input type="date" name="dob" value="<%= user.getDOB()%>"/></td></tr>
                    <tr><input type="hidden" name="submitted" value="submitted"></tr>
                   <tr>
                        <td> </td>
                        <td>
                            <a class="btn" href="index.jsp">Cancel</a>
                            <input class="btn" type="submit" value="Submit" />
                        </td>
                    </tr>
                        <ul class="nav">
        <li><a href="logout.jsp">Logout</a></li>
        <li><a href="main.jsp">Main</a></li>
    </ul>
    </tr> 
                </table>
            </form>
        </div>        
    <div id="clock" class="footer"></div>
    </body>
</html>
