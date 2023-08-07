<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.vo.ArticleVO"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String file = request.getParameter("file");
	String writer = request.getParameter("writer");
	String regip = request.getRemoteAddr();
	
	ArticleVO vo = new ArticleVO();
	
	vo.setTitle(title);
	vo.setContent(content);
	vo.setWriter(writer);
	vo.setRegip(regip);

	ArticleDAO dao= new ArticleDAO();
	dao.insertArticle(vo);
	
	response.sendRedirect("/Jboard1/list.jsp");
%>
