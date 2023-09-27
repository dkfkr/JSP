<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       <div id="sub">
            <div><img src="/Farmstory2/images/sub_top_tit2.png" alt="MARKET"></div>
            <section class="market">
                <aside>
                    <img src="/Farmstory2/images/sub_aside_cate2_tit.png" alt="장보기"/>

                    <ul class="lnb">
                        <li class="on"><a href="/Farmstory2/market/list.do">장보기</a></li>
                    </ul>
                </aside>
                <article class="list">
                    <nav>
                        <img src="/Farmstory2/images/sub_nav_tit_cate2_tit1.png" alt="장보기"/>
                        <p>
                            HOME > 장보기 > <em>장보기</em>
                        </p>
                    </nav>

                    <!-- 내용 시작 -->

					<c:set var="type0Class" value="${type eq '0' ? 'on' : ''}" />
					<c:set var="type1Class" value="${type eq '1' ? 'on' : ''}" />
					<c:set var="type2Class" value="${type eq '2' ? 'on' : ''}" />
					<c:set var="type3Class" value="${type eq '3' ? 'on' : ''}" />
					
					<p class="sort">
						<a href="/Farmstory2/market/list.do?type=0" class="${type0Class}">전체(${type eq '0' ? total : ''}) |</a>
						<a href="/Farmstory2/market/list.do?type=1" class="${type1Class}">과일(${type eq '1' ? total : ''}) |</a>
						<a href="/Farmstory2/market/list.do?type=2" class="${type2Class}">야채(${type eq '2' ? total : ''}) |</a>
						<a href="/Farmstory2/market/list.do?type=3" class="${type3Class}">곡류(${type eq '3' ? total : ''})</a>
					</p>
					
					<table border="0">
					    <c:forEach items="${products}" var="product">
					        <tr>
					            <td>
					                <a href="/Farmstory2/market/view.do?pNo=${product.pNo}">
					                    <img src="/Farmstory2/thumb/${product.thumb1}" class="thumb" alt="사과 500g">
					                </a>
					            </td>
					            <td>
					                <c:choose>
					                    <c:when test="${product.type eq 1}">과일</c:when>
					                    <c:when test="${product.type eq 2}">야채</c:when>
					                    <c:when test="${product.type eq 3}">곡물</c:when>
					                </c:choose>
					            </td>
					            <td>
					                <a href="/Farmstory2/market/view.do?type=${type}&pNo=${product.pNo}">
					                    ${product.pName}
					                </a>
					            </td>
					            <td>
					                <strong>
					                     <fmt:formatNumber value="${product.price}" type="number" pattern="#,##0원" />
					                </strong>
					            </td>
					        </tr>
					    </c:forEach>
					</table>

                    <p class="paging">
                    <c:if test="${pageGroupStart > 1}">
                        <a href="/Farmstory2/market/list.do?type=${type}&pg=${pageGroupStart - 1}">이전</a>
                    </c:if>
                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">   
                        <a href="/Farmstory2/market/list.do?type=${type}&pg=${i}" class="num ${currentPage == i ? 'current':''}">[${i}]</a>
                    </c:forEach>   
                    <c:if test="${pageGroupEnd < lastPageNum}"> 
                        <a href="/Farmstory2/market/list.do?type=${type}&pg=${pageGroupEnd + 1}">다음</a>
                    </c:if>
                    </p>

                    <!-- 내용 끝 -->

                </article>
            </section>
        </div>
<%@ include file="../_footer.jsp" %>