/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.codejava.javaee.usermanagement;

/**
 *
 * @author Om prakash
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
                    HttpSession session = request.getSession();
			String name = request.getParameter("user"); //requesting user data and save into name
			String password = request.getParameter("password");
			String dbName = null; //the field is empty for first time
			String dbPassword = null;
			//String sql ="select * from registration where name=? and password=?"; //sql query for login
                        String sql ="select * from books where name=? and password=?"; //sql query for login
			Class.forName("com.mysql.jdbc.Driver"); //connecting class to mysql
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseworkdb","root",""); //linking the data into mysql db
			PreparedStatement ps = conn.prepareStatement(sql);
                        //PreparedStatement ps1 = conn.prepareStatement(sql);
			ps.setString(1,name); //login page ma name set garna yo method call hunxa
			ps.setString(2, password);//login page ma name set garna yo method call hunxa
			ResultSet rs = ps.executeQuery();
			PrintWriter out = response.getWriter();//for print the data
			//check the username is correct or not 
			while(rs.next()) { //to matching the username and password
				dbName = rs.getString(2);//dbname lai db ko column 2 sanga compare gare ko xa
				dbPassword = rs.getString("password");//
			}
                    String admin;
			//when username and password is correct print 
			if(name.equals(dbName)&&password.equals(dbPassword)) {
				response.sendRedirect("clientdash.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("clientdash.jsp");
				rd.include(request, response);  
			}
                        else if(name.equals("admin") && password.equals("admin")){
                            session.setAttribute("cli", name);  
                            response.sendRedirect("admindash.jsp");
                            RequestDispatcher rdr = request.getRequestDispatcher("admindash.jsp");
                            rdr.include(request, response);
                
                            }
			//when username and password is incorrect relod same login page
			else {
				request.setAttribute("error", "Username & password is incorrect!!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
		        requestDispatcher.include(request, response);
				
			}
				
		} catch (ClassNotFoundException e) {	
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void destroy() {

	}
}