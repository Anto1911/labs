<?xml version="1.0" encoding="UTF-8"?>

 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>User Information</title>
                <link href="CSS/user.css" rel="stylesheet" type="text/CSS"></link>
                <script type="text/javascript" src="JS/clock.js"></script>
            </head>
            <body onload = "startTime()">
              <div> 
                <ul class="nav"> 
                  <!--<li><a href="index.jsp">Home</a></li>-->
                  <li><a href="logout.jsp">Logout</a></li>                  
                </ul>
              </div>
              <h1 style="text-align: center">User List</h1> 
              
              <xsl:apply-templates/>
              <div id="clock" class="footer"></div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="users">
        <table>
            <thead>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Date of Birth</th>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
        <xsl:template match="/users/user">
        <tr>
            <td>
                <xsl:value-of select="ID"/>
            </td>
            <td>
                <xsl:value-of select="name"/>
            </td>
            <td>
                <xsl:variable name="emailurl" select="email"></xsl:variable>
                <a href="http://localhost:8080/labs/account.jsp?email={$emailurl}">
                    <xsl:value-of select="email"/>
                </a>
            </td>
            <td>
                <xsl:value-of select="DOB" type="date"/>
            </td>
        </tr>        
    </xsl:template>
</xsl:stylesheet>
