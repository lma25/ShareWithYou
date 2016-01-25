package main;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RentItem
 */
@WebServlet("/RentItem")
public class RentItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RentItem() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemId = request.getParameter("itemId");
		String myUserName = (String)request.getSession().getAttribute("myUserName");
		String lessStartDate = request.getParameter("startDate");
		String lessEndDate = request.getParameter("endDate");
		ResultSet rs = DB.getFromDB("select lessStartDate, rate, ownerName from items where itemId='" + itemId + "'");
		ResultSet rsUsers = DB.getFromDB("select userId, money from users where userName='" + myUserName + "'");
		try {
			rs.next();
			rsUsers.next();
			rs.getString(1);
			Date start = Date.valueOf(lessStartDate);
			Date end = Date.valueOf(lessEndDate);
			int dif = (int)TimeUnit.DAYS.convert(end.getTime() - start.getTime(), TimeUnit.MILLISECONDS);
			int lesseeId = rsUsers.getInt(1);
			if(rs.getString(1) == null && dif * rs.getInt(2) <= rsUsers.getFloat(2)){
				String query = "update items set lesseeId='" + lesseeId + "', lesseeName='" + myUserName 
						+ "', lessStartDate='" + lessStartDate + "', lessEndDate='" + lessEndDate + "' "
						+ "where itemId='" + itemId + "'";
				DB.modifyFromDB(query);
				query = "update users set money='" + Float.toString(rsUsers.getFloat(2) - dif * rs.getInt(2)) + "' where userName='" + myUserName + "'";
				DB.modifyFromDB(query);
				ResultSet rsOwner = DB.getFromDB("select money from users where userName='" + rs.getString(3) + "'");
				rsOwner.next();
				float ownerMoney = rsOwner.getFloat(1)  + dif * rs.getInt(2);
				query = "update users set money='" + Float.toString(ownerMoney) + "' where userName='" + rs.getString(3) + "'";
				DB.modifyFromDB(query);
				getServletContext().getRequestDispatcher("/myprofile.jsp").forward(request, response);
			}else{
				String errorMessage = "";
				if(rs.getString(1) != null){
					errorMessage += "This item is not available at this time. ";
				}
				if(dif * rs.getInt(2) > rsUsers.getFloat(2)){
					errorMessage += "You don't have enough money.";
				}
				request.setAttribute("errorMessage", errorMessage);
				getServletContext().getRequestDispatcher("/item.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
