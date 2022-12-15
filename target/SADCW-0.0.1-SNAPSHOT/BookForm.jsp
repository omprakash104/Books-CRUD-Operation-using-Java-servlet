<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Emart Web Application</title>
</head>
<body>
    <div>
		<div class="dashmenu">
			<div id="userinfo">
			</div>
			<div>
                            <a href="logout.jsp"><button class="logoutbtn"><span>Logout</span></button></a>
			</div>
			<div class="viewpbtn">
				<a href="profile.jsp"><button class="viewprofilebtn"><span>View Profile</span></button></a>
			</div>
			<div class="dashmenu1">
				<a href="admindash.jsp"><button class="logoutbtn">Dashboard</button></a>
				<a href="new"><button class="dashmenubtn1"><span>Add user</span></button></a>
				<a href="report.jsp"><button class="logoutbtn"><span>Report</span></button></a>
				<a href="history.jsp"><button class="logoutbtn"><span>History</span></button></a>
				<a href="list"><button class="logoutbtn"><span>All user</span></button></a>
				
			</div>

		</div>
		<div class="dashmain">
			<div>
			<h2 id="dashadmin"> Add New User</h2>
			</div>
      <div class="addusermain">
          <div class="contact-background">
    <div class="box-1">
  <center>
      <a href="home.jsp"><h1>User Management</h1></a>
        <h2>
        	
        	<a href="list">List All Users</a>
        	
        </h2>
	</center>
        	
    <div align="center">
		<c:if test="${book != null}">
			<form action="update" method="post">
        </c:if>
        <c:if test="${book == null}">
			<form action="insert" method="post">
        </c:if>
      <c:if test="${book != null}">
        			<input type="hidden" name="id" value="<c:out value='${book.id}' />" />
        		</c:if> 
  <div class="inputbox">
    <input type="text" name="name" id="first" required=""
                			value="<c:out value='${book.name}' />" autofocus="on" autocomplete="off">
    <label>Username</label>
    
  </div>
  <div class="inputbox">
    <input type="Email" name="email" id="second" value="<c:out value='${book.email}' />" required=""autofocus="on" autocomplete="off">
    <label>Email</label>
    
  </div>
  <div class="inputbox">
    <input type="password" name="password" id="second" value="<c:out value='${book.password}' />" required=""autofocus="on" autocomplete="off">
    <label>Confirm Password</label>
    
  </div>
  <center><input type="submit" name="" value="Add User"  id="submitfrom"></center>
</form>
  
</div>
</div>
                         </div>
			
			</div>
                </div>
    </div>	
</body>

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
.contact-background{

    margin-top: 60px;
    width: 400px;
    height: 235px;
    margin-left: 35%;
    border-radius: 15px;
    
  }
 .box-1{
  
  margin-top: 200px;
  margin-left: 50%; 
  transform: translate(-50%,-50%);
  width: 400px;
  padding: 40px;
  background: rgba(0,0,0,.8);
  box-sizing: border-box;
  box-shadow: 0   5px rgba(0,0,0,.5);
  border-radius: 15px;s
 }
 .box-1 h2{
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
 }
 .box-1 .inputbox{
  position: relative;

 }
 .box-1 .inputbox input{
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  letter-spacing: 1px;
  margin-bottom: 30px;
  border: none; 
  border-bottom: 1px solid #fff;
  outline: none;
  background: transparent;
 }
 .box-1 .inputbox textarea{
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  letter-spacing: 1px;
  margin-bottom: 30px;
  border: none; 
  border-bottom: 1px solid #fff;
  outline: none;
  background: transparent;
 }
.box-1 .inputbox label{
  position: absolute;
  top: 0;
  left: 0;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  pointer-events: none;
  transition: .5s;
}
.box-1 .inputbox input:focus ~ label,
.box-1 .inputbox input:valid ~ label
{
  top: -18px;
  left: 0;
  color: #03a9f4;
  font-size: 12px;

}
.box-1 .inputbox textarea:focus ~ label,
.box-1 .inputbox textarea:valid ~ label
{
  top: -18px;
  left: 0;
  color: #03a9f4;
  font-size: 12px;

}
.box-1 input[type="submit"]{
    background: transparent;
    border: none;
    outline: none;
    color: #fff;
    background: #03a9f4;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
}
#addusermain{
  background-image:  #A0F6C9;
}




</style>
</html>
