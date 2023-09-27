<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

	$(function(){
		
		
		$('input[name=all]').change(function(){
			const isChecked = $(this).is(':checked');
			
			if(isChecked){
				// 전체선택
				$('input[name=chk]').prop('checked', true);
			}else{
				// 전체해제
				$('input[name=chk]').prop('checked', false);
			}
		});
		
		$('.productDelete').click(function(e){
			e.preventDefault();
			$('#formCheck').submit();
		});
		
		
	});
	

</script>
        <main>
            <%@ include file="./_aside.jsp" %>
            <section id="productList">
                <nav>
                    <h3>상품목록</h3>
                </nav>
                <article>
                	<form id="formCheck" action="/Farmstory2/admin/deleteProducts.do" method="get">
	                    <table border="0">
	                        <tr>
	                            <th><input type="checkbox" name="all"/></th>
	                            <th>사진</th>
	                            <th>상품번호</th>
	                            <th>상품명</th>
	                            <th>구분</th>
	                            <th>가격</th>
	                            <th>재고</th>
	                            <th>등록일</th>
	                        </tr>
	                        <c:forEach var="product" items="${products}">
	                        <tr>
	                            <td><input type="checkbox" name="chk"/></td>
	                            <td><img src="${ctxPath}/thumb/${product.thumb1}" class="thumb"></td>
						        <td>${product.pNo}</td>
						        <td>${product.pName}</td>
						        <td>
						            <c:choose>
						                <c:when test="${product.type eq 1}">과일</c:when>
						                <c:when test="${product.type eq 2}">야채</c:when>
						                <c:when test="${product.type eq 3}">곡물</c:when>
						                <c:otherwise>Unknown</c:otherwise>
						            </c:choose>
						        </td>
						        <td>${product.price}</td>
						        <td>${product.stock}</td>
						        <td>${product.rdate}</td>
								</c:forEach>
	                    </table>
					</form>
                    <p>
                        <a href="#" class="productDelete">선택삭제</a>
                        <a href="./productRegister.do" class="productRegister">상품등록</a>
                    </p>
                    
                    <p class="paging">
                    <c:if test="${pageGroupStart > 1}">
                        <a href="/Farmstory2/admin/productList.do?pg=${pageGroupStart - 1}"><</a>
                    </c:if>
                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">   
                        <a href="/Farmstory2/admin/productList.do?pg=${i}" class="num ${currentPage == i ? 'on current':''}">[${i}]</a>
                    </c:forEach>   
                    <c:if test="${pageGroupEnd < lastPageNum}"> 
                        <a href="/Farmstory2/admin/productList.do?pg=${pageGroupEnd + 1}">></a>
                    </c:if>   
                    </p>

                </article>

                
            </section>
        </main>
<%@ include file="./_footer.jsp" %>