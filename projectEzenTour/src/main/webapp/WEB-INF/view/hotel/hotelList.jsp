<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
호텔상품리스트 페이지 <br />
<table border = 1 >

	<tr><th>호텔고유번호</th><th>호텔명</th><th>호텔주소</th><th>호텔전화번호</th><th>호텔 가격</th></tr>
	    
	    
	<c:forEach items="${hotelList }" var="dto">
	<tr><td><a href="hotelDetail?hotelNo=${dto.hotelNo }">${dto.hotelNo }</a></td>
		<td>${dto.hotelName }</td>
	    <td>${dto.hotelAddr }</td>
		<td>${dto.hotelPh }</td>
		<td>${dto.hotelPrice }</td>
	</c:forEach>
	
	
	<tr><td colspan="8">
		<%@ include file="../include/pagehotelList.jsp" %>
	</td></tr>
</table>
<a href="hotelRegist" >상품등록</a> <br/>
<a href="${pageContext.request.contextPath}/main">홈으로</a>

</body>
</html>