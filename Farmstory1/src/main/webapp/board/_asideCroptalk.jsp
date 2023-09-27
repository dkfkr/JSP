<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<div id="sub">
    <div><img src="../images/sub_top_tit3.png" alt="CROP TALK"></div>
    <section class="croptalk">
        <aside>
            <img src="../images/sub_aside_cate3_tit.png" alt="농작물이야기"/>

            <ul class="lnb">
                <li class="${cate eq 'story' ? 'on' : ''}"><a href="/Farmstory1/board/list.jsp?group=Croptalk&cate=story">농작물이야기</a></li>
                <li class="${cate eq 'grow' ? 'on' : ''}"><a href="/Farmstory1/board/list.jsp?group=Croptalk&cate=grow">텃밭가꾸기</a></li>
                <li class="${cate eq 'school' ? 'on' : ''}"><a href="/Farmstory1/board/list.jsp?group=Croptalk&cate=school">귀농학교</a></li>
            </ul>
        </aside>
        <article>
            <nav>
		    <img src="../images/sub_nav_tit_cate5_${cate}.png" alt="커뮤니티"/>
		    <p>
		        HOME &gt; 커뮤니티 &gt; 
		        <c:choose>
		            <c:when test="${cate eq 'story'}">
		                <em>농작물이야기</em>
		            </c:when>
		            <c:when test="${cate eq 'grow'}">
		                <em>텃밭가꾸기</em>
		            </c:when>
		            <c:when test="${cate eq 'school'}">
		                <em>귀농학교</em>
		            </c:when>
		        </c:choose>
		    </p>
		</nav>
            <!-- 내용 시작 -->