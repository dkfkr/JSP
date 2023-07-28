<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo4.User4Vo"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
	
  	String name = request.getParameter("name");
  	 String genderValue = request.getParameter("gender");
  	  if (genderValue != null) {
  	    if (genderValue.equals("0")) {

  	    } else if (genderValue.equals("1")) {

  	    }
  	  }
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "java";
	String pass = "1234";
		
	List<User4Vo> vo = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		PreparedStatement psmt = conn.prepareStatement("insert into `user4` (name, gender, age, addr) values (?,?,?,?)");
		psmt.setString(1, name);
		psmt.setString(2, genderValue);
		psmt.setString(3, age);
		psmt.setString(4, addr);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/Ch06/user4/list4.jsp");
%>
