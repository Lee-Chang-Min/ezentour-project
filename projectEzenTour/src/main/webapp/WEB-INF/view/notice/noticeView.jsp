<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ include file="../include/includeTags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/member.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/employee.css" rel="stylesheet" type="text/css">
</head>
<body>
	
<header>	
	<%@include file="../main/top.jsp" %>
</header>

	<h2 class="h">공지사항</h2>
	<table>
		<tr><td>글 번호: ${dto.noticeNo }</td></tr>
		<tr><td>글 제목:${dto.noticeSub }</td></tr>
		<tr><td><textarea rows="5" cols="60" >${dto.noticeCon }</textarea></td></tr>
		<tr><td>등록일: ${dto.noticeDate }</td></tr>
		<tr><td>종류: ${dto.noticeKind }</td></tr>
		<tr><td>읽은귀염둥이들~: ${dto.noticeCount }</td></tr>
		<tr><td>등록한 사원변호: ${dto.empId }</td></tr>
	</table>
<br/>
<br/>
<br/>
<br/>
<br/>

<c:if test="${!empty authInfo }">
<c:if test="${authInfo.grade != 1 }">
<a href="noticeUpdate?noticeNo=${ dto.noticeNo}">수정</a> 
</c:if>
</c:if>
<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>
</body>
</html>