<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../_header.jsp" %>
<jsp:include page="./aside${group}.jsp"/>
			<section class="list">
					<form action="/Farmstory2/board/list.do?group=${group}&cate=${cate}" method="get">
			            <input type="text" name="search" placeholder="제목 키워드 검색">
			            <input type="submit" value="검색">
			        </form>
			    <h3>글목록</h3>
				    
			    <article>
			        <table border="1">
			            <tr>
			                <th>번호</th>
			                <th>제목</th>
			                <th>글쓴이</th>
			                <th>날짜</th>
			                <th>조회</th>
			            </tr>
			            <c:forEach var="user" items="${articles}">              
			                <tr>
			                	<td>${user.no}</td>
			                    <td><a href="./view.do?group=${group}&cate=${cate}&no=${user.no}">${user.title}</a>[${user.comment}]</td>
			                    <td>${user.nick}</td>
			                    <td>${user.rdate}</td>
			                    <td>${user.hit}</td>
			                </tr>
			            </c:forEach>  
			        </table>
			    </article>
			
			    <!-- 페이지 네비게이션 -->
		        <div class="paging">
		            <c:if test="${pageGroupStart > 1}">
		                <a href="/Farmstory2/board/list.do?group=${group}&cate=${cate}&pg=${pageGroupStart - 1}" class="prev">이전</a>
		            </c:if>         
		            <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
		                <a href="/Farmstory2/board/list.do?group=${group}&cate=${cate}&pg=${i}" class="num ${currentPage == i ? 'current':''}">${i}</a>
		            </c:forEach>
		            <c:if test="${pageGroupEnd < lastPageNum}">
		                <a href="/Farmstory2/board/list.do?group=${group}&cate=${cate}&pg=${pageGroupEnd + 1}" class="next">다음</a>
		            </c:if>
		        </div>	
			    <!-- 글쓰기 버튼 -->
			    <a href="./write.do?group=${group}&cate=${cate}" class="btnWrite">글쓰기</a>
			</section>
        </article>
    </section>
</div>		
<%@ include file="../_footer.jsp" %>