<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page info="copyright chhak.click" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>05_Directive</title>
	<!-- 
		날짜 : 2023/07/25
		이름 : 강원빈
		내용 : JSP 지시자 실습하기
		
		지시자
		 - JSP 페이지에 추가적인 정보를 설정하는 스크립트 문법
		 - 스크립트릿, 표현식과 함께 JSP기본 구성요소 
		 - page, include, taglib 지시자 등이 있다.
	 -->
</head>
	<body>
		<h3>지시자</h3>
		
		<h4>page</h4>
		<p>
			page copyright : <%= getServletInfo() %>
		</p>
		
		<h4>include</h4> 
		<%@ include file="./inc/_header.html" %>
		<%@ include file="./inc/_footer.html" %>
		
		
	</body>
</html>