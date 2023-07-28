<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>01_request</title>
	<!-- 
		날짜 : 2023/07/25
		이름 : 강원빈
		내용 : JSP request 실습하기
		
		request 
		 - 클라이언트 요청정보를 갖는 객체
		 - 클라이언트 전송 데이터를 수신하는 기능 제공(getPatameter)
		 
		 GET방식
		  - 기본 데이터 전송 방식
		  - 전송 데이터가 주소에 노출
		  
		  POST 방식
		   - 전송 데이터가 요청 객체 body에 삽입되어 전송됨
		   - 전송 데이터가 노출 안됨
	 -->
</head>
	<body>
		<h3>01_request 내장객체</h3>
		
		<h4>사용자 입력</h4>
		<form action="./proc/userproc.jsp" method="get">
			<input type="text" name="uid" placeholder="아이디 입력"/><br>
			<input type="text" name="name" placeholder="이름 입력"/><br>
			<input type="number" name="age" placeholder="나이 입력"/><br>
			<input type="submit" value="전송"/>	
		</form>
		
		<h4>회원가입</h4>
		<form action="./proc/registerProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>회원 아이디</td>
					<td><input type="text" name="uid" placeholder="아이디 입력"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" name="pass" placeholder="비밀번호 입력"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="이름 입력"/></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birth" placeholder="생년월일 입력"/></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="gender" placeholder="성별 입력"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<select name="addr">
							<option>서울</option>
							<option>대전</option>
							<option>대구</option>
							<option>부산</option>
							<option>경주</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
						<select>
							<label><input type="checkbox" name="hobby" value="등산"/>등산</label>
							<label><input type="checkbox" name="hobby" value="독서"/>독서</label>
							<label><input type="checkbox" name="hobby" value="영화"/>영화</label>
							<label><input type="checkbox" name="hobby" value="운동"/>운동</label>
							<label><input type="checkbox" name="hobby" value="게임"/>게임</label>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="회원가입">
					</td>
				</tr>	
			</table>

		</form>
		
		<h4>클라이언트 정보</h4>
		<p>
			헤더정보 : <%= request.getHeader("User-Agent") %><br>
			프로토콜 : <%= request.getProtocol() %><br>
			서버이름 : <%= request.getServerName()%><br>
			요청주소 : <%= request.getRequestURL()%><br>
			요청경로 : <%= request.getRequestURI()%><br>
			IP 주소 : <%= request.getRemoteAddr()%><br>
		</p>
	</body>
</html>