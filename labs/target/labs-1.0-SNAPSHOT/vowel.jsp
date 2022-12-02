<%-- 
    Document   : vowel
    Created on : 26-Nov-2022, 10:42:27 AM
    Author     : 236336
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% String s = request.getParameter("S"); %>
        <%!
            int freq(char c, String s){
                int count  = 0;
                if(s != null){
                for(int i= 0; i< s.length(); i++)
                    if(c == s.charAt(i))
                        count ++;
                }
            return count;
            }
            
       %>
       <% if(s != null){ %>
       <table class ="table table-bordered table1">
           <thead class ="table" style="background-color: #444 "><th>Vowel</th><th>Frequency</th></thead>
                <% char[] vowel = {'a','e','i','o','u'};
                    for (int i=0; i < vowel.length; i++) { %>
       <tr>
           <td><%= vowel[i]%></td>
           <td><%= freq(vowel[i],s)%></td>
       </tr>
       <% }%>
       </table>
       <% }%> 
    </body>
</html>
