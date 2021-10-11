<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>	

</header>

	<h2>마이페이지asdfasdfasdfasdf</h2>
	<div>
		<p>${employeeCommand.empName }님, 안녕하세요</p>
		<ul>
			<li>사원번호 : ${employeeCommand.empNo }</li>
			<li>아이디 : ${employeeCommand.empId }</li>
			<li>비밀번호 : ${employeeCommand.empPw }</li>
			<li>이름 : ${employeeCommand.empName }</li>
			<li>입사일: <fmt:formatDate value="${employeeCommand.hireDate }" type="date" pattern="yyyy-MM-dd"/></li>
			<li>직무 : ${employeeCommand.empType }</li>
			<li>연락처 : ${employeeCommand.empPh }</li>
			<li>이메일: ${employeeCommand.empEmail }</li>
			<li>주소 : ${employeeCommand.empAddr }</li>
		</ul>
</div>
<div class="mypage-btn">
	<a href="empModify?empId=${employeeCommand.empId }">수정</a> 
</div>

</body>
</html> --%>