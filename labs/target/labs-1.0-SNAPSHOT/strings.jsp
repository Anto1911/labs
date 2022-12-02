<%-- 
    Document   : strings
    Created on : 24-Nov-2022, 10:47:45 AM
    Author     : 236336
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Strings</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="JS/clock.js"></script>
        <link rel="stylesheet" href="CSS/layout.css"/>        
        <script>
            $('form input').on('change', function () {
                $(this).closest('form').submit();
            });
        </script>
    </head>
    <body onload = "startTime()">
                <div>
            <ul class="nav" >                          
            <a  href="index.jsp">Home</a>
        </div>
        <h1 style="text-align: center">Strings</h1>
        <br> 
        <br>
        <nav class="navbar navbar-light" style="background-color: #444" >
            <div class="container justify-content-center">
                <form class="navbar-form navbar-center" action="strings.jsp">
                    <div class="input-group">
                        <a class="navbar-brand " style="color: #f4f4fc" href="#">Enter a String</a>
                        <input id="S" type="text" name="S" class="form-control"  style="border-color: #78f1b8" autofocus>
                    </div>
                </form>
            </div>
        </nav>
        <div class="container-fluid">
                <div class="row">
                <div class="col-xl-2">
                    <jsp:include page="vowel.jsp" flush="true" />                    
                </div>                
                <div class="col-xl-2">
                    <jsp:include page="compressString.jsp" flush="true" />
                </div>
                </div
        </div>
        <div id="clock" class="footer"></div>
    </body>
</html>
