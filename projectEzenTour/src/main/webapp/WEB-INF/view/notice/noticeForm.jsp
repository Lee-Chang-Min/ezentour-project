<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<form action="noticeWrite" method="post">
<table border="1">
	<tr><td>글번호</td>
		<td><input type="text" name="noticeNo"
				value="${ntNo }" readonly="readonly"/></td></tr>
	<tr><td>종류</td>
		<td><select name="noticeKind">
		<option>notice</option>
		<option>event</option>
		</select></td></tr>			
	<tr><td>제목</td>
		<td><input type="text" name="noticeSub"></td></tr>
	<tr><td>내용</td>
		<td><textarea rows="6" cols="30" name="noticeCon"></textarea></td></tr>
	<tr><td>사원번호</td>
		<td><input type="text" name="empId"
				value="${empId }" readonly="readonly"/></td></tr>
<tr><td colspan="2">
		<input type="submit" value="두두등록">
		<input type="reset" value="사사삭제">
		<input type="button" value="홈으로"onclick="javascript:location.href='../'"/>



</table>
</form>
</body>
</html>