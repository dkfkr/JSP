<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Jboard2/js/zipcode.js"></script>
<script src="/Jboard2/js/validation.js"></script>
<script src="/Jboard2/js/checkUser.js"></script>
<script src="/Jboard2/js/authEmail.js"></script>
<script>
$(function() {
	
	const inputUid = document.getElementsByName('uid')[0];  
	const inputPass = document.getElementsByName('pass2')[0];  
	
	// 비번 변경
	const btnUpdatePass = document.getElementById('btnUpdatePass');
	btnUpdatePass.addEventListener('click', function(){
		
		if (isPassOk && confirm('정말 비밀번호를 수정하시겠습니까?')) {
			const params = new URLSearchParams();
			params.append('kind', 'PASSWORD');
			params.append('uid', inputUid.value);
			params.append('pass', inputPass.value);

			fetch('/Jboard2/user/myinfo.do', {
					method: 'POST',
					body: params
			})
			.then((response) => response.json())
			.then((data) => {
				console.log('data : ', data);
				
				if (data.result === 0) {
					alert('비밀번호가 수정되었습니다. 다시 로그인 하십시오');
					location.href = '/Jboard2/user/logout.do';
				}
			});
			
		} else {
			alert('변경하실 비밀번호가 유효하지 않거나 일치하지 않습니다.');
		}
			
	});
	
	//탈퇴하기
	const btnWithdraw = document.getElementById('btnWithdraw');
	btnWithdraw.addEventListener('click', function() {
		if (confirm('정말 탈퇴 하시겠습니까?')) {
		    const jsonData = {
		        "kind": 'WITHDRAW',
		        "uid": inputUid.value
		    }
	
		    fetch('/Jboard2/user/myinfo.do', {
		        method: 'POST',
		        body: JSON.stringify(jsonData),
		        headers: {
		            'Content-Type': 'application/json'
		        }
		    })
		    .then((response) => response.json())
		    .then((data) => {
		        console.log('data : ', data);
		        if (data.result > 0) {
		            alert('회원탈퇴가 정상적으로 처리되었습니다. 다시 뵙기를 기다리겠습니다.');
		            location.href = '/Jboard2/user/logout.do';
		        }
		    });
		} else {
			// 취소 시 아무 동작 없음
		}
	});
});

</script>
<main id="user">
    <section class="myInfo">
        <form action="/Jboard2/user/myinfo.do" method="post">
        	<input type="hidden" name="kind" value="MODIFY">
        	<input type="hidden" name="type" value="MODIFY">
        	<input type="hidden" name="uid" value="${sessUser.uid}">
            <table border="1">
                <caption>회원정보 수정</caption>
                <tr>
                	<td>아이디</td>
                    <td>${sessUser.uid}</td>
                 </tr>
                 <tr>   
                    <td>비밀번호</td>
                    <td>
                        <input type="password" name="pass1" placeholder="비밀번호 입력"/>
                        <span class="passResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td>
                        <input type="password" name="pass2" placeholder="비밀번호 입력 확인"/>
                        <button type="button" id="btnUpdatePass" class="btnUpdatePass">비밀번호 수정</button>
                    </td>
                </tr>
                <tr>
                    <td>회원 가입일</td>
                    <td>${sessUser.regDate}</td>
                </tr>
            </table>
            <table border="1">
                <caption>개인정보 수정</caption>
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="name" value="${sessUser.name}"/>
                        <span class="nameResult"></span>                     
                    </td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>
                        <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                        <input type="text" name="nick" value="${sessUser.nick}" placeholder="별명 입력"/>
                        <button type="button" id="btnCheckNick"><img src="../img/chk_id.gif" alt="중복확인"/></button>
                        <span class="nickResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        
                        <input type="email" name="email" value="${sessUser.email}" placeholder="이메일 입력"/>
                        <span class="resultEmail"></span>
                        <button type="button" id="btnEmailCode"><img src="../img/chk_auth.gif" alt="인증번호 받기"/></button>
                        <div class="auth">
                            <input type="text" name="auth" placeholder="인증번호 입력"/>
                            <button type="button" id="btnEmailAuth"><img src="../img/chk_confirm.gif" alt="확인"/></button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td>
                        <input type="text" name="hp" value="${sessUser.hp}" placeholder="휴대폰 입력"/>
                        <span class="resultHp"></span>
                    </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text" name="zip" id="zip" value="${sessUser.zip}" readonly="readonly"/>
                        <button type="button" onclick="zipcode()" ><img src="../img/chk_post.gif" alt="우편번호찾기"/></button>
                        <input type="text" name="addr1" id="addr1" value="${sessUser.addr1}"/>
                        <input type="text" name="addr2" id="addr2" value="${sessUser.addr2}"/>
                    </td>
                </tr>
                <tr>
                    <td>회원탈퇴</td>
                    <td>
                        <button type="button" id="btnWithdraw" class="btnWithdraw">탈퇴하기</button>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard2/list.do" class="btn btnCancel">목록으로</a>
                <input type="submit" value="회원수정" class="btn btnRegister"/>
            </div>
        </form>
    </section>
</main>
<%@ include file="./_footer.jsp" %>