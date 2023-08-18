<%@page import="kr.Farmstory1.dao.UserDAO"%>
<%@page import="kr.Farmstory1.dto.TermsDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
TermsDTO dto = UserDAO.getInstance().selectTerms();
%>
    <script>
    	window.onload = function(){
    		
    		const ckk1 = document.getElementsByName('ckk1')[0];
    		const ckk2 = document.getElementsByName('ckk2')[0];
    		
    		const btnNext = document.querySelector('.btnNext');
    		btnNext.addEventListener('click', function(e){
    			e.preventDefault();
    			
    			if(!ckk1.checked){
    				alert('이용약관에 동의하셔야 합니다.');
    				return;
    			}else if(!ckk2.checked){
    				alert('개인정보 취급방침에 동의하셔야 합니다.');
    				return;
    			}else{
    				location.href = "./register.jsp";
    			}    			    			
    		});
    	}
    </script>
        <div id="user">
            <section class="terms">
                <table>
                    <caption>사이트 이용약관</caption>
                    <tr>
                        <td>
                            <textarea readonly><%= dto.getTerms() %></textarea>
                            <p>
                                <label><input type="checkbox" name="ckk1"/>동의합니다.</label>
                            </p>
                        </td>
                    </tr>
                </table>
                <table>
                    <caption>개인정보 취급방침</caption>
                    <tr>
                        <td>
                            <textarea readonly><%= dto.getPrivacy() %></textarea>
                            <p>
                                <label><input type="checkbox" name="ckk2"/>동의합니다.</label>
                            </p>
                        </td>
                    </tr>
                </table>
                <div>
                    <a href="./login.jsp" class="btnCancel">취소</a>
                    <a href="./register.jsp" class="btnNext">다음</a>
                </div>
            </section>
        </div>
<%@ include file="../_footer.jsp" %>