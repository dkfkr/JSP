<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String success = request.getParameter("success");
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>03_MailTest</title>
</head>

<script>
const success = <%= success %>;
    	
    	if(success == 200) {
    		alert('이메일을 성공적으로 발송했습니다.')
</script>	
	<body>
		<h3>3.메일 전송</h3>
		
		<form action="./proc/sendEmail.jsp">
			<table border="1">
				<tr>
					<td>보내는 사람</td>
					<td><input type="text" name="sender"></td>
				</tr>
				<tr>
					<td>받는 사람</td>
					<td><input type="text" name="receiver"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
					<textarea name="content" rows="20" cols="60"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="보내기"></td>
				</tr>
			</table>
		</form>
	</body>
</html>