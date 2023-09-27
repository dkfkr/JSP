<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <div id="sub">
            <div><img src="../images/sub_top_tit2.png" alt="MARKET"></div>
            <section class="market">
                <aside>
                    <img src="../images/sub_aside_cate2_tit.png" alt="장보기"/>

                    <ul class="lnb">
                        <li class="on"><a href="./market.html">장보기</a></li>
                    </ul>
                </aside>
                <article class="view">
                    <nav>
                        <img src="../images/sub_nav_tit_cate2_tit1.png" alt="장보기"/>
                        <p>
                            HOME > 장보기 > <em>장보기</em>
                        </p>
                    </nav>

                    <!-- 내용 시작 -->
                    <h3>기본정보</h3>
                    <div class="basic">

						<c:set var="productName" value="${market.pName}" />
						<c:set var="productCode" value="${market.pNo}" />
						<c:set var="delivery" value="${market.delivery}" />
						<c:set var="price" value="${market.price}" />
						
						<img src="/Farmstory2/thumb/${market.thumb2}" alt="${productName}">
						
						<table border="0">                            
						    <tr>
						        <td>상품명</td>
						        <td>${productName}</td>
						    </tr>
						    <tr>
						        <td>상품코드</td>
						        <td>${productCode}</td>
						    </tr>
						    <tr>
						        <td>배송비</td>
						        <td>
						            <c:choose>
						                <c:when test="${delivery > 0}">
						                    <span>${delivery}원</span>
						                    <em>3만원 이상 무료배송</em>
						                </c:when>
						                <c:otherwise>
						                    <span>배송비 무료</span>
						                </c:otherwise>
						            </c:choose>
						        </td>
						    </tr>
						    <tr>
						        <td>판매가격</td>
						        <td>${price}원</td>
						    </tr>
						    <tr>
						        <td>구매수량</td>
						        <td>
						            <input type="number" name="count" min="1" value="1">
						        </td>
						    </tr>
						    <tr>
						        <td>합계</td>
						        <td class="total">${price}원</td>
						    </tr>
						</table>
						<form id="formOrder" action="/Farmstory2/market/order.do" method="post">
	                	<input type="hidden" name="thumb2"   value="${market.thumb2}">
	                	<input type="hidden" name="pName"    value="${productName}">
	                	<input type="hidden" name="pNo"      value="${productCode}">
	                	<input type="hidden" name="delivery" value="${delivery}">
	                	<input type="hidden" name="price"    value="${price}">
	                	<input type="hidden" name="count"    value="1">
	                	<input type="hidden" name="total"    value="${price}">                
	                	<input type="hidden" name="final"    value="${price + delivery}">                
	                	</form>
		                <a href="#" class="btnOrder">
		                    <img src="../images/market_btn_order.gif" alt="바로 구매하기"/>
		                </a>
							<script>
									
									const price    = ${price};
									const delivery = ${delivery};
									
									$(function(){
										
										$('input[name=count]').change(function(){
											
											let count = $(this).val();
											let total = price * count;
											let finalPrice = total + delivery; 
											
											$('input[name=count]').val(count);
											$('input[name=total]').val(total);
											$('input[name=final]').val(finalPrice);
											
											$('.total').text(total.toLocaleString()+'원');
										});
										
										// 주문하기
										$('.btnOrder').click(function(e){
											e.preventDefault();
											$('#formOrder').submit();
										});
										
									});
							</script>
                    </div>
                    <h3>상품설명</h3>
                    <div class="detail">
                        <img src="/Farmstory2/thumb/${market.thumb3}" alt="상세 이미지">
                    </div>

                    <h3>배송정보</h3>
                    <div class="delivery">
                        <p>
                            입금하신 이후 택배송장번호는 SMS(문자서비스)를 통해 고객님께 안내해드립니다.
                        </p>
                    </div>

                    <h3>교환/반품</h3>                  
                    <div class="exchange">
                        <table border="0">
                            <tr>
                                <td>교환 반품이 가능한 경우</td>
                                <td>
                                    <ul>
                                        <li>팜스토리 상품에 하자가 있거나 불량인 경우</li>
                                        <li>채소, 과일, 양곡등의 식품은 만1일 이내</li>
                                        <li>기타 상품은 수령일로부터 영업일 기준 일주일 이내</li>
                                        <li>받으신 상품이 표시사항과 다른 경우에는 받으신 날로부터 일주일 이내</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>교환 반품이 불가능한 경우</td>
                                <td>
                                    <ul>
                                        <li>신선 식품의 경우 단순히 마음에 들지 않는 경우</li>
                                        <li>단순 변심으로 상품이 가치가 훼손돼서 판매가 어려운 경우</li>
                                    </ul>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- 내용 끝 -->
                </article>
  
        </div>
<%@ include file="../_footer.jsp" %>