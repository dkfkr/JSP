<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="./css/style.css">    
    <script src="/Farmstory2/admin/js/popup.js"></script>
</head>

<body>
    <div id="container">
        <header>
            <a href="${ctxPath}/index.do" class="logo"><img src="./images/admin_logo.jpg" alt="로고"/></a>
            <p>
                <a href="${ctxPath}/admin/index.do">HOME |</a>
                <a href="${ctxPath}/user/logout.do">로그아웃 |</a>
                <a href="#">고객센터</a>
            </p>
        </header>