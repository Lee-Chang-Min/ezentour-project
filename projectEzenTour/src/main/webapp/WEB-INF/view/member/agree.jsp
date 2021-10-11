<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/agree.js"></script>

<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/loginStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">


<script type="text/javascript">
$(function(){
	$("[name=checkAll]").click(function(){
		allCheckFunc( this );
	});
	$("[name=agree]").each(function(){
		$(this).click(function(){
			oneCheckFunc( $(this) );
		});
	});
});
</script>
</head>
<body>
<header>	
	<%@include file="../main/top.jsp" %>
</header>

<main id="main">
<div id="wrap" class="wrap">


	<form action="memRegist" method="post">
	<div class="join-wrap">
		<h2 class="h">회원가입</h2>
		<ul>
			<li class="all_agree">
				<input type="checkbox" name="checkAll">
				<label>전체약관에 동의합니다.</label>	
			</li>
			<li><p>필수동의항목</p></li>
			<li>
				<input type="checkbox" name="agree">
				<label>이용약관</label>
			</li>
			<li>
				<input type="checkbox" name="agree">
				<label>회원 이용약관</label>
			</li>
			<li>
				<input type="checkbox" name="agree">
				<label>개인정보 수집 및 이용에 대한 안내</label>
			</li>
			<li>
				<input type="checkbox" name="agree">
				<label>개인정보 위탁 안내</label>
			</li>
			<li>
				<span>
					* 개인정보의 수집, 제공 및 활용에 동의하지 않을 권리가 있으며,<br/>
					미동의시 회원가입 및 여행서비스의 제공이 제한됩니다.
				</span>
			</li>
			<li><p>선택동의항목</p></li>
			<li>
				<input type="checkbox" name="agree">
				<label>고유식별정보 수집 및 이용에 대한 안내</label></li>
			<li>
				<td><input type="checkbox" name="agree">
				<label>개인정보 제3자 제공 및 공유 안내</label>
			</li>
		</ul>
		
		<input type="submit" value="다음" />
	</div>
	
	</form>



</div>

</main>



<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>


</body>
</html>