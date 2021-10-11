<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>상품페이지</title>

<%    
    int prodNo = 1;//Integer.parseInt(request.getParameter("prodNo"));
	int commentId = 1;//Integer.parseInt(request.getParameter("commentId"));
	int subCommentId = 1;// Integer.parseInt(request.getParameter("subCommentId"));
	String memId = request.getParameter("memId");	
%>
 
	<c:set var="prodNo" value="<%= prodNo%>"/>
	<c:set var="commentId" value="<%= commentId%>"/> <!-- 댓글번호 -->
	<c:set var="subCommentId" value="<%=subCommentId %>"/><!-- 답글번호 -->
	<c:set var="memId" value="<%=memId%>"/> <!-- 유저 아이디 -->
	
</head>

<body>
	<c:if test="${MemberCommand==null || memId != MemberCommand.memId}">
		<script>
			var memId = <%=memId%>;
			alert(<%=memId%>);
			alert("권한이 없습니다.");
        	window.opener.location.href= "/product/prodList?memId="+memId+"&comCtgr=1&commentNum=1";
    		window.close();
		</script>
	</c:if>
	<div class="container" align="center">
		<div class="col-lg-10">
			<div class="jumbotron" style="padding-top: 1px;">				
				<h3><br>댓글수정창<br></h3>
					<form id="Comment1Command" name="Comment1Command" enctype="multipart/form-data" method="post" onsubmit="return false;">
						<textarea id="comContent" name="comContent" style="width:400px;height:50px;" maxlength=1024 class="tbox"></textarea>
						<input type="button" onclick="javascript:CommentUpdate()" value="수정">
						<br><br>
						<c:if test="${subCommentId == 0}">
						<input type="file" id="newFile" name="newFile"/>
						</c:if>	
						<input type="hidden" id="commentId" name="commentId" value="${commentId}"/>
						<input type="hidden" id="prodNo" name="prodNo" value="${prodNo}"/>
						<input type="hidden" id="subCommentId" name="subCommentId" value="${subCommentId}"/>						
				</form>
			</div>
		</div>
		<div class="col-lg-10"></div>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/commentUpdate.js"></script>
</body>

</html>
