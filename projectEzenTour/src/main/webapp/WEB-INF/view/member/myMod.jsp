<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/includeTags.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 

<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/member.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">

</head>
<body>

<header>	
	<%@include file="../main/top.jsp" %>
</header>
<main id="main" class="main">
<div id="wrap">
	회원정보 수정 

	<form action="memModAction" method="post" name="frm"> 
 	<!-- command에서 데이트포멧줘서 무조건 갑을 줘야한다  -->
		<table border = 1 align="center">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="memId"  value="${dto.memId }" readonly="readonly"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${dto.memName }</td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td><input type="text" name="memAddrPost" id="sample4_postcode" value="${dto.memAddrPost }"></td>   <!-- id를 써줘야 api사용가능   -->
			<form:errors path="memAddrPost"></form:errors>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="memAddr" id="sample4_roadAddress" size="30" value="${dto.memAddr }"><a href="javascript:sample4_execDaumPostcode();" >주소 검색</a></td>
			<form:errors path="memAddr"></form:errors>
		</tr>
		<tr><td>상세주소</td>
			<td><input type="text" name="memAddrDetail" value ="${dto.memAddrDetail }"></td></tr>
			<form:errors path="memAddrDetail"></form:errors>
		<tr><td>연락처</td>
			<td><input type="text" name="memPh" value="${dto.memPh }"></td></tr>
			<form:errors path="memPh"></form:errors>
		<tr><td>이메일</td>
			<td><input type="text" name="memEmail" value ="${dto.memEmail }"></td></tr>
			<form:errors path="memEmail"></form:errors>
		<tr><td>생년월일</td>
			<td><fmt:formatDate value="${dto.memBirth}" />
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<c:if test="${dto.memGender == 'M'}"> 남자  </c:if>			
				<c:if test="${dto.memGender == 'F'}"> 여자  </c:if>			
			</td>
		</tr>
		
		<tr>
			<td>이메일 수신여부</td>
			<td>
				<input type="radio" name="memEmailAd" value="Y" <c:if test="${dto.memEmailAd == 'Y' }">checked</c:if>> 예 
				<input type="radio" name="memEmailAd" value="N" <c:if test="${dto.memEmailAd == 'N'}">checked</c:if>>아니오
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정완료" />
				<input type="button"  value="이전" onclick="javascript:history.back();" /> <!--이전페이지로 이동한다   -->
				<input type ="button" value="회원탈퇴" onclick ="drop('${dto.memId}')"> <!-- .mem은 스프링에서는 안쓴다  -->
			</td>
		</tr>
	</table>
	</form>
<script type="text/javascript">
	function drop(data) {
		const con = confirm("회원탈퇴 하시겠습니까?");
		if(con == true){
			location.href="memDrop?memId=" + data;
		}
	}	
</script>





</div>
</main>	
<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>


</body>
</html>