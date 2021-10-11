<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
회원정보 페이지입니다.<br />
아이디 : ${lists[0].memId } <br />
이름 : ${lists[0].memName } <br />
생년월일 :<fmt:formatDate value='${lists[0].memBirth }' type='date' pattern='yyyy-MM-dd'/>  <br />
성별 : ${lists[0].memGender } <br />
핸드폰번호 : ${lists[0].memPh } <br />
이메일 : ${lists[0].memEmail } <br />
수신여부 : <c:if test="${lists[0].memEmailAd == 'Y' }" > 
			이메일 수신 함
		</c:if> 
		<c:if test="${lists[0].memEmailAd == 'N'}" > 
			이메일 수신 안함
		</c:if>
		<br />
주소 : ${lists[0].memAddr } <br />
상세주소 : ${lists[0].memAddrDetail } <br />
우편번호 : ${lists[0].memAddrPost } <br />

<a href="../memMod/${lists.get(0).memId }">수정</a>
</body>
</html>