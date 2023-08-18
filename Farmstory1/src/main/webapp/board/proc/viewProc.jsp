<%@page import="kr.Farmstory1.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.Farmstory1.dto.ArticleDTO"%>
<%@page import="kr.Farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String cate = request.getParameter("cate");
	String group = request.getParameter("group");
	String success = request.getParameter("success");
	UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");
	
	//로그인 여부 확인
		if (sessUser == null) {
			response.sendRedirect("/Farmstory1/index.jsp?success=101&group="+group+"&cate="+cate);
			return;
		}
	
	ArticleDAO dao = new ArticleDAO();
	
	ArticleDTO dto = dao.selectArticle(no, cate);
	
	// 댓글 조회
	List<ArticleDTO> comments = dao.selectComments(no);
%>