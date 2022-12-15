<%-- 
    Document   : logout
    Created on : Jun 7, 2020, 12:16:38 PM
    Author     : Om prakash
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
<%
session.invalidate();
response.sendRedirect("home.jsp");

%>
    </body>
</html>
