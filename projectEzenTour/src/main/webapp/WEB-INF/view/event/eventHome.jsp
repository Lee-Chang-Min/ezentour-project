<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/includeTags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<main id="main">
<div id="wrap">
<div class="memWrap">
		<h2 class="h">이벤트 리스트</h2>
			<div class="memList-wrap">
			<table border="1" align="center" width="960px" class="empTable" summary="No,Id,Name,job,Data,ph">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="5%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">구분</th>
						<th scope="col">제목</th>
						<th scope="col">등록일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${eventList}" var="dto" >
					<tr>
						<td>${dto.noticeNo }</td>
						<td>${dto.noticeKind }</td>
						<td><a href="../notice/noticeDetail?noticeNo=${dto.noticeNo }">${dto.noticeSub}</a></td>
						<td><fmt:formatDate value="${dto.noticeDate }" type="date" pattern="yyyy-MM-dd"/></td>
						<td>${dto.noticeCount }</td></tr>
					</c:forEach>
		
				</tbody>
						<tr><td colspan="8">
		<%@ include file="../include/pageeventList.jsp" %>
					</td></tr>
			</table>
								<div class="mypage-btn" align="center">
						<span><a href="../">홈으로</a></span>
							</div>
		</div>
	</div>

</div><!-- wrap / end -->
</main>
<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>
</body>
</html>