<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./_header.jsp" %>
        <main>
			<%@ include file="./_aside.jsp" %>
            <section>
                <nav>
                    <h3>관리자 메인</h3>
                </nav>

                <article>
                    <h3>
                        <a href="/admin/productList.do">상품현황</a>
                        <a href="/admin/productList.do" class="more">+ 더보기</a>
                    </h3>
                    <table border="0">
                        <tr>
                            <th>상품번호</th>
                            <th>상품명</th>
                            <th>구분</th>
                            <th>가격</th>
                            <th>재고</th>
                            <th>등록일</th>
                        </tr>
                        <c:forEach var="latest" items="${latest1}">
                        <tr>
                            <td>${latest.pNo}</td>
                            <td>${latest.pName}</td>
                            <td>${latest.type}</td>
                            <td>${latest.price}원</td>
                            <td>${latest.stock}</td>
                            <td>${latest.rdate}</td>
                        </tr>                  
                        </c:forEach>     
                    </table>
                </article>

                <article>
                    <h3>
                        <a href="/admin/orderList.do">주문현황</a>
                        <a href="/admin/orderList.do" class="more">+ 더보기</a>
                    </h3>
                    <table border="0">
                        <tr>
                            <th>주문번호</th>
                            <th>상품명</th>
                            <th>판매가격</th>
                            <th>수량</th>
                            <th>배송비</th>
                            <th>합계</th>
                            <th>주문자</th>
                            <th>주문일</th>
                        </tr>
                        <c:forEach var="latest" items="${latest2}">
                        <tr>
                            <td>${latest.orderNo}</td>
                            <td>${latest.pName}</td>
                            <td>${latest.orderPrice}원</td>
                            <td>${latest.orderCount}개</td>
                            <td>${latest.orderDelivery}원</td>
                            <td>${latest.orderTotal}원</td>
                            <td>${latest.orderUser}</td>
                            <td>${latest.receiver}</td>
                        </tr>
                        </c:forEach>
                    </table>
                </article>
                <article>
                    <h3>
                        <a href="/admin/userList.do">회원현황</a>
                        <a href="/admin/userList.do" class="more">+ 더보기</a>
                    </h3>
                    <table border="0">
                        <tr>
                            <th>회원아이디</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>휴대폰</th>
                            <th>이메일</th>
                            <th>등급</th>
                            <th>회원가입일</th>
                        </tr>
                        
                        <c:forEach var="latest" items="${latest3}">
                        <tr>
                            <td>${latest.uid}</td>
                            <td>${latest.name}</td>
                            <td>${latest.nick}</td>
                            <td>${latest.hp}</td>
                            <td>${latest.email}</td>
                            <td>${latest.grade}</td>
                            <td>${latest.regDate}</td>
                        </tr>
                        </c:forEach>                                              
                    </table>
                </article>
            </section>
        </main>
<%@ include file="./_footer.jsp" %>