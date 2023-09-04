<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리 v2</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <link rel="stylesheet" href="/Farmstory2/css/style.css"/>
    <link rel="stylesheet" href="/Farmstory2/user/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>    
    <script>
    	const success = ${success};
    	
    	if(success == 100){
    		alert('로그인에 실패 했습니다. 아이디, 비번을 다시 확인하시기 바랍니다.');
    	}else if(success == 101){
    		alert('로그인을 먼저 하셔야 합니다.');    		
    	}    
    
    
        $(function(){
            $('.slider > ul').bxSlider({
                slideWidth: 980,
                pager: false,
                controls: false,
                auto: true
            });

            $('#tabs').tabs();
        });
    </script>
</head>
<body>
    <div id="container">
        <header>
            <a href="/Farmstory2/index.do" class="logo"><img src="/Farmstory2/images/logo.png" alt=""/></a>
			<p>
			    <a href="/Farmstory2/index.do">HOME |</a>
	            <a href="/Farmstory2/user/login.do"">로그인 |</a>
	            <a href="/Farmstory2/user/terms.do">회원가입 |</a>
	            <a href="/Farmstory2/user/logout.do">로그아웃 |</a>
	            <a href="/Farmstory2/admin/index.do">관리자 |</a>
			    <a href="#">고객센터</a>
			</p>
            <img src="./images/head_txt_img.png" alt=""/>
            
            <ul class="gnb">
                <li><a href="/Farmstory2/introduction/hello.do">팜스토리소개</a></li>
                <li><a href="/Farmstory2/market/list.do"><img src="/Farmstory2/images/head_menu_badge.png" alt="30%"/>장보기</a></li>
                <li><a href="/Farmstory2/board/list.do?group=croptalk&cate=story">농작물이야기</a></li>
                <li><a href="/Farmstory2/board/list.do?group=event&cate=event">이벤트</a></li>
                <li><a href="/Farmstory2/board/list.do?group=community&cate=notice">커뮤니티</a></li>
            </ul>
        </header>