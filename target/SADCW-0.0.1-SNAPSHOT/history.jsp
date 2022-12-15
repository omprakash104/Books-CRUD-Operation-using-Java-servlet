<%-- 
    Document   : history
    Created on : Jun 10, 2020, 5:07:50 PM
    Author     : Om prakash
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Page</title>
        <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
    </head>
    <body>
     <header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: black">
			<div>
				<a href="<%=request.getContextPath()%>/" class="navbar-brand"> User
					Management App </a>
                                
			</div>
                        
			<ul class="navbar-nav">
                            <a href="<%=request.getContextPath()%>/admindash.jsp"
					class="nav-link">Dashboard</a>
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
                                 <a href="<%=request.getContextPath()%>/logout.jsp" class="nav-link">Logout</a>
			</ul>
		</nav>
                                        
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">History of All users</h3>
			<hr>
			<br>
			<table border="1" cellpadding="5">
                
             
                
                      
                      
                      
                      <table class="table table-bordered">
				<thead> 
					<tr>
						<th>Name</th>
						<th>Activity Date</th>
                                                <th>Activity</th>
					</tr>
				</thead>
                                <%
             try{
             
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseworkdb", "root", "");
                 Statement state = con.createStatement();
                 String sql = "select * from history";
                 
                 ResultSet rs = state.executeQuery(sql);
                 while (rs.next())
                 {
                  %>
                               
                                <tbody>
                                                <tr> 
                                                    <td><%=rs.getString("name")%></td>
                                                    <td><%=rs.getTimestamp("activity_date")%></td> 
                                                    <td><%=rs.getString("activity")%></td> 
                                                </tr>
				
				</tbody>

                        
                 
                 
                 <%
                 }
             }
             catch(Exception e){
                 
             
             }
             %>
             </table>
		</div>
	</div>
        
          
            
         
    </body>
</html>