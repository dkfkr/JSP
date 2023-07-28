<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>user2::register2</title>
</head>
	<body>
		<h3>user2 등록</h3>
		
		<form action="/Ch06/user2/registerProc2.jsp" method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td><input type="text" name="hp"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age"></td>
				</tr>
				<tr>
					
					<td colspan="2" align="right"><input type="submit" value="등록"></td>
				</tr>
			</table>
		
		</form>
	</body>
</html>