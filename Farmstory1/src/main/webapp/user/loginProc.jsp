<%@page import="kr.Farmstory1.dao.UserDAO"%>
<%@page import="kr.Farmstory1.dto.UserDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String uid  = request.getParameter("uid");
String pass = request.getParameter("pass");

UserDAO dao = UserDAO.getInstance();
UserDTO user = dao.selectUser(uid, pass);

if(user != null){
	session.setAttribute("sessUser", user);
	response.sendRedirect("/Farmstory1");
}else{
	response.sendRedirect("/Farmstory1");		
}
%>