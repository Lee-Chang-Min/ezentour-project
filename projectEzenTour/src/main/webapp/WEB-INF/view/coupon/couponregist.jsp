<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/includeTags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="CouponWrite" method="post">
	<table border="1">
	<tr><td>쿠폰번호</td>
		<td><input type="text" name="cpNo"
				value="${cpNo }" readonly="readonly"/></td></tr>
	<tr><td>쿠폰 할인율</td>
			<td><input type="text" name="cpDiscount"></td></tr>
			
	<tr><td>상품번호</td>
		<td>
				<select name="prodNo"> 
				<c:forEach items="${prodList }" var="dto">
					<option value="${dto.prodNo }">${dto.prodNo }</option>  
				</c:forEach>
				</select>
		</td>	
	</tr>		
	<tr><td colspan="2">
		<input type="submit" value="쿠폰등록">
		<input type="reset" value="취소">
		</td></tr>

</table>
</form>
</body>
</html>