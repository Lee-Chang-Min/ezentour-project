<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
</head>

<body>
<div class="review-wrap">
	
	<c:if test="${reviewList != null && reviewAvg != null }"> 
	<div class="review-wrap">
		<span>리뷰 평점 : </span>
		<p>${reviewAvg }</p>
	</div>
	</c:if>
	
	<!-- 사용자 리뷰  -->
	<c:forEach items="${reviewList }" var="dto">
	<div class="userReview-wrap floatclear">
		<div>
			<p>
				<span>작성자</span>
				<span>${dto.memId }</span>
			</p> 
			
			<div class="make_star">
				<p>리뷰 별점 :</p>
				<div class="rating" data-rate="${dto.reviewStar }">
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>	
				</div>
			</div>
		</div>
		<div class="userReview-Text">
			<p><span>작성일 : <fmt:formatDate value="${dto.reviewDate }" pattern="yyyy-MM-dd"/></span></p>
			<p><span>리뷰내용 : ${dto.reviewContent}</span>
		</div>
		</div>
		</c:forEach>

		<c:if test="${empty reviewList }">
     			 등록된 리뷰가 없습니다.
    	  </c:if>




	</div>
</body>
</html>