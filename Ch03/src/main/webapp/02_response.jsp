<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>02_response</title>
	<!-- 
		response
		 - 클라이언트에서 서버로 요청한 결과를 응답해주는 객체
		 - 서버에서 클라이언트로 전송 객체
		 
		 redirect
		  - 서버에서 클라이언트로 다시 요청을 명령하는 response 기능
		  - 최종 요청주소가 반영 cf) forward는 최초 요청 주소가 반영
	 -->
</head>
	<body>
		<h3>02_response 내장 객체</h3>
		
		<a href="./proc/redirect1.jsp">리다이렉트 페이지 요청1</a>
		<a href="./proc/redirect2.jsp">리다이렉트 페이지 요청2</a>
		<a href="./proc/requestFile.jsp">파일 요청</a>
	</body>
</html>