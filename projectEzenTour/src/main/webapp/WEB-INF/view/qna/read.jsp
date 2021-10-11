<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath }/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>QNA Read</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					
					<div class="form-group">
						<label for="board_date">작성날짜</label>
						<input type="text" id="board_date" name="board_date" class="form-control" value="${readQnaBean.qnaDate }" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="board_subject">제목</label>
						<input type="text" id="board_subject" name="board_subject" class="form-control" value="${readQnaBean.qnaTitle }" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="board_content">내용</label>
						<textarea id="board_content" name="board_content" class="form-control" rows="10" style="resize:none" disabled="disabled">${readQnaBean.qnaContent }</textarea>
					</div>
					<c:if test="${readQnaBean.qnaReply!=null}">
					<div class="form-group">
						<label for="board_content">답변내용</label>
						<textarea id="board_content" name="qna_reply" class="form-control" rows="10" style="resize:none" disabled="disabled">${readQnaBean.qnaReply }</textarea>
					</div>
					</c:if>
					<div class="form-group">
						<div class="text-right">
							<a href="${root }qna/main" class="btn btn-primary">목록보기</a>
							<%-- <c:if test="${readQnaBean.userId == authInfo.userId}"> --%>
							<a href="${root }qna/modify?qnaNo=${readQnaBean.qnaNo }" class="btn btn-info">수정하기</a>
							<a href="${root }qna/delete?qnaNo=${readQnaBean.qnaNo }" class="btn btn-danger">삭제하기</a>
							<%-- </c:if> --%>
							<c:if test="${readQnaBean.qnaReply==null}">
								<a href="${root }qna/reply?qnaNo=${readQnaBean.qnaNo }" class="btn btn-warning">답변하기</a>
							</c:if>
							<%-- <c:if test="${authInfo.grade == 1}"> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>



</body>
</html>
    