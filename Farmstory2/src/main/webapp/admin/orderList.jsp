<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./_header.jsp" %>
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
		
		$('.orderDelete').click(function(e){
			e.preventDefault();
			$('#formCheck').submit();
		});
		
		
	});
	

</script>
        <main>
            <%@ include file="./_aside.jsp" %>
            <section id="orderList">
                <nav>
                    <h3>주문목록</h3>
                </nav>

                <article>
					<form id="formCheck" action="/Farmstory2/admin/deleteOrders.do" method="get">
	                    <table border="0">
	                    	
	                        <tr>
	                            <th><input type="checkbox" name="all"/></th>
	                            <th>주문번호</th>
	                            <th>상품명</th>
	                            <th>판매가격</th>
	                            <th>수량</th>
	                            <th>배송비</th>
	                            <th>합계</th>
	                            <th>주문자</th>
	                            <th>주문일</th>
	                            <th>확인</th>
	                        </tr>
	                        <c:forEach var="order" items="${orders}">
							    <tr>
							        <td class="chk"><input type="checkbox" name="chk" value="${order.orderNo}"/></td>
							        <td class="orderNo">${order.orderNo}</td>
									<td class="pName">${order.pName}</td>
							        <td class="price">${order.orderPrice}원</td>
							        <td class="count">${order.orderCount}</td>
							        <td class="delivery">${order.orderDelivery}원</td>
							        <td class="total">${order.orderTotal}원</td>
							        <td class="orderer">${order.orderUser}</td>
							        <td class="date">${order.orderDate}</td>
							        <td><a href="#" class="showPopup">[상세확인]</a></td>
							        <td class="hidden orderProduct" style="display: none;">${order.orderProduct}</td>
									<td class="hidden thumb1" style="display: none;">${order.thumb1}</td>
									<td class="hidden receiver" style="display: none;">${order.receiver}</td>
									<td class="hidden address" style="display: none;">${order.addr1}${order.addr2}</td>
									<td class="hidden etc" style="display: none;">${order.orderEtc}</td>
							    </tr>
							</c:forEach>
	                    </table>
					</form>
                    <p>
                        <a href="#" class="orderDelete">선택삭제</a>                        
                    </p>
                    
                    <p class="paging">
                    <c:if test="${pageGroupStart > 1}">
                        <a href="/Farmstory2/admin/orderList.do?pg=${pageGroupStart - 1}"><</a>
                    </c:if>
                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">   
                        <a href="/Farmstory2/admin/orderList.do?pg=${i}" class="num ${currentPage == i ? 'on current':''}">[${i}]</a>
                    </c:forEach>   
                    <c:if test="${pageGroupEnd < lastPageNum}"> 
                        <a href="/Farmstory2/admin/orderList.do?pg=${pageGroupEnd + 1}">></a>
                    </c:if>   
                    </p>
                </article>
            </section>
        </main>
<%@ include file="./_footer.jsp" %>        
		<div id="orderPopup">
		    <section>
		        <nav>
		            <h1>상세주문내역</h1>
		            <button class="btnClose">닫기</button>
		        </nav>
		
		        <article>  
		            <h3>기본정보</h3>
		            <table border="0">
		                <tr>
		                    <td rowspan="7" class="thumb"><img src="${ctxPath}/thumb/${order.thumb1}"></td>
		                    <td>상품번호</td>
		                    <td class="orderProduct">상품번호</td>
		                </tr>
		                <tr>
		                    <td>상품명</td>
		                    <td class="pName">사과 500g</td>
		                </tr>
		                <tr>
		                    <td>판매가격</td>
		                    <td class="price">4,000원</td>
		                </tr>
		                <tr>
		                    <td>수량</td>
		                    <td class="count">2개</td>
		                </tr>
		                <tr>
		                    <td>배송비</td>
		                    <td class="delivery">3,000원</td>
		                </tr>
		                <tr>
		                    <td>총합계</td>
		                    <td class="total">11,000원</td>
		                </tr>
		                <tr>
		                    <td>주문자</td>
		                    <td class="orderer">홍길동</td>
		                </tr>                        
		            </table>
		
		            <h3>배송지 정보</h3>
		            <table border="0">
		                <tr>
		                    <td>받는분</td>
		                    <td class="receiver">홍길동</td>
		                </tr>
		                <tr>
		                    <td>배송지</td>
		                    <td class="address">부산광역시 부산진구 대연동 120 루미너스 10층</td>
		                </tr>
		                <tr>
		                    <td>기타</td>
		                    <td class="etc">부산광역시 부산진구 대연동 120 루미너스 10층</td>
		                </tr>
		            </table>
		        </article>
		    </section>
		</div>
