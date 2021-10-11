<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="<c:url value="/css/shop-homepage.css" />" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/vendor/bootstrap/css/bootstrap.min.css">

<title>상품페이지</title>
<%    
	int prodNo = 1;//Integer.parseInt(request.getParameter("prodNo"));     
	int comCtgr = 1;//Integer.parseInt(request.getParameter("comCtgr"));     
	int commentNum = 1; //Integer.parseInt(request.getParameter("commentNum"));  
	
%>

<style>

</style>

<c:set var="prodNo" value="<%=prodNo%>" />
<c:set var="comCtgr" value="<%=comCtgr%>" />
<!-- bbs카테고리 -->
<c:set var="commentNum" value="<%=commentNum%>" />
<!-- comment페이징 -->

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">

<!-- Custom styles for this template -->
<link type="text/css"
	href="${pageContext.request.contextPath}/resources/css/shop-homepage.css"
	rel="stylesheet">
</head>


<div class="col-lg-9">
	<br>
	<div id="carouselExampleIndicators">
		<br>
		<form id="ProdCommand" name="ProdCommand">
			<table class="table borderless">
				<colgroup>
					<col width="30%">
					<col width="25%">
					<col width="55%">
				</colgroup>
				<tbody id="tbody">

				</tbody>
			</table>
			
		
			<input type="hidden" id="prodNo" name="prodNo" value="${prodNo}" />
			<!-- 게시글 번호 -->
			<input type="hidden" id="comCtgr" name="comCtgr"
				value="${comCtgr}" />
			<!-- 후기orQ&A카테고리번호 -->
			<input type="hidden" id="commentNum" name="commentNum"
				value="${commentNum}" />
			<!-- comment페이징 -->
			<input type="hidden" id="memID" name="memID"
				value="${MemberCommand.memID}" />
		</form>


		<nav>
			<ul class="nav-container">
				<li class="nav-item"><a class="nav-link active"
						href="/product/prodList?prodNo=${prodNo}&comCtgr=1&commentNum=1">후기</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/product/prodList?prodNo=${prodNo}&comCtgr=2&commentNum=1">Q&A</a></li>
						
						
						
				<c:if test="${comCtgr==1}">
					<li class="nav-item"><a class="nav-link active"
						href="/product/prodList?prodNo=${prodNo}&comCtgr=1&commentNum=1">후기</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/product/prodList?prodNo=${prodNo}&comCtgr=2&commentNum=1">Q&A</a></li>
				</c:if>
				<c:if test="${comCtgr==2}">
					<li class="nav-item"><a class="nav-link"
						href="/product/prodList?prodNo=${prodNo}&comCtgr=1&commentNum=1">후기</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="/product/prodList?prodNo=${prodNo}&comCtgr=2&commentNum=1">Q&A</a></li>
				</c:if>
			</ul>
		</nav>


		<table class="table">
			<tbody id="comCtgr">

			</tbody>
		</table>


		<!-- 댓글리스트 -->
		<div id=tcomment>
			<input type="hidden" id="memId" name="memId"
				value="${MemberCommand.memId}" /> <input type="hidden" id="grade"
				name="grade" value="${AuthInfoDTO.grade}" />
			<!-- 관리자여부 -->
		</div>
		<!-- 페이징 -->
		<div class="page_wrap" id=tPaging></div>
		<!-- 댓글 작성칸 -->
		<div class="form-group">
			<form id="Comment1Command" name="Comment1Command"
				enctype="multipart/form-data" method="post" onsubmit="return false;">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<colgroup>
						<col width="10%">
						<col width="70%">
						<col width="20%">
					</colgroup>
					<tr>
						<c:if test="${comCtgr==1}">
							<td colspan=3>소중한 후기를 남겨주세요^^</td>
						</c:if>
						<c:if test="${comCtgr==2}">
							<td colspan=3>궁금하신게 있다면 언제든지 물어보세요^^</td>
						</c:if>
					</tr>
					<tr>
						<td style="border-bottom: none;" valign="middle"><br> <br>${MemberCommand.memId}</td>
						<td><textarea id="content" name="content" cols="70" rows="5"
								maxlength="2048" class="tbox" /></textarea></td>
						<td style="text-align: center;"><br> <br> <c:if
								test="${comCtgr==1}">
								<button type="button" class="btn btn-primary"
									onclick="javascript:UserReview();">작성</button>
							</c:if> <c:if test="${comCtgr==2}">
								<button type="button" class="btn btn-primary"
									onclick="javascript:CommentWrite();">작성</button>
							</c:if></td>
					</tr>
					<tr>
						<td colspan="3"><input type="file" id="fileName"
							name="fileName"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

 
   



<!-- Bootstrap core JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bbsView.js"></script>
</body>


</html>