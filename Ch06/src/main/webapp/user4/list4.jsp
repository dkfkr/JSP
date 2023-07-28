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
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);  
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `user4`");
	
		while (rs.next()) {
			User4Vo vo = new User4Vo();
			vo.setName(rs.getString(2));
			vo.setGender(rs.getString(3));
			vo.setAge(rs.getString(4));
			vo.setAddr(rs.getString(5));
			
			users.add(vo);
		}
		
		rs.close();
		stmt.close();
		conn.close();
	
	} catch (Exception e) {
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user4::list4</title>
</head>
<body>
	<h3>User4 목록</h3>
	<a href="/Ch06/01_JDBC.jsp">처음으로</a>
	<a href="/Ch06/user4/register4.jsp">User4 등록</a>
	
	<table border="1">
		<tr align="center">
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		<% for (User4Vo vo : users) { %>
		<tr>
			<td align="center"><%= vo.getName() %></td>
			<td align="center"><%= vo.getGender() %></td>
			<td align="center"><%= vo.getAge() %></td>
			<td align="center"><%= vo.getAddr() %></td>
			<td>
				<a href="/Ch06/user4/modify4.jsp?name=<%= vo.getName() %>">수정</a>
				<a href="/Ch06/user4/delete4.jsp?name=<%= vo.getName() %>">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>
