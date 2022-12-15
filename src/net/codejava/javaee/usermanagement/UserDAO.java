package net.codejava.javaee.usermanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

/**
 * AbstractDAO.java
 * This DAO class provides CRUD database operations for the table book
 * in the database.
 * @author www.codejava.net
 *
 */
public class UserDAO {

    static User findByEmail(String email) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    static void update(User customer) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	private Connection jdbcConnection;
	
	public UserDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		 this.jdbcURL = "jdbc:mysql://localhost:3306/courseworkdb";
        this.jdbcUsername = "root";
        this.jdbcPassword = "";
	}
	
	protected void connect() throws SQLException {
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}
			jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}
	}
	
        
	protected void disconnect() throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}
	
	public boolean insertBook(User book) throws SQLException {
		String sql = "INSERT INTO books (name, email, password) VALUES (?, ?, ?)";
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, book.getName());
		statement.setString(2, book.getEmail());
		statement.setString(3, book.getPassword());
		
		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowInserted;
	}

	public List<User> listAllBooks() throws SQLException {
		List<User> listBook = new ArrayList<>();
		
		String sql = "SELECT * FROM books";
		
		connect();
		
		Statement statement = jdbcConnection.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);
		
		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			String name = resultSet.getString("name");
			String email = resultSet.getString("email");
			String password = resultSet.getString("password");
			
			User book = new User(id, name, email, password);
			listBook.add(book);
		}
		
		resultSet.close();
		statement.close();
		
		disconnect();
		
		return listBook;
	}
	
	public boolean deleteBook(String name) throws SQLException {
		String sql = "DELETE FROM books where name = ?";
		
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, name);
		
		boolean rowDeleted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowDeleted;		
	}
	
	public boolean updateBook(User book) throws SQLException {
		String sql = "UPDATE books SET name = ?, email = ?, password = ?";
		sql += " WHERE id = ?";
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, book.getName());
		statement.setString(2, book.getEmail());
		statement.setString(3, book.getPassword());
		statement.setInt(4, book.getId());
		
		boolean rowUpdated = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowUpdated;		
	}
	
	public User getBook(int id) throws SQLException {
		User book = null;
		String sql = "SELECT * FROM books WHERE id = ?";
		
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, id);
		
		ResultSet resultSet = statement.executeQuery();
		
		if (resultSet.next()) {
			String name = resultSet.getString("name");
			String email = resultSet.getString("email");
			String password = resultSet.getString("password");
			
			book = new User(id, name, email, password);
		}
		
		resultSet.close();
		statement.close();
		
		return book;
	}
        public void report(String name)
            throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
            try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/courseworkdb", "root", "");
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("insert into report" + 
                                                        "(name, user_deleted_date) values" +"(?,now());");) {
			preparedStatement.setString(1, name);
                        preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// process sql exception
			e.printStackTrace();
		}             
         catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

	}
        
