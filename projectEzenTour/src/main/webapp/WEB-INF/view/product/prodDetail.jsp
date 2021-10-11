<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행상품상세페이지</title>
</head>
<body>
<br />


	
<td align="center">
		
			<table border="1" bordercolor="skyblue " width="500" height="800" align="center">


				<tr align="center">
				<td colspan="2">
				<a href="prodModify?prodNo=${prodCommand.prodNo }">수정하기</td>
				</tr>

				<tr align="center">
					<td>상품명</td>
					<td>${prodCommand.prodName }</td>
				</tr>

				<tr align="center">
					<td>상품테마</td>
					<td>${prodCommand.prodTheme }</td>
				</tr>

				<tr align="center">
					<td>상품 가격</td>
					<td><fmt:formatNumber value="${prodCommand.prodPrice }" type="currency" /></td>
				</tr>

				<tr align="center">
					<td>상품지역</td>
					<td>${prodCommand.prodLocation }</td>
				</tr>

				<tr align="center">
					<td>최대 인원</td>
					<td>${prodCommand.maxPer }</td>
				</tr>

				<tr align="center">
					<td>시작날짜</td>
					<td>${prodCommand.prodSDate }</td>
				</tr>

				<tr align="center">
					<td>끝날짜</td>
					<td>${prodCommand.prodEDate }</td>
				</tr>
				
				<tr align="center">
					<td> 호텔 고유 번호</td>
					<td>${prodCommand.hotelNo }</td>
				</tr>

				<tr align="center">
					<td>여행 상품 상세정보</td>
					<td>${prodCommand.prodDetail }</td>
				</tr>

				<tr align="center">
				<td colspan="2">
				<c:forTokens items="${prodCommand.prodImage }" delims="," var="prodImage">
				<img src="../product/upload/${prodImage }" />
				</c:forTokens>
				</td>
				</tr>

			</table>




</td>

</body>
</html>


