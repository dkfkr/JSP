<%@page import="vo4.User4Vo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "java";
	String pass = "1234";	

	List<User4Vo> users = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);  
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `user4` where name = ?");
	
		while(rs.next()){
			User4Vo vo = new User4Vo();
			vo.setName(rs.getString(1));
			
			users.add(vo);
		}
		
		rs.close();
		stmt.close();
		conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>user4::delete</title>
</head>
	<body>
		<h3>user4 삭제</h3>
		<a href="/Ch06/01_JDBC.jsp">처음으로</a>
		<a href="/Ch06/user4/list4.jsp">User4 삭제</a>
		
		<form action="/Ch06/user4/deleteProc4.jsp" method="post">
		 <table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=  %>"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="gender" value="<%=  %>"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" value="<%=  %>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=  %>"></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="삭제"></td>
			</tr>
		 </table>
		</form>		
	</body>
</html>