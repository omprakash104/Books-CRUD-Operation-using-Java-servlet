/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.codejava.javaee.usermanagement;
 import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.sql.SQLException;
/**
 *
 * @author Om prakash
 */
public class RegisterDAO {
    public int registerUser(userregister user) throws ClassNotFoundException, SQLException{
        String INSERT_USERS_SQL = "INSERT INTO registration" +
            "  (name, password, conpass, Question, Answer) VALUES " +
            " (?, ?, ?, ?, ?);";
 int result = 0;
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/courseworkdb", "root", "");
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            
            preparedStatement.setString(2, user.getPassword());
           preparedStatement.setString(3, user.getConpass());
            preparedStatement.setString(4, user.getQues());
            preparedStatement.setString(5, user.getAns());
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}