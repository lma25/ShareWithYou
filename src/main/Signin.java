package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

import check.ValidCheck;
import check.ValidCheckResult;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Signin")
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signin() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("userName") == null || request.getParameter("password") == null){
			getServletContext().getRequestDispatcher("/signin.jsp").forward(request, response);
			return;
		}
		ValidCheckResult valid;
		String userName = request.getParameter("userName");
		valid = ValidCheck.isValidUserName(userName);
		if(valid.getIsValid() == false){
			request.setAttribute("errorMessage", valid.getErrorMessage());
			getServletContext().getRequestDispatcher("/signin.jsp").forward(request, response);
			return;
		}
		
		String password = request.getParameter("password");
		valid = ValidCheck.isValidPassword(password);
		if(valid.getIsValid() == false){
			request.setAttribute("errorMessage", valid.getErrorMessage());
			request.setAttribute("userName", userName);
			getServletContext().getRequestDispatcher("/signin.jsp").forward(request, response);
			return;
		}
		
		ResultSet rs = DB.getFromDB("select password from users where userName = '" + userName + "'");
		
		try {
			if(!rs.next()){
				request.setAttribute("errorMessage", "No such UserName.");
				request.setAttribute("userName", userName);
				getServletContext().getRequestDispatcher("/signin.jsp").forward(request, response);
				return;
			}else if(!rs.getString(1).equals(password)){
				request.setAttribute("errorMessage", "Password doesn't match.");
				request.setAttribute("userName", userName);
				getServletContext().getRequestDispatcher("/signin.jsp").forward(request, response);
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().setAttribute("myUserName", userName);
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
