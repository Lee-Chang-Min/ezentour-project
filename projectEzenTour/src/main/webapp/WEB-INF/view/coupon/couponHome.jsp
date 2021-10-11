<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/includeTags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/mainStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">

</head>
<body>
<%@include file="../main/top.jsp" %>
	<c:forEach items="${cpUse }" var="dto">
		<c:if test="${dto.cpNo != null }">
			쿠폰번호: ${dto.cpNo } 상품명 : ${dto.prodNo } 할인금액 : ${dto.cpDiscount } <br><br>
		</c:if>
		<c:if test="${dto == null }">
			쿠폰이 없습니다.
		</c:if>
	</c:forEach>
</body>
</html>
