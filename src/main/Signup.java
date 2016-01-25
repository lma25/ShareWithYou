package main;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import check.ValidCheck;
import check.ValidCheckResult;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("userName") == null || request.getParameter("password") == null
				|| request.getParameter("confirmPassword") == null){
			getServletContext().getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}
		String userName = request.getParameter("userName");
		request.setAttribute("userName", userName);
		String firstName = request.getParameter("firstName");
		request.setAttribute("firstName", firstName);
		String lastName = request.getParameter("lastName");
		request.setAttribute("lastName", lastName);
		
		ValidCheckResult valid;
		valid = ValidCheck.isValidUserName(userName);
		if(valid.getIsValid() == false){
			request.setAttribute("errorMessage", valid.getErrorMessage());
			request.setAttribute("userName", null);
			getServletContext().getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}
		
		String password = request.getParameter("password");
		valid = ValidCheck.isValidPassword(password);
		if(valid.getIsValid() == false){
			request.setAttribute("errorMessage", valid.getErrorMessage());
			getServletContext().getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}
		
		String confirmPassword = request.getParameter("confirmPassword");
		if(!confirmPassword.equals(password)){
			request.setAttribute("errorMessage", "Passwords are not same.");
			getServletContext().getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}
		
		ResultSet rs = DB.getFromDB("select password from users where userName = '" + userName + "'");
		
		try {
			if(!rs.next()){
				DB.modifyFromDB("insert into users (userName, password, firstName, lastName, money) values ('" + userName + "', '"
						+ password + "', '" + firstName + "', '" + lastName + "', '" + "0" + "')");
				request.getSession().setAttribute("myUserName", userName);
				getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
				return;
			}else{
				request.setAttribute("errorMessage", "The UserName has been used.");
				getServletContext().getRequestDispatcher("/signup.jsp").forward(request, response);
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
