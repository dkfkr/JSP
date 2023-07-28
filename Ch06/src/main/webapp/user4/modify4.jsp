<%@page import="vo4.User4Vo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age   = request.getParameter("age");
	String addr  = request.getParameter("addr"); 
	
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "java";
	String pass = "1234";
	
	User4Vo vo = new User4Vo(); 
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM user4 WHERE name = ?");
		psmt.setString(2, name);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			vo.setName(rs.getString(2));
			vo.setGender(rs.getString(3));
			vo.setAge(rs.getString(4));
			vo.setAddr(rs.getString(5));		
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>user4::modify</title>
</head>
	<body>
		<h3>user4 수정</h3>
		<a href="/Ch06/01_JDBC.jsp">처음으로</a>
		<a href="/Ch06/user4/list4.jsp">User4 목록</a>
		
		<form action="/Ch06/user4/deleteProc4.jsp" method="post">
		 <table border="1">
			 	<tr>
			 		<td>이름</td>
			 		<td><input type="text" name="name"></td>
			 	</tr>
			 	<tr>
			 		<td>성별</td>
			 		<td>	
			 			<input type="radio" name="gender" value="">남
			 			<input type="radio" name="gender" value="">여
			 		</td>
			 	</tr>
			 	<tr>
			 		<td>나이</td>
			 		<td><input type="number" name="age"></td>
			 	</tr>
			 	<tr>
			 		<td>주소</td>
			 		<td><input type="text" name="addr"></td>
			 	</tr>
			 	<tr>
			 		<td colspan="2" align="right"><input type="submit" value="등록"></td>
			 	</tr>
			</table>
		</form>		
	</body>
</html>