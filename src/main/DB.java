package main;

import java.sql.*;

public class DB {
	public static ResultSet getFromDB(String query){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sharewithyou", "root", "kjgl");
			Statement stmt = con.createStatement();
			return stmt.executeQuery(query);
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static void modifyFromDB(String query){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sharewithyou", "root", "kjgl");
			Statement stmt = con.createStatement();
			stmt.executeUpdate(query);
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
