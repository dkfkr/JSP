<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인코딩
	request.setCharacterEncoding("UTF-8");
	
	// 데이터 수신
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	
	//데이터 베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "java";
	String pass = "1234";

	try {
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn = DriverManager.getConnection(host, user, pass);
	    PreparedStatement psmt = conn.prepareStatement("UPDATE `user4` SET gender = ?, age = ?, addr = ? WHERE name = ?");
	    psmt.setString(1, gender);
	    psmt.setString(2, age);
	    psmt.setString(3, addr);
	    psmt.setString(4, name);

	    psmt.executeUpdate();

	    psmt.close();
	    conn.close();

	} catch (Exception e) {
	    e.printStackTrace();
	}

	
	response.sendRedirect("/Ch06/user4/list4.jsp");
%>