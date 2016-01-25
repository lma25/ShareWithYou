package main;

import java.sql.ResultSet;

public class Search {
	public static ResultSet searchByItemName(String s){
		return DB.getFromDB("select itemId, itemName, rate, zipCode, ownerName, startDate, endDate from items where itemName like '%" + s + "%'");
	}
	public static ResultSet searchByItemId(String s){
		return DB.getFromDB("select * from items where itemId='" + s + "'");
	}
}
