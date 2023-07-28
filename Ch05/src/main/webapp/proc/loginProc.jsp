<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인코딩 설정
	request.setCharacterEncoding("UTF-8");
	// 전송 데이터 수신
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");
	
	//회원여부 확인
	if(pw.equals("1234")) {
		//회원일 경우 -> 세션 기록
		
		//자동로그인 체크박스 체크한경우
		if(auto != null){
			Cookie autocookie = new Cookie("cid", id);
			autocookie.setMaxAge(60);
			response.addCookie(autocookie);
		}
		
		session.setAttribute("sessid", id);
		response.sendRedirect("./loginSuccess.jsp");
	}else {
		// 회원이 아닐경우
		response.sendRedirect("./loginForm.jsp");
	}
%>