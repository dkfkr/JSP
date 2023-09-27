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
		
		$('.userModify').click(function(e){
			e.preventDefault();
			$('#formCheck').submit();
		});
		
		
	});

</script>        
        <main>
            <%@ include file="./_aside.jsp" %>
            <section id="orderList">
                <nav>
                    <h3>회원목록</h3>
                </nav>

                <article>
					<form id="formCheck" action="/Farmstory2/admin/userModify.do" method="get">
                    <table border="0">
                        <tr>
                            <th><input type="checkbox" name="all"/></th>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>별명</th>
                            <th>이메일</th>
                            <th>휴대폰</th>
                            <c:if test="${user.role ne 'ADMIN'}">
                            <th>유형</th>
                            </c:if>
                            <th>vip등급</th>
                            <th>가입일</th>
                            <th>확인</th>
                        </tr>

                        <c:forEach var="user" items="${users}">
						    <c:if test="${user.role ne 'ADMIN'}">
						        <tr>
						            <td><input type="checkbox" name="chk" value="${user.uid}"/></td>
						            <td class="uid">${user.uid}</td>
						            <td class="name">${user.name}</td>                            
						            <td class="nick">${user.nick}</td>
						            <td class="email">${user.email}</td>
						            <td class="hp">${user.hp}</td>
						            <td class="role">${user.role}</td>
									<td class="grade">
									    <select class="userGrade">
									        <option value="1" <c:if test="${user.grade eq 1}">selected</c:if>>일반회원</option>
									        <option value="2" <c:if test="${user.grade eq 2}">selected</c:if>>vip1</option>
									        <option value="3" <c:if test="${user.grade eq 3}">selected</c:if>>vip2</option>
									        <option value="4" <c:if test="${user.grade eq 4}">selected</c:if>>vip3</option>
									        <option value="5" <c:if test="${user.grade eq 5}">selected</c:if>>최고등급</option>
									    </select>
									</td>
						            <td class="regDate">${user.regDate}</td>
						            <td><a href="#" class="showPopup">[상세확인]</a></td>
						            <td class="hidden addr1" style="display: none;">${user.addr1}</td>
						            <td class="hidden addr2" style="display: none;">${user.addr2}</td>
						            <td class="hidden regIp" style="display: none;">${user.regip}</td>
						        </tr>
						    </c:if>
						</c:forEach>      
                    </table> 
                    </form>   
                    <p>
                        <a href="#" class="userModify">선택수정</a>                        
                    </p>
                    
                     <p class="paging">
                    <c:if test="${pageGroupStart > 1}">
                        <a href="/Farmstory2/admin/userList.do?pg=${pageGroupStart - 1}"><</a>
                    </c:if>
                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">   
                        <a href="/Farmstory2/admin/userList.do?pg=${i}" class="num ${currentPage == i ? 'on current':''}">[${i}]</a>
                    </c:forEach>   
                    <c:if test="${pageGroupEnd < lastPageNum}"> 
                        <a href="/Farmstory2/admin/userList.do?pg=${pageGroupEnd + 1}">></a>
                    </c:if>   
                    </p>
                </article>
            </section>
        </main>
<%@ include file="./_footer.jsp" %>

        <div id="userPopup">
            <section>
                <nav>
                    <h1>사용자 상세정보</h1>
                    <button class="btnClose">닫기</button>
                </nav>

                <article>  
                    <h3>기본정보</h3>
                    <table border="0">
                        <tr>
                            <td>아이디</td>
                            <td class="uid">a101</td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td class="name">김유신</td>
                        </tr>
                        <tr>
                            <td>별명</td>
                            <td class="nick">유신101</td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td class="email">yusin101@naver.com</td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td class="hp">010-1234-1001</td>
                        </tr>
                        <tr>
                            <td>vip등급</td>
                            <td class="userGrade">2등급(준회원)</td>
                        </tr>
                        <tr>
                            <td >주소</td>
                            <td>
                                <p class="addr1">
                                    부산광역시 부산진구 대연동 120
                                </p>
                                <p class="addr2">
                                    한빛빌딩 10층
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>아이피</td>
                            <td class="regIp">192.168.10.112</td>
                        </tr>
                        <tr>
                            <td>회원가입일</td>
                            <td class="regDate">2023-01-01 13:06:14</td>
                        </tr>
                    </table>
                </article>
            </section>
        </div>