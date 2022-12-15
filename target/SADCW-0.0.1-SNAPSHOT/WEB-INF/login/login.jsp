<%-- 
    Document   : login
    Created on : Jun 7, 2020, 8:39:47 AM
    Author     : Om prakash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="regbox box">
                <img class="avatar" src="img/collaboration.png">
                <h1>
Login</h1>
<form action="Login" method="post">
                   <p>
Username</p>
<input type="text" placeholder="Username" name="user" required>
                   <p>
Password</p>
<input type="text" placeholder="Password" name="password" required>
                   <input type="submit" value="LOGIN">
                   <i><a href="login.jsp">Forgot Password?</a></i><br>
                   <br>
                <i><a href="registration.jsp">if you are not registered!!</a></i>
                </form>
</div>
</div>
</body>
</html>