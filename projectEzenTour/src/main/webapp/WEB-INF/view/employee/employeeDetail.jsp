<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

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
		<h2 class="h">마이페이지
			<span class="text2">${employeeCommand.empName }님, 안녕하세요</span>
		</h2>
		<table border = 1 align="center" width="750">
			<tr>
				<td>사원번호</td>
				<td>${employeeCommand.empNo }</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${employeeCommand.empId }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${employeeCommand.empName }</td>
			</tr>
			<tr>
				<td>입사일</td>
				<td><fmt:formatDate value="${employeeCommand.hireDate }" type="date" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td>직무</td>
				<td>${employeeCommand.empType }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${employeeCommand.empPh }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${employeeCommand.empEmail }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${employeeCommand.empAddr }</td>
			</tr>
		</table>
	</div><!-- empMypage-wrap/end -->
		
		<div class="mypage-btn">
			<span><a href="${pageContext.request.contextPath}/emp/empList" >리스트로 가기</a></span>
		</div>
	

</div><!-- wrap / end -->
</main>
</body>
</html>