<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>

<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/member.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">

<!--  -->
<script>

	function popup(){
		var url = "${pageContext.request.contextPath}/chatPop.jsp";
        var name = "popup test";
        var option = "width = 500, height = 700, top = 100, left = 200, location = no"
        window.open(url, name, option);
    }
</script>



</head>
<body>
<header>	
	<%@include file="../main/top.jsp" %>
</header>
<main id="main">
<div id="wrap">

	<div class="memWrap">
		<h2 class="h">회원 리스트</h2>
			<div class="memList-wrap">
			<table border="1" align="center" width="960px" class="empTable" summary="No,Id,Name,job,Data,ph">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="10%">
					<col width="40%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">연락처</th>
						<th scope="col">이메일</th>
						<th scope="col">주소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${lists }" var="dto">
					<tr>
						<td><a href="member/memInfo/${dto.memId }">${dto.memId }</a></td>
						<td>${dto.memName }</td>
						<td>${dto.memPh }</td>
						<td>${dto.memEmail }</td>
						<td>우편번호 : ${dto.memAddrPost } )<br/> ${dto.memAddr } ${dto.memAddrDetail }</td>					
					</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>

</div><!-- wrap / end -->
</main>

<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>

</body>
</html>