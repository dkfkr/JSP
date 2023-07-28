<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>cookieConfirm</title>
</head>
	<body>
		<h3>쿠키확인</h3>
		<%
			Cookie[] cookies = request.getCookies();
			
			for( Cookie cookie : cookies) {
		%>
			<p>
				쿠키 명 : <%= cookie.getName() %><br>
				쿠키 값 : <%= cookie.getValue() %><br>
			</p>
		<%		
				
				
			}
		%>
	</body>
</html>