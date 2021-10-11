<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="idFindFinish" method="post">
<table border="1">
	<tr>
	  <th>이름</th>
	  <th> <input type="text" name="memName" ></th>
	</tr>
	<tr>
	  <th>이메일</th>  
	  <th><input type="email" name="memEmail"></th>
	</tr>
	<tr>
	 <th>핸드폰 번호</th>  
	 <th><input type="text" name="memPh" /></th>
	</tr>
	<tr><td colspan="2">
	<input type ="submit" value="아이디 찾기"/>
	<input type="button" value="홈으로"onclick="javascript:location.href='../'"/>
</table>
</form>
</body>
</html>