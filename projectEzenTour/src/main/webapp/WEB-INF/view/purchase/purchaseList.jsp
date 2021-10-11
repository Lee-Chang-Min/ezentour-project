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
나의여행
<table width="900" border=1>
		<tr>
			<td>사진 </td>
			<td>주문일()</td>
			<td>상품명/주문번호</td>
			<td>주문번호</td>
			<td>결제금액</td>
			<td>결제번호</td>
		</tr>
		<c:forEach items="${list }" var="dto">
		<c:if test="${dto.orderNo != null }">
		<tr>								
			<td><img width="200" height="200" alt="사진없슈" src="../product/upload/${dto.prodImage.split(',')[0] }" /></td>
			<td>${dto.orderDate}</td>			
			<td>${dto.prodName} / ${dto.prodNo }/</td>
			<td>${dto.orderNo}</td>
			<td>${dto.totalPrice}</td>
			<td>${dto.paymentNo}</td>
					   <td><c:if test="${dto.orderNo != null}">
					   	      결제완료<br />
					   	      
						   <c:if test="${dto.reviewContent == null }">
						   		<a href="../product/productReview?paymentNo=${dto.paymentNo }&prodNo=${dto.prodNo }">리뷰작성</a>
						   </c:if>		
						   <c:if test="${dto.reviewContent != null }">
						   		<a href="../product/productReviewUpdate?paymentNo=${dto.paymentNo }&prodNo=${dto.prodNo }">리뷰수정</a>
						   </c:if>	
						   		  
					   	  </c:if></td></tr>  
		</c:if>
		<c:if test="${dto.orderNo == null }">
			주문하신 상품이 없습니다.
		</c:if>
		</c:forEach>		   
</table> 

<a href="${pageContext.request.contextPath}/main">홈으로</a>

</body>
</html>