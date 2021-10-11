<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 서울 </title>

<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/productStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">

</head>
<body>

<header>	
	<%@include file="../main/top.jsp" %>
</header>

<main id="main">
<div id="contents" class="contents">
	<div class="contentTop">
		<h2>문화탐방의 상품페이지</h2>
		<h3>문화탐방 테마 상품의 총갯수는 : ${histroyCount }개</h3>
	</div>


	<div class="prodContent">
		<div class="floatclear">
		<c:forEach items="${histroyList }" var="dto" varStatus="cnt" >

			<ul class="item-list">
				<c:if test="${dto.prodImage != null }">
				<li>
					<a href="${root}product/prodView?prodNo=${dto.prodNo }">
						<img src="../product/upload/${dto.prodImage.split(',')[0] }" />
					</a>
				</li>
				</c:if>
				
				<c:if test="${dto.prodImage == null }">
					<li class="prod-text">상품이미지 준비중 입니다.</li>
				</c:if>		
				<li class="prodContent-info floatL">
					<span class="prod-name">${dto.prodName }</span>
					<span class="prod-price"><fmt:formatNumber value="${dto.prodPrice }" type="currency" /></span>
				</li>
			 </ul>	
			 
			<c:if test="${cnt.count % 3 == 0 }"><!-- 한줄에 몇개씩 띄울지 // 3이면 한줄에 3개 -->
			
			</c:if>
			
		</c:forEach>		
		</div>
	</div>



<!-- 페이징 -->
<%@ include file="../include/pageHistoryList.jsp" %>
<!-- 페이징 끝 -->

</div><!-- contents /끝 -->
</main>
<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>


</body>
</html>