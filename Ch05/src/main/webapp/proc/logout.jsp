<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션해제
	session.invalidate();

	//쿠키해제
	Cookie cookie = new Cookie("cid", null);
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	
	response.sendRedirect("./loginForm.jsp");
	
	

%>