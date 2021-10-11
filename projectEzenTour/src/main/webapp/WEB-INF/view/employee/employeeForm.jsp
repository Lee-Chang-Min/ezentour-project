<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원등록페이지</title>
</head>
<body>
<header>	
	<%@include file="../main/top.jsp" %>
</header>

<form:form action="empJoin" method="post" name="frm" modelAttribute="employeeCommand" >
<table border = 1 align="center">
	<tr>
		<td>사원번호</td>
		<td>                               				
			<form:input path="empNo" value="${empNo }"/>
			<form:errors path="empNo"/>
		</td>
	</tr>
	<tr>
		<td>사원아이디</td>
		<td>
			<form:input path="empId"/>
			<form:errors path="empId"/>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<form:password path="empPw"/>
			<form:errors path="empPw"/>
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>
			<form:input path="empName"/>
			<form:errors path="empName"/>
		</td>
	</tr>
	<tr>
		<td>입사일</td>
		<td>
			<input type="date" name="hireDate" />
			<form:errors path="hireDate"/>
		</td>
	</tr>
	<tr>
		<td>직무</td>
		<td>
			<form:input path="empType"/>
			<!-- <input type="text" name="jobId" value="${jobId}" -->
			<form:errors path="empType"/>
		</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>
			<form:input path="empPh" 
					placeholder="010-1234-1234"/>
			<form:errors path="empPh"/>
		</td>
	</tr>
	
	<tr>
		<td>이메일</td>
		<td>
			<form:input path="empEmail"  />
			<form:errors path="empEmail"/>
		</td>
		</tr>
	<tr>
		<td>사무실 주소</td>
		<td>
			<form:input path="empAddr"  />
			<form:errors path="empAddr"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="등록" />
		</td>
	</tr>
</table>
</form:form>
</body>
</html>