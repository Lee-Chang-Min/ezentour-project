<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/member.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/employee.css" rel="stylesheet" type="text/css">
</head>
<body>
<header>	
	<%@include file="../main/top.jsp" %>
</header>
<main id="main">
<div id="wrap">
<div class="memWrap">
		<h2 class="h">위시 리스트</h2>
			<div class="memList-wrap">
			<table border="1" align="center" width="960px" class="wishTable" summary="No,Id,Name,job,Data,ph">
				<colgroup>
					<col width="20%">
					<col width="60%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상품번호</th>
						<th scope="col">상품이름</th>
						<th scope="col">상품가격</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${wishlist}" var="dto" >
					<tr>
						<td>${dto.prodNo }</td>
						<td><a href="../product/prodView?prodNo=${dto.prodNo }">${dto.prodName }</a></td>
						<td><fmt:formatNumber value="${dto.prodPrice }" type="currency" /></td>
						<%-- <td><fmt:formatDate value="${dto.noticeDate }" type="date" pattern="yyyy-MM-dd"/></td> --%>
					</c:forEach>
		
				</tbody>
						<tr><td colspan="8">
		<%@ include file="../include/pageeventList.jsp" %>
					</td></tr>
			</table>
								<div class="mypage-btn" align="center">
						<span><a href="../">홈으로</a></span>
							</div>
		</div>
	</div>

</div><!-- wrap / end -->
</main>
 --%>
 
 
 <footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>
</body>
</html>