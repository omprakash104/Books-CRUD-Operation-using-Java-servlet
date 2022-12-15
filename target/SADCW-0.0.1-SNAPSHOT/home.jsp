<%-- 
    Document   : home
    Created on : Jun 10, 2020, 4:18:14 PM
    Author     : Om prakash
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body class="w3-black">
<div class="name">
    <h1 class="w3-jumbo w3-text-white w3-wide"><b>Emart WEB App</b></h1>
  </div>
<div class="dashmenu">
    <center>
			<div class="dashmenu1">
				<a href="login.jsp"><button class="dashmenubtn1">Admin or Client Login</button></a>
				<a href="clientlogin.jsp"><button class="logoutbtn"><span>Guest</span></button></a>
			</div>
    </center>
	
</div>

</body>
<style type="text/css">
    .name{
        
        float: center;
        height: 150px;
        width: auto;
        
    }
	.dashmenu{
		float: center;
		height: 550px;
		width: 100%;
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
  font-weight: 900;
  font-size: 30px;
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

.dashmenubtn1{
  background-color: #182573;
  border: none;
  color: white;
  padding: 10px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 30px;
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
	margin-left: 55px;
}
</style>
</html>