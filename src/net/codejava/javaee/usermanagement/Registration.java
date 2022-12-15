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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Om prakash
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
private static final long serialVersionUID = 1L;
private RegisterDAO registerDAO;


    

    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(){
       registerDAO = new RegisterDAO();
    }
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                String conpass = request.getParameter("conpass");
                String ques = request.getParameter("ques");
                String ans = request.getParameter("ans");
                
                userregister user =new userregister();
                user.setName(name);
                user.setPassword(password);
                user.setConpass(conpass);
                user.setQues(ques);
                user.setAns(ans);
                
                String activity = request.getParameter("register");
                
                Class.forName("com.mysql.jdbc.Driver");
                try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseworkdb", "root", "");
                        // Step 2:Create a statement using connection object
                        
                        PreparedStatement preparedStatement = connection
                                .prepareStatement("insert into history" +
                                        "(name, activity_date, activity) values" +"(?,?,?);");) {
                    java.sql.Timestamp historyTimestamp = new java.sql.Timestamp(new java.util.Date().getTime());
                    preparedStatement.setString(1, name);
                    preparedStatement.setTimestamp(2, historyTimestamp);
                    preparedStatement.setString(3, activity);
                    preparedStatement.executeUpdate();
                   
                } catch (SQLException e) {
                    // process sql exception
                    e.printStackTrace();
                }
                try {
                    registerDAO.registerUser(user);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            } catch (ClassNotFoundException ex) {
			Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
		}  
             response.sendRedirect("login.jsp");
    }
    
    public void destroy() {

	}

}
