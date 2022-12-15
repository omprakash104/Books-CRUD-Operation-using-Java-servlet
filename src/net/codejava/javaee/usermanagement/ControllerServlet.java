package net.codejava.javaee.usermanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * ControllerServlet.java
 * This servlet acts as a page controller for the application, handling all
 * requests from the user.
 * @author www.codejava.net
 */
@WebServlet("/")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO bookDAO;
        private static final String forgetsql = "select * from registration where name =? and Question =?  and Answer =?";
        private static final String resetpassSQL = "update registration set password =?  where  name =?";

        private String jdbcURL = "jdbc:mysql://localhost:3306/courseworkdb";
        private String jdbcUsername = "root";
        private String jdbcPassword = "";
        
	public void init() {
            
		bookDAO = new UserDAO(jdbcURL, jdbcUsername, jdbcPassword);

	}

        protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
                }
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertBook(request, response);
				break;
			case "/delete":
				deleteBook(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateBook(request, response);
				break;
                        case "/list":
                                listBook(request, response);
                                break;
                        case "/forgot":
                                forgetpassword(request,response);
                                break;
                        default:
                                response.sendRedirect("home.jsp");
                                break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listBook(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
            HttpSession session = request.getSession();
		List<User> listBook = bookDAO.listAllBooks();
		request.setAttribute("listBook", listBook);
		RequestDispatcher dispatcher = request.getRequestDispatcher("BookList.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            HttpSession session = request.getSession();
		RequestDispatcher dispatcher = request.getRequestDispatcher("BookForm.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
            HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		User existingBook = bookDAO.getBook(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("BookForm.jsp");
		request.setAttribute("book", existingBook);
                
		dispatcher.forward(request, response);

	}

	private void insertBook(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
            HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User newBook = new User(name, email, password);
		bookDAO.insertBook(newBook);
                session.setAttribute("usr", name);  
		response.sendRedirect("list");
	}

	private void updateBook(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
            HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User book = new User(id, name, email, password);
		bookDAO.updateBook(book);
                session.setAttribute("usr", name);  
		response.sendRedirect("list");
	}

	private void deleteBook(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
            HttpSession session = request.getSession();
		String name = request.getParameter("name");
                bookDAO.report(name);
		bookDAO.deleteBook(name);
                session.setAttribute("usr", name);  
		response.sendRedirect("list");

	}

        private void forgetpassword(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
         String name = request.getParameter("name");
         String ques = request.getParameter("ques");
         String ans = request.getParameter("ans");
         String dbUsername = null;
         String dbQuestion = null;
         String dbAnswer = null;
         HttpSession session = request.getSession();
          try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(forgetsql)) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, ques);
            preparedStatement.setString(3, ans);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
            dbUsername = rs.getString("name");
            dbQuestion  = rs.getString("Question");
            dbAnswer = rs.getString("Answer");
            }
            if(name.equals(dbUsername) && ques.equals(dbQuestion) && ans.equals(dbAnswer)){
            session.setAttribute("usr", name);    
            response.sendRedirect("changepassword.jsp");
            }
            else{
            RequestDispatcher dispatcher = request.getRequestDispatcher("Forgetpassword.jsp");
            dispatcher.forward(request, response);
        }
        } catch (SQLException e) {
            System.out.println(e);
        }
   }
        
        

}
