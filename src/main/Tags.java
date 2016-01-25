package main;

public class Tags {
	public static String getUserNameTag(String myUserName){
		StringBuilder sb = new StringBuilder();
		if(myUserName == null){
			sb.append("<li><a href='/ShareWithYou/signup.jsp'>Sign up</a></li>");
			sb.append("<li><a href='/ShareWithYou/signin.jsp'>Sign in</a></li>");
		}else{
			sb.append("<li><a href='/ShareWithYou/myprofile.jsp'>" + myUserName + "</a></li>");
			sb.append("<li><a href='itempost.jsp'>Post</a></li>");
			sb.append("<li><a href='logout.jsp'>Logout</a></li>");
		}
		return sb.toString();
	}
}
