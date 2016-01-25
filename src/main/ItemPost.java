package main;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



/**
 * Servlet implementation class ItemPost
 */
@WebServlet("/ItemPost")
public class ItemPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemPost() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String myUserName = (String)request.getSession().getAttribute("myUserName");
		String itemName = request.getParameter("itemName");
		request.setAttribute("itemName", itemName);
		String rate = request.getParameter("rate");
		request.setAttribute("rate", rate);
		String street = request.getParameter("street");
		request.setAttribute("street", street);
		String city = request.getParameter("city");
		request.setAttribute("city", city);
		String state = request.getParameter("state");
		request.setAttribute("state", state);
		String zipCode = request.getParameter("zipCode");
		request.setAttribute("zipCode", zipCode);
		String startDate = request.getParameter("startDate");
		request.setAttribute("startDate", startDate);
		String endDate = request.getParameter("endDate");
		request.setAttribute("endDate", endDate);
		if(myUserName == null){
			getServletContext().getRequestDispatcher("/signin.jsp").forward(request, response);
			return;
		}
		if(itemName == null){
			getServletContext().getRequestDispatcher("/itempost.jsp").forward(request, response);
			return;
		}
		ResultSet rs = DB.getFromDB("select userId from users where userName = '" + myUserName + "'");
		int ownerId = 0;
		try {
			if(rs.next()){
				ownerId = rs.getInt(1);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		StringBuilder tag = new StringBuilder("(itemName, ownerId, ownerName, rate");
		StringBuilder val = new StringBuilder("('" + itemName + "', '" + ownerId + "', '" + myUserName + "', '" + rate + "'");
		if(street != null && !street.equals("")){
			tag.append(", street");
			val.append(", '" + street + "'");
		}
		if(city != null && !city.equals("")){
			tag.append(", city");
			val.append(", '" + city + "'");
		}
		if(state != null && !state.equals("")){
			tag.append(", state");
			val.append(", '" + state + "'");
		}
		if(zipCode != null && !zipCode.equals("")){
			tag.append(", zipCode");
			val.append(", '" + zipCode + "'");
		}
		if(startDate != null && !startDate.equals("")){
			tag.append(", startDate");
			val.append(", '" + startDate + "'");
		}
		if(endDate != null && !endDate.equals("")){
			tag.append(", endDate");
			val.append(", '" + endDate + "'");
		}
		tag.append(")");
		val.append(")");
		String query = "insert into items " + tag.toString() + " values " + val.toString();
		DB.modifyFromDB(query);
		getServletContext().getRequestDispatcher("/myprofile.jsp").forward(request, response);
	}

}
