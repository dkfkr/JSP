<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>forward2</title>
</head>
	<body>
		<h3>forward2 페이지</h3>
		<%
			// forward는 서버 내 자원에서 제어권 이동이기 떄문에 타 서버 자원인 네이버는 이동 불가
			pageContext.forward("http://naver.com");
		%>
	</body>
</html>