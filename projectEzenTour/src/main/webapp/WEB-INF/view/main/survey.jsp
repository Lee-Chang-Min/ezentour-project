<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/includeTags.jsp" %>    
<c:set var='root' value='${pageContext.request.contextPath }/'/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${root }recommand" >
		<div id="Q1">
			<h1>질문 .1</h1>
			<input type="radio" name="hotelType" value="hotel" checked/>호텔
			<input type="radio" name="hotelType" value="pension"/>팬션
			<br><br>
			<span onclick="nextPage()">다음</span> 
		</div>
		<div id="Q2" style="display:none;">
			<h1>질문 .2</h1>
			<input type="radio" name="prodTheme" value="food" checked/>맛집
			<input type="radio" name="prodTheme" value="heeling"/>자연/힐링
			<input type="radio" name="prodTheme" value="activity"/>액티비티
			<input type="radio" name="prodTheme" value="histroy"/>문화탐방
			<br><br>
			<input type="submit" value="결과 확인">			
		</div>
	</form>
	
	
	<br>

<script type="text/javascript">

const Que1 = document.querySelector("#Q1");
const Que2 = document.querySelector("#Q2");
function nextPage() {
	Que1.style.display = 'none';
	Que2.style.display = 'block';
}



</script>
</body>
</html>