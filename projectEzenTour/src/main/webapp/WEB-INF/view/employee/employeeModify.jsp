<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<h2 class="h">직원 페이지 (수정)</h2>
			<p class="text1">${emp.empName }님의 정보를 수정 합니다.</p>
			<form action="empModifyOk" method="post" name="frm">
			<input type="hidden" name="empId"  value="${emp.empId }"/>
			
			<table border = 1 align="center" width="750">
				<tr>
					<td>사원번호</td>
					<td> ${emp.empNo}</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${emp.empId}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="empName" value="${emp.empName}" /></td>
				</tr>
				<tr>
					<td>입사일</td>
					<td><fmt:formatDate value="${emp.hireDate}" type="date" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<td>직무</td>
					<td>${emp.empType }</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="text" name="empPh" placeholder="010-1234-1234" value="${emp.empPh }"/>
					</td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="empEmail" value="${emp.empEmail }"/>
					</td>
				</tr>
				<tr>
					<td>사무실 주소</td>
					<td>
						<input type="text" name="empAddr" value="${emp.empAddr }"/>
					</td>
				</tr>
				
			</table>
			
			<div class="mypage-btn pdTop40">
				<span><input type="submit" value="직원정보 수정" /></span>
				<span><input type="button" value="직원 삭제" onclick="javascript:location.href='empDelete?empId=${emp.empId }'"/></span>
			</div>
			
			
			</form>
	</div><!-- empMypage-wrap / end -->
</div><!-- wrap / end -->
</main>
</body>
</html>