package main;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReturnItem
 */
@WebServlet("/ReturnItem")
public class ReturnItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemId = request.getParameter("itemId");
		String query = "select rate, ownerName, lesseeName, lessStartDate, lessEndDate from items where itemId='" + itemId +"'";
		ResultSet rs = DB.getFromDB(query);
		try {
			rs.next();
			Date start = rs.getDate(4);
			Date end = rs.getDate(5);
			query = "select money from users where userName='" + rs.getString(3) + "'";
			ResultSet rsUser = DB.getFromDB(query);
			rsUser.next();
			query = "select money from users where userName='" + rs.getString(2) + "'";
			ResultSet rsOwner = DB.getFromDB(query);
			rsOwner.next();
			Date today = new Date();
			today = today.getTime() > start.getTime() ? today : start;
			int dif = (int)TimeUnit.DAYS.convert(end.getTime() - today.getTime(), TimeUnit.MILLISECONDS);
			query = "update items set lesseeId=null, lesseeName=null, lessStartDate=null, lessEndDate=null where itemId='" + itemId + "'";
			DB.modifyFromDB(query);
			query = "update users set money='" + Float.toString(rsOwner.getFloat(1) - rs.getInt(1) * dif) + "' where userName='" + rs.getString(2) + "'";
			DB.modifyFromDB(query);
			query = "update users set money='" + Float.toString(rsUser.getFloat(1) + rs.getInt(1) * dif) + "' where userName='" + rs.getString(3) + "'";
			DB.modifyFromDB(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/myprofile.jsp").forward(request, response);
	}

}
