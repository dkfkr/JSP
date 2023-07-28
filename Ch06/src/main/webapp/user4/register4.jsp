<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>register4</title>
</head>
	<body>
		<h3>User4 등록</h3>
		
		<form action="/Ch06/user4/registerProc4.jsp">
			<table border="1">
			 	<tr>
			 		<td>이름</td>
			 		<td><input type="text" name="name"></td>
			 	</tr>
			 	<tr>
			 		<td>성별</td>
			 		<td>	
			 			<input type="radio" name="gender" value=0>남
			 			<input type="radio" name="gender" value=1>여
			 		</td>
			 	</tr>
			 	<tr>
			 		<td>나이</td>
			 		<td><input type="number" name="age"></td>
			 	</tr>
			 	<tr>
			 		<td>주소</td>
			 		<td><input type="text" name="addr"></td>
			 	</tr>
			 	<tr>
			 		<td colspan="2" align="right"><input type="submit" value="등록"></td>
			 	</tr>
			</table>
		
		</form>
		
	</body>
</html>