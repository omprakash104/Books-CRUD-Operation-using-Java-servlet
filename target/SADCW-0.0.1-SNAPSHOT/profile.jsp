<%-- 
    Document   : profile
    Created on : Jun 7, 2020, 8:23:22 PM
    Author     : Om prakash
--%>

<%@page import="net.codejava.javaee.usermanagement.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
    </head>
    <body>
       <div>
		<div class="dashmenu">
			<div id="userinfo">
			<h3></h3>
			</div>
			
                        <div>
                            <a href="logout.jsp"><button class="logoutbtn"><span>Logout</span></button></a>
			</div>
			<div class="viewpbtn">
				<a href="profile.jsp"><button class="viewprofilebtn"><span>View Profile</span></button></a>
			</div>
			<div class="dashmenu1">
				<a href="clientdash.jsp"><button class="logoutbtn">Dashboard</button></a>
			</div>
			

		</div>
    <div class="myprofile">
    <h2 style="text-align:center">My Profile</h2>

<div class="card">
  
  <div>
                            <h1>Welcome! <%out.println(session.getAttribute("usr"));
                           
//                            if(session.getAttribute("usr")==null)
//                             {
//                              response.sendRedirect("login.jsp");
//                                }
                           
                           %> </h1>
                        </div>
</div>
</div>
       </div>
    </body>
    </style>
<style type="text/css">
	
	.dashmenu{
		float: left;
		height: 700px;
		width: 200px;
		background-image: linear-gradient(to top, #d9afd9 0%, #97d9e1 100%);
		padding: 20px;
	}
	#userinfo{
		text-align: center;
	}

	.logoutbtn {
  border: none;
  display: block;
  text-align: center;
  cursor: pointer;
  outline: none;
  overflow: hidden;
  position: relative;
  color: #fff;
  font-weight: 700;
  font-size: 15px;
  background-color: black;
  padding: 10px 30px;
  margin: 0 auto;
  box-shadow: 0 5px 15px rgba(0,0,0,0.20);
  border-radius: 5px;
  margin-top: 6px;
}

.logoutbtn span {
  position: relative; 
  z-index: 1;
}

.logoutbtn:after {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  height: 490%;
  width: 140%;
  background: #182573;
  -webkit-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
  -webkit-transform: translateX(-98%) translateY(-25%) rotate(45deg);
  transform: translateX(-98%) translateY(-25%) rotate(45deg);

}

.logoutbtn:hover:after {
  -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
  transform: translateX(-9%) translateY(-25%) rotate(45deg);
}
.viewpbtn{
	padding: 5px;
  text-align: center;
}
.viewprofilebtn {
  border: none;
  display: block;
  text-align: center;
  cursor: pointer;
  outline: none;
  overflow: hidden;
  position: relative;
  color: #fff;
  font-weight: 700;
  font-size: 15px;
  background-color: black;
  padding: 10px 30px;
  margin: 0 auto;
  box-shadow: 0 5px 15px rgba(0,0,0,0.20);
  border-radius: 5px;
}

.viewprofilebtn span {
  position: relative; 
  z-index: 1;
}

.viewprofilebtn:after {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  height: 490%;
  width: 140%;
  background: #182573;
  -webkit-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
  -webkit-transform: translateX(-98%) translateY(-25%) rotate(45deg);
  transform: translateX(-98%) translateY(-25%) rotate(45deg);
}

.viewprofilebtn:hover:after {
  -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
  transform: translateX(-9%) translateY(-25%) rotate(45deg);
}
.dashmenubtn1{
  background-color: #182573;
  border: none;
  color: white;
  padding: 10px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  margin: 4px 2px;
  cursor: pointer;
  font-weight: 700;
  border-radius: 5px;

}
.dashmenu1{
	text-align: center;
	margin-top: 40px;
}
.dashmain{
	padding: 5px;
	width: 1200px;
	height: 800px;
	float: left;
}
#dashadmin{
	/*float: left;*/
	padding: 5px;
	margin-left: 555px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
}
.myprofile{
  margin-left: 28%;
  float: left;
  margin-top: 150px;
}

button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
}
</style>
</html>
