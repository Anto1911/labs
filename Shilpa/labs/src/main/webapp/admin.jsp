<%-- 
    Document   : admin
    Created on : 13-Dec-2022, 3:02:25 PM
    Author     : 236361
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin View</title>
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
        </ul>

        <div class="main">  
            <div class="signup">
		<form method="POST" action="adminAction.jsp">
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
