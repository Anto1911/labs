<%-- 
    Document   : account
    Created on : 29-Nov-2022, 3:24:54 PM
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
        <title>Account Settings</title>
        <!--<link rel="stylesheet" href="CSS/layout.css"/>-->
        <link rel="stylesheet" href="CSS/login_register_layout.css"/>
        <script type="text/javascript" src="JS/clock.js"></script>
    </head>
    <body onload="startTime()">
        <% String filename = application.getRealPath("/WEB-INF/users.xml"); %>
        <jsp:useBean id="userDAO" scope="application" class="com.model.dao.UserDAO" >
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename %>" />
        </jsp:useBean>
        <%! 
            User user;            
        %>         
        <%
            String submitted = request.getParameter("submitted");
            String userViewEmail = request.getParameter("email");
            String adminUpdate = (String)session.getAttribute("email");
//            if(adminUpdate != null){
//                userViewEmail = adminUpdate;                
//            }
            Users users = userDAO.getUsers();
            if(userViewEmail != null || adminUpdate != null){
               if(userViewEmail == null ){ userViewEmail = adminUpdate;} 
               user = users.user(userViewEmail);              
               session.setAttribute("email", userViewEmail);
            }else{
                user = (User) session.getAttribute("user");
            }
            
            if (submitted != null && submitted.equals("submitted")) {
                int ID = Integer.parseInt(request.getParameter("ID"));
                String name = request.getParameter("name");
                String email = request.getParameter("uemail");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");

                user.update(ID, name, email, password, dob);     
                session.setAttribute("user", user);
                userDAO.update(users, user);                
            }           
        %>
        
        <div>
            <ul class="nav">
              <% if(userViewEmail ==null){%>
                <li><a href="main.jsp">Main</a></li>
                <li><a href="delete.jsp">Delete</a></li>
                <li><a href="logout.jsp">Logout</a></li>
              <% } else{%>
                <li><a href="adminView.jsp">Admin</a></li>
                <li><a href="delete.jsp">Delete</a></li>                
              <% }%> 
            </ul>
        </div>

        <div class="main">  
            <div class="signup">
		<form method="POST" action="account.jsp">
                    <label >Edit User </label>
                    <div class="message" style="font-size:15px; text-align:center; color: whitesmoke; font-weight: bold;">
                      <%=(submitted != null) ? "Update is Successful" : "" %>
                    </div> 
                        <input type="text" name="ID"  placeholder="ID" value="<%= user.getID()%>" readonly="true" style="color: #888;">
                        <input type="text" name="name" placeholder="name" value="<%= user.getName()%>">
                        <input type="email" name="uemail" placeholder="uemail" value="<%= user.getEmail()%>" readonly="true" style="color: #888;">
                        <input type="password" name="password" placeholder="password" value="<%= user.getPassword()%>">
                        <input type="date" name="dob" placeholder="dob" value="<%= user.getDOB()%>"/>
                        <input type="hidden" name="submitted" value="submitted">                    
                    <div>
                    <% if(userViewEmail ==null){%>
                        <button class="btn" type= button onclick="window.location='main.jsp';">Cancel</button> 
                    <% } else{%>
                        <button class="btn" type= button onclick="window.location='adminView.jsp';">Cancel</button>
                    <% }%>                                              
                    <input class="btn" type="submit" value="Update" />  
                    </div>
		</form>
	    </div>			
	</div>

        <div id="clock" class="footer"></div>
    </body>
</html>
