<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 마이페이지</title>

<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/employee.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">

</head>
<body>
<header>	
	<%@include file="../main/top.jsp" %>
</header>
<main id="main">
<div id="wrap">
	
	<div class="empMypage-wrap">
		<h2 class="h">직원 페이지
			<p class="text2">${emp.empName }님의 정보입니다.</p>
		</h2>
		<table border="1" width="750">
			<tr>
				<td>사원번호</td>
				<td>${emp.empNo}</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${emp.empId }</td>
			<tr>
				<td>이름</td>
				<td>${emp.empName }</td>
			<tr>
				<td>입사일</td>
				<td><fmt:formatDate value="${emp.hireDate }" type="date" pattern="yyyy-MM-dd"/></tr>
			<tr>
				<td>직무</td>
				<td>${emp.empType }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${emp.empPh }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${emp.empEmail }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${emp.empAddr }</td>
			</tr>
		</table>
	</div><!-- empMypage-wrap/끝 -->
	<div class="mypage-btn">
		<span><a href="empModify?empId=${emp.empNo }">수정</a></span>
		<span><a href="empList" >리스트로 가기</a></span>
	</div>
</div><!-- wrap / end -->
</main>

<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>

</body>
</html>