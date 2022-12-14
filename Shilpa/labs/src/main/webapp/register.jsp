<%-- 
    Document   : register
    Created on : 24-Nov-2022, 10:45:54 AM
    Author     : 236336
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Register</title>
        <!--<link rel="stylesheet" href="CSS/layout.css"/>-->
        <link rel="stylesheet" href="CSS/login_register_layout.css"/>
        <script type="text/javascript" src="JS/clock.js"></script>
    </head>
    <body onload = "startTime()">
        <% 
            String messageString =(String) session.getAttribute("error");
            session.removeAttribute("error");            
        %>
    
        <div>
            <ul class="nav">
                <li><a href="login.jsp">Login</a></li>
                <li><a href="index.jsp">Home</a></li>
            </ul>
        </div>
    
         <div class="main">  
            <div class="signup">
		<form method="POST" action="welcome.jsp">
                    <label >Sign up </label>
                    <div class="message" style="font-size:15px; text-align:center; color: whitesmoke; font-weight: bold;">
                      <%=(messageString != null) ? messageString : "" %>
                    </div> 
                    <input type="text" name="name" placeholder="Name" required="">
                    <input type="email" name="email" placeholder="Email"  required="">
		    <input type="password" name="password" placeholder= "Password"  required="">
                    <input type="date" name="dob" placeholder="Date of Birth"required=""/>
			
                    <button class="btn" onclick="window.location='index.jsp';">Cancel</button>                          
                    <input class="btn" type="submit" value="Sign Up" />                        
		</form>
	    </div>			
	</div>
        <div id="clock" class="footer"></div>
    </body>
</html>
