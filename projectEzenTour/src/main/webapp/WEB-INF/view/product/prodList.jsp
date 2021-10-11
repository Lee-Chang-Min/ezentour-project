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
여행상품리스트 페이지 상품의 총갯수는 : ${productCount }개<br />
<table border = 1 >

	<tr><th>상품번호</th><th>상품테마</th><th>상품명</th><th>가격</th><th>지역</th><th>최대인원</th></tr>
	    
	    
	<c:forEach items="${prodList }" var="dto">
	<tr><td><a href="prodDetail?prodNo=${dto.prodNo }">${dto.prodNo }</a></td>
		<td>${dto.prodTheme }</td>
	    <td>${dto.prodName }</td>
		<td>${dto.prodPrice }</td>
		<td>${dto.prodLocation }</td>
	    <td>${dto.maxPer }</td></tr>
	</c:forEach>
	
	
	<tr><td colspan="8">
		<%@ include file="../include/pageprodList.jsp" %>
	</td></tr>
	
</table>
<a href="prodRegist" >상품등록</a>
<a href="${pageContext.request.contextPath}/main">홈으로</a>
</body>
</html>