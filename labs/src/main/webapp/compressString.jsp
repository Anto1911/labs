<%-- 
    Document   : compressString
    Created on : 29-Nov-2022, 11:21:45 AM
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
            int spaceCount(String s) {
                int spacecount = 0;
                if (s != null) {
                    for (char c : s.toCharArray()) {
                        if (c == ' ') {
                            spacecount++;
                        }
                    }
                }
                return spacecount;
            }

            String compress(String s) {
                if (s != null) {
                    return s.replaceAll("\\s", "");
                }
                return null;
            }
        %>
        <% if (s != null) {%>
        <table class ="table table-bordered table2 ">
            <thead class ="table" style="background-color: #444"><th>String Info</th><th></th></thead>
        <tr>
            <td>Original String </td>
            <td><%= s%></td>
        </tr>
        <td> Compress String </td>
        <td><%= compress(s)%></td>
    </tr>
    <tr>
        <td> Space Count </td>
        <td><%= spaceCount(s)%></td>
    </tr>
    <tr>

</table>
<% }%>
</body>
</html>

