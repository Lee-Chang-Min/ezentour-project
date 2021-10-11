<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>QNA</title>


<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/qnaStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>


</head>
<body>
<header>
<%@include file="../main/top.jsp" %>
</header>

<!-- 게시글 리스트 -->
<div class="container" style="margin-top:100px; margin-bottom:100px;">
	<div class="card shadow">
		<div class="card-body">
			<h4 class="card-title">QNA게시판</h4>
			<table class="table table-hover" id='board_list'>
				<thead>
				
					<tr>
						<th class="text-center d-none d-md-table-cell">글번호</th>
						<th class="w-50">제목</th>
						<th class="text-center d-none d-md-table-cell">작성날짜</th>
					</tr>
				</thead>
				
				<tbody>
					
					<c:forEach var='obj' items="${qnaList}">
					<tr>
						<td class="text-center d-none d-md-table-cell">${obj.qnaNo }</td>
						<td><a href='read?qnaNo=${obj.qnaNo}'>${obj.qnaTitle }</a>
						<c:if test="${obj.qnaReply != null }">
						(답변완료)
						</c:if>
						</td>
						<td class="text-center d-none d-md-table-cell">${obj.qnaDate }</td>
						
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="d-none d-md-block">
				<ul class="pagination justify-content-center">
					<%-- <c:choose>
					<c:when test="${pageBean.prevPage <= 0 }">
					<li class="page-item disabled">
						<a href="#" class="page-link">이전</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }board/main?board_info_idx=${board_info_idx}&page=${pageBean.prevPage}" class="page-link">이전</a>
					</li>
					</c:otherwise>
					</c:choose>
					
					
					<c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
					<c:choose>
					<c:when test="${idx == pageBean.currentPage }">
					<li class="page-item active">
						<a href="${root }board/main?board_info_idx=${board_info_idx}&page=${idx}" class="page-link">${idx }</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }board/main?board_info_idx=${board_info_idx}&page=${idx}" class="page-link">${idx }</a>
					</li>
					</c:otherwise>
					</c:choose>
					
					</c:forEach>
					
					<c:choose>
					<c:when test="${pageBean.max >= pageBean.pageCnt }">
					<li class="page-item disabled">
						<a href="#" class="page-link">다음</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }board/main?board_info_idx=${board_info_idx}&page=${pageBean.nextPage}" class="page-link">다음</a>
					</li>
					</c:otherwise>
					</c:choose> --%>
					
				</ul>
			</div>
			
			<c:if test="${authInfo.userId != null}">
			<div class="text-right">
				<a href="write" class="btn btn-primary">글쓰기</a>
			</div>
			</c:if>

		</div>
	</div>
</div>


<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>

</body>
</html>






    