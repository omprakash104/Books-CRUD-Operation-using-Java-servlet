<%-- 
    Document   : changepassword
    Created on : Jun 9, 2020, 9:21:26 AM
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
        <h1>Welcome! <%out.println(session.getAttribute("usr"));
//            if(session.getAttribute("usr")==null)
//            {
//                response.sendRedirect("login.jsp");
//            }
            %></h1>
        <h2 align="center">Welcome To Change Password page </h2>
        <form action="ChangePassdDB" method="post">
            <table>
                <tr><td>New Password:-</td><td><input type="text" name="t1"></td></tr>
                 <tr><td>Retype Password:-</td><td><input type="text" name="t2"></td></tr>
                 <tr><td><input type="text" name="t3" value="<%out.println(session.getAttribute("usr"));%>" ></td><td><input type="submit" name="b1"></td></tr>
            </table>
            
        </form>
    </body>
</html>
