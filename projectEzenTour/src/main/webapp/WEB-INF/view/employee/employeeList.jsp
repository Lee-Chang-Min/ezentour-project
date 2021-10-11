<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 리스트</title>

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
	
	<div class="empWrap">
		<h2 class="h">직원 리스트</h2>
			<div class="empList-wrap">
			<c:if test="${!empty empList }">
			<table border="1" align="center" width="960px" class="empTable" summary="No,Id,Name,job,Data,ph">
				
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">사원번호</th>
						<th scope="col">사원아이디</th>
						<th scope="col">이름</th>
						<th scope="col">직무</th>
						<th scope="col">입사일</th>
						<th scope="col">핸드폰번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${empList }" var="dto">
					<tr>
						<td><a href="empInfo?empId=${dto.empNo }">${dto.empNo }</a></td>
						<td>${dto.empId}</td>
						<td>${dto.empName}</td>
						<td>${dto.empType}</td>
						<td><fmt:formatDate value="${dto.hireDate}" type="date" pattern="yyyy-MM-dd"/></td>
						<td>${dto.empPh}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</c:if>
			
			<c:if test="${empty empList }">
			<p>등록된 직원 없습니다.</p>
			</c:if>
			<button><a href="empRegist">직원등록</a></button>
		
		</div>
	</div>


</div><!-- wrap / end -->
</main>


<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>

</body>
</html>