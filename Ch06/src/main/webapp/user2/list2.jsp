<%@page import="vo2.User2Vo"%>
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

	List<User2Vo> users = new ArrayList<>();

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);  
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `user2`");

		while(rs.next()){
			User2Vo vo = new User2Vo();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setAge(rs.getString(4));
		
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
	<title>user2::list</title>
</head>
	<body>
		<h3>User2 목록</h3>
			<a href="/Ch06/01_JDBC.jsp">처음으로</a>
			<a href="/Ch06/user2/register2.jsp">User2 등록</a>
		<table border="1">
			<tr align="center">
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<% for(User2Vo vo : users){%> 
			<tr>
				<td align="center"><%= vo.getUid() %></td>
				<td align="center"><%= vo.getName() %></td>
				<td align="center"><%= vo.getHp() %></td>
				<td align="center"><%= vo.getAge() %></td>
				<td>
					<a href="/Ch06/user2/modify2.jsp?uid=<%= vo.getUid() %>">수정</a>
					<a href="/Ch06/user2/delete2.jsp?uid=<%= vo.getUid() %>">삭제</a>
				</td>
			</tr>
			<%}%>
		</table>
		
	</body>
</html>