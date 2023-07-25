<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>userProc</title>
</head>
	<body>
		<h3>사용자 데이터 수신</h3>
		<p>
			아이디 : <%= uid %>
			이름 : <%= name %>
			나이 : <%= age %>
		</p>
	</body>
	
	<a href="../01_request.jsp">뒤로가기</a>
	
</html>