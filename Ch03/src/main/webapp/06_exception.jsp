<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>06_Exception</title>
	<!-- 
		날짜 : 2023/07/26
		이름 : 강원빈
		내용 : JSP exception 내장객체 실습하기
		
		exception
		 - JSP 예외가 발생했을 떄 예외를 처리하기위한 내장객체
		 - 간접적으로 exception 객체를 통해 에러코드별 에러 페이지 작성
		 
		 주요 응답코드
		  - 200: 요청성공
		  - 3--: 
		  - 500
		  - 404
	 -->
</head>
	<body>
	 	<h3>06_Exception</h3>
	 	
	 	<a href="./error/error404.jsp">404에러</a><br>
	 	<a href="./proc/exception.jsp">500에러</a>
	 	
	</body>
</html>