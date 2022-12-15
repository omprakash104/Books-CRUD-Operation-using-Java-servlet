<%-- 
    Document   : forgot
    Created on : Jun 8, 2020, 7:40:08 AM
    Author     : Om prakash
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Reset Password</title>
    <link rel="stylesheet" href="/css/style.css" >
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>
<h1>Forgot Password</h1>
<form action="forgot" method="post">  
    <table>
        <tr><td>UserName:-</td><td><input type="text" name="name"></td></tr>
        <tr><td>Security Question:-</td><td><select name="ques">
                    <% 
                        try{
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseworkdb","root","");
                   Statement smt=con.createStatement();
                   String s1="select * from question";
                   ResultSet rs=smt.executeQuery(s1);
                   while(rs.next()){
                       %>
                       <option><% out.println(rs.getString(2));%></option>
                    <%
                   }
                        }
                        catch(Exception e){
                        out.println(e);
                        }
                    %>             
                </select></td></tr>
        <tr><td>Answer:-</td><td><input type="text" name="ans"></td></tr>
        <tr><td><input type="submit" value="send"></td></tr>
    </table>
</form>  
</body>
</html>