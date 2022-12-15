<%-- 
    Document   : clientdash
    Created on : Jun 6, 2020, 3:07:02 PM
    Author     : Om prakash
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
			<div id="userinfo">
			<h3>Sign in as </h3>
			</div>
			<div>
                                 <a href="logout.jsp"><button class="logoutbtn" ><span>Logout</span></button></a>
			</div>
<!--			<div class="viewpbtn">
				<a href="profile.jsp"><button class="viewprofilebtn"><span>View Profile</span></button></a>
			</div>-->
			<div class="dashmenu1">
				<a href=""><button class="dashmenubtn1">Dashboard</button></a>
				<a href="BookForm.jsp"><button class="logoutbtn"><span>Add user</span></button></a>
				<a href="report.jsp"><button class="logoutbtn"><span>Report</span></button></a>
				<a href="history.jsp"><button class="logoutbtn"><span>History</span></button></a>
				<a href="list"><button class="logoutbtn"><span>All user</span></button></a>
			        
			</div>

		</div>
		<div class="dashmain">
			<div>
			<h2 id="dashadmin"> Admin Dashboard</h2>
			</div>	
<!--                    for total user-->
                            <%
                                try{
                                String jdbcURL ="jdbc:mysql://localhost:3306/courseworkdb";
                                String jdbcUsername ="root";
                                String jdbcPassword ="";
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection connection =DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
                                if(!connection.isClosed()){
                                    PreparedStatement preparedStatement =connection.prepareStatement("select count(*) as USER_COUNT from books;");
                                    
                                    ResultSet rs =preparedStatement.executeQuery();
                                    
                                    if(rs.next()){
                                %>
                              <div class="userblocked">
				<div id="activeuser">Total user <br><a id="noofactiveuser"><h1><%=rs.getInt("USER_COUNT")%></h1></a></div>	
			
                                    <%
                                        }else{
                                          out.println("Record don't Exit");
                                            }
                                        }
                            }catch(Exception e){
                          out.println("The error is "+ e.getMessage());
                                }
                                        %>
                                        
                                        <!--                    for total Guest user-->
                            <%
                                try{
                                String jdbcURL ="jdbc:mysql://localhost:3306/courseworkdb";
                                String jdbcUsername ="root";
                                String jdbcPassword ="";
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection connection =DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
                                if(!connection.isClosed()){
                                    PreparedStatement preparedStatement =connection.prepareStatement("select count(*) as USER_COUNT from registration;");
                                    
                                    ResultSet rs =preparedStatement.executeQuery();
                                    
                                    if(rs.next()){
                                %>
                             
				<div id="blokeduser">Total Guest user <br><a id="noofactiveuser"><h1><%=rs.getInt("USER_COUNT")%></h1></a></div>	
			
                
                                    <%
                                        }else{
                                          out.println("Record don't Exit");
                                            }
                                        }
                            }catch(Exception e){
                          out.println("The error is "+ e.getMessage());
                                }
                                        %>
                                        
                                        
                                        
<!--                            for delete user list            -->
                                         <%
                                try{
                                String jdbcURL ="jdbc:mysql://localhost:3306/courseworkdb";
                                String jdbcUsername ="root";
                                String jdbcPassword ="";
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection connection =DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
                                if(!connection.isClosed()){
                                    PreparedStatement preparedStatement =connection.prepareStatement("select count(*) as USER_COUNT from report;");
                                    
                                    ResultSet rsd =preparedStatement.executeQuery();
                                    
                                    if(rsd.next()){
                                %>
                                
                                <div id="deleteuser">Deleted user<br><a id="noofdeleteuser"><h1><%=rsd.getInt("USER_COUNT")%></h1></a></div>	
                                </div>
                                    <%
                                        }else{
                                          out.println("Record don't Exit");
                                            }
                                        }
                            }catch(Exception e){
                          out.println("The error is "+ e.getMessage());
                                }
                                        %>	
			
		</div>
	</div>
</body>
<style type="text/css">
	table, th, td {  
  border: 1px solid black;  
  border-collapse: collapse;

}  
th, td {  
  padding-left:  50px;
  padding-right: 50px;
  padding-bottom:  10px;
  text-align: center;

}  
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
	margin-left: 55px;
}
.userblocked{
	float: left;
	height: 40px;
	width: 100%;
}
#activeuser{
	float: left;
	margin-left: 55px;
	background-color: #83F688;
	font-size: 20px;
	height: 50px;
	width: 150px;
	text-align: center;
}
#blockeduser{
	float: left;
	margin-left: 300px;
	background-color: #F88071;
	font-size: 20px;
	height: 50px;
	width: 150px;
	text-align: center;
}
#deleteuser{
	float: left;
	margin-left: 300px;
	background-color: #F5E84C;
	font-size: 20px;
	height: 50px;
	width: 150px;
	text-align: center;
}
.dashtable{
	height: 600px;
	width: 1050px;
	background-color: #A0F6C9;
	float: left;
	margin-top: 30px;
	margin-left: 55px;
	
}
#dashtableheader1{
	float: left;
	margin-left: 15px;
}

.forsearch {
  overflow: hidden;
 
  float: left;
  margin-left: 700px;
  margin-top: 10px;
}



.forsearch .search-container {
  float: right;
}

.forsearch input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
}

.forsearch .search-container button {
  float: right;
  padding: 6px 10px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.forsearch .search-container button:hover {
  background: #ccc;
}

@media screen and (max-width: 600px) {
  .forsearch .search-container {
    float: none;
  }
  .forsearch input[type=text], .topnav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .forsearch input[type=text] {
    border: 1px solid #ccc;  
  }


</style>
</html>
