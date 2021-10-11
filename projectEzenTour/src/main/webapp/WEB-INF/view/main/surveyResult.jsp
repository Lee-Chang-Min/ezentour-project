<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/includeTags.jsp" %>    
<c:set var='root' value='${pageContext.request.contextPath }/'/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#pop-continer{background: #fff;position: relative;z-index: 1;}
#pop-continer h1{margin: 5px 0; font-size:30px;}
.pop-wrap p{font-size:19px;}

.close-wrap{width:100%; background-color:#000; color:#fff; position: relative; z-index: 2; left:0; bottom:2px;}
.close-wrap span a{color:#fff; display: inline-block; padding:5px;}
</style>
<script type="text/javascript">

function closeWin() {
	self.close();
}

</script>

</head>
<body>
<div id="pop-continer" >
<h1>여행을 사랑하는 당신을 위한<br> 맞춤 여행지 추천!</h1>
	<!-- 추천 결과 -->
	<!--  <img width="200" height="200" alt="사진없슈" src="../product/upload/${dto.hotelImage.split(',')[0] }" />
	<img width="200" height="200" alt="사진없슈" src="../product/upload/${dto.prodImage.split(',')[0] }" />--> 
	<div class="pop-wrap">
	<c:forEach items="${list }" var="dto">
		<c:if test="${dto.prodName != null}">
			<p>여행지 : ${dto.prodName }</p>
			<span><img src="product/upload/${fn:replace(dto.prodImage, ',','')}"  width="300px" height="300px"/></span>
			
			<p>호텔 : ${dto.hotelName }</p>
			<span><img src="hotel/upload/${fn:replace(dto.hotelImage,',','')}" width="300px" height="300px"/></span>
		</c:if>
		<!-- 널일때 ? 왜안될까 -->
	</c:forEach>
	<div class="close-wrap">
	<span><a href="#" onclick="closeWin()">[닫기]</a></span>
	</div>
	</div>

	
</div>	
</body>
</html>