<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
       <%@ include file="../include/includeTags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/mainStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">

</head>
<body>
<header>	
	<%@include file="../main/top.jsp" %>
</header>

<main id="main" class="main">
<div id="wrap" class="wrap">


		<table>
		<tr><td>이름</td>
			<td>사진</td></tr>
		
		<c:forEach items="${searchList}" var="sList">
			<tr><td>${sList.prodName }</td>
				<td><img src="product/upload/${sList.prodImage.split(',')[0] }" /></td>
				</tr>
		</c:forEach>
		</table>



</div>
</main>
<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>

</body>
</html>