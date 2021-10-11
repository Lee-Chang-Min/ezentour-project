<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- css 
#F05522 -->
<body>
<form action="reviewUpdate" >

	<h2>별점주기</h2>
	<div class="make_star">
		<select name="reviewStar" id="makeStar">
			<option value="1" <c:if test="${dto.reviewStar == 1}">selected</c:if>>1</option>
			<option value="2" <c:if test="${dto.reviewStar == 2}">selected</c:if>>2</option>
			<option value="3" <c:if test="${dto.reviewStar == 3}">selected</c:if>>3</option>
			<option value="4" <c:if test="${dto.reviewStar == 4}">selected</c:if>>4</option>
			<option value="5" <c:if test="${dto.reviewStar == 5}">selected</c:if>>5</option>
		</select>
		<div class="rating" data-rate="${dto.reviewStar }">
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>	
		</div>
	</div>
	<input type="hidden" value="${prod }" name="prodNo"> 
	<input type="hidden" value="${pay }" name="paymentNo"> 
	<textarea rows="5" cols="30" name="reviewContent">${dto.reviewContent }</textarea>
	<input type="submit" value="작성">
</form>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
<script type="text/javascript">
$(function(){
var rating = $('.rating');

rating.each(function(){
	var targetScore = $(this).attr('data-rate');
	console.log(targetScore);
	$(this).find('svg:nth-child(-n+' + targetScore + ')').css({color:'#F05522'});
  });
	
	var userScore = $('#makeStar');
	userScore.change(function(){
		var userScoreNum = $(this).val();
		console.log(userScoreNum);
		$('.make_star svg').css({color:'#000'});
		$('.make_star svg:nth-child(-n+' + userScoreNum + ')').css({color:'#F05522'});
	});
	
	/* $('.make_star svg').click(function(){
		var targetNum = $(this).index() + 1;
		$('.make_star svg').css({color:'#000'});
		$('.make_star svg:nth-child(-n+' + targetNum + ')').css({color:'#F05522'});
	}); */
});
</script>
</body>
</html>