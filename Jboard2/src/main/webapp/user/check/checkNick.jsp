<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard2.dao.UserDAO"%>
<%
	// 데이터 수신
	request.setCharacterEncoding("UTF-8");
	String nick = request.getParameter("nick");
	
	// DB 조회
	int result = UserDAO.getInstance().selectCountNick(nick);
	
	// Json 생성
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	// Json 출력
	String jsonData = json.toString();
	out.print(jsonData);
%>