<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="findPasswordPro" method="post" name="frm">
<table border="1">
	<tr>
	   <th>아이디</th>
	   <th> <input type="text" name="memId" /></th>
	</tr>
	<tr>
	   <th>이메일</th>  
	   <th><input type="email" name="memEmail" /></th>
	</tr>
	<tr><td colspan="1">
	<input type="submit" value="전송">
	
</table>
</form>
</body>
</html>