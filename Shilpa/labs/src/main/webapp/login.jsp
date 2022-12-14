<%-- 
    Document   : login
    Created on : 24-Nov-2022, 10:49:04 AM
    Author     : 236336
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <link rel="stylesheet" href="CSS/login_register_layout.css"/>
        <script type="text/javascript" src="JS/clock.js"></script>
    </head>
    <body onload = "startTime()">
           <% 
            String usernotexist = (String) session.getAttribute("usernotexist");
            session.removeAttribute("usernotexist");
        %>
        <ul class="nav">
            <li><a href="index.jsp">Home</a></li>
<!--            <li><a href="login.jsp" >Login</a></li>-->
            <li><a href="register.jsp">Register</a></li>
        </ul>

        <div class="main">  
            <div class="signup">
		<form method="POST" action="loginAction.jsp">
                    <label >Sign In </label>
                    <div class="message" style="font-size:15px; text-align:center; color: whitesmoke; font-weight: bold;">
                      <%=(usernotexist != null) ? usernotexist : "" %>
                    </div>                     
                    <input type="email" name="email" placeholder="Email"  required="">
		    <input type="password" name="password" placeholder= "Password"  required="">
                    
                    <button class="btn" onclick="window.location='index.jsp';">Cancel</button>                          
                    <input class="btn" type="submit" value="Sign In" />                        
		</form>
	    </div>			
	</div>

        <div id="clock" class="footer"></div>
    </body>
</html>
