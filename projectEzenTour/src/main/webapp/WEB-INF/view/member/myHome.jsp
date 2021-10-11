<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 페이지</title>
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/member.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">

</head>
<body>
<header>	
	<%@include file="../main/top.jsp" %>
</header>
<main id="main" class="main">
<div id="wrap">
	
	<div class="mem-wrap">
		<h2 class="h">마이 페이지
			<span class="text2">수정려면 아래 버튼 클릭해주세요.</span>
		</h2>
		<div class="mypage-btn">
			<span><a href="../memMy/memMyMod">내정보</a></span>
			<span><a href="../pl/OrderProcessList">구매확인</a></span>
			<span><a href="../cp/coupon">쿠폰함</a></span>
			<span><a href="../memMy/memPwChange">비밀번호 변경</a></span>
		</div>
	</div>
	
	
	
</div>
</main>	
<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>
</body>
</html>