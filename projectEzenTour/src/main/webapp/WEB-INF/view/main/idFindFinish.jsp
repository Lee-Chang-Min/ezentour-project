<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
  <%@include file="../include/includeTags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${memId == null }">
	잘못된 정보 이거나 없는 정보 입니다.
	다시입력 하시기 바랍니다.
</c:if>
<c:if test="${memId != null }">
	찾으시는 아이디는  " ${memId} " 입니다.
</c:if>
<a href="../">메인페이지가기</a>
</body>
</html>