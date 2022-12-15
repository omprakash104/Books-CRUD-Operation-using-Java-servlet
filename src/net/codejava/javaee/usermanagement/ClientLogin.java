/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.codejava.javaee.usermanagement;

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
 *
 * @author Om prakash
 */
@WebServlet("/ClientLogin")
public class ClientLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ClientLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClientLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
                        HttpSession session = request.getSession();
			String name = request.getParameter("user"); //requesting user data and save into name
			String password = request.getParameter("password");
			String dbName = null; //the field is empty for first time
			String dbPassword = null;
			String sql ="select * from registration where name=? and password=?"; //sql query for login
                        
			Class.forName("com.mysql.jdbc.Driver"); //connecting class to mysql
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseworkdb","root",""); //linking the data into mysql db
			PreparedStatement ps = conn.prepareStatement(sql);
                        
			ps.setString(1,name); //login page ma name set garna yo method call hunxa
			ps.setString(2, password);//login page ma name set garna yo method call hunxa
			ResultSet rs = ps.executeQuery();
			PrintWriter out = response.getWriter();//for print the data
			//check the username is correct or not 
			while(rs.next()) { //to matching the username and password
				dbName = rs.getString(2);//dbname lai db ko column 2 sanga compare gare ko xa
				dbPassword = rs.getString("password");//
			}
			//when username and password is correct print 
			if(name.equals(dbName)&&password.equals(dbPassword)) {
                                session.setAttribute("cli", name);  
				response.sendRedirect("guestdash.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("guestdash.jsp");
				rd.include(request, response);  
			}
                        
			//when username and password is incorrect relod same login page
			else {
				request.setAttribute("error", "Username & password is incorrect!!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("clientlogin.jsp");
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
