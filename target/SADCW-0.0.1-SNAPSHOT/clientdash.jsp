<%-- 
    Document   : clientdash
    Created on : Jun 6, 2020, 3:07:02 PM
    Author     : Om prakash
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
	<div>
		<div class="dashmenu">
                                       <h1>Client DashBoard</h1>
			<div id="userinfo">
			<h1>Welcome! <%out.println(session.getAttribute("cli"));
                            if(session.getAttribute("usr")==null)
                             {
                              response.sendRedirect("clientlogin.jsp");
                                }
                             %></h1>
			</div>
			<div>
                                 <a href="logout.jsp"><button class="logoutbtn" ><span>Logout</span></button></a>
			</div>
<!--			<div class="viewpbtn">
				<a href="profile.jsp"><button class="viewprofilebtn"><span>View Profile</span></button></a>
			</div>-->
                </div>
        </div>
			
</body>
</html>
