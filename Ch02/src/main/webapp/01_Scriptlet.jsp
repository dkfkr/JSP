<%@page import="java.util.concurrent.CountDownLatch"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>01_Scriptlet</title>
	<%--
		날짜 : 2023 07 24
		이름 : 강원빈 
		내용 : JSP 기본문법 실습하기
		
		스크립트릿
		 - 정적문서에 프로그래밍 코드를 기술하기 위한 코드영역
		 - 동적문서 스크립트릿읗 실행해서 정적문서로 변환
		 
		표현식
		 - 변수 값을 출력하는 스크립트
		 - 건던헌 값, 식 결과를 출력
	 --%>
</head>
	<body>
	<h3>01_Scriptlet</h3>
	
	<h4>Scriptlet</h4>
	<%
		//스크립트릿 (자바 프로그래밍 영역)
		int     var1 = 1;
		boolean var2 = true;
		double  var3 = 3.14;
		String  var4 = "Hello";
		
		out.println("<p>var1 : " + var1 + "</P>");
		out.println("<p>var2 : " + var2 + "</P>");
	%>
	
	<h4>Expression</h4>
	<p>var3 : <%= var3 %></p>
	<p>var4 : <%= var4 %></p>
	
	
	</body>
</html>