<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔상세페이지</title>
</head>
<body>
<br />




<td align="center">
				<table border="1" bordercolor="skyblue " width ="500" height="800" align = "center" >
					
					
					<tr align = "center">
					<td colspan="2"> 
					<a href="hotelModify?hotelNo=${hotelCommand.hotelNo }" >수정하기</a></td>
					</tr>
					
					<tr align = "center">
						<td width="200">호텔 고유 번호</td>
						<td>${hotelCommand.hotelNo }</td>
					</tr>

					<tr align = "center">
						<td>호텔 이름</td>
						<td>${hotelCommand.hotelName }</td>
					</tr>
					
					<tr align = "center">
						<td>호텔주소</td>
						<td>${hotelCommand.hotelAddr }</td>
					</tr>
					
					<tr align = "center">
						<td>호텔 가격</td>
						<td><fmt:formatNumber value="${hotelCommand.hotelPrice }" type="currency"/> </td>
					</tr>
					
				
					
					<tr align = "center">
						<td>호텔 전화번호</td>
						<td>${hotelCommand.hotelPh }</td>
					</tr>
					
					<tr align = "center">
						<td>호텔 조식 가격</td>
						<td>${hotelCommand.hotelMealPrice }</td>
					</tr>
					
					<tr align = "center">
						<td>호텔 상세정보</td>
						<td>${hotelCommand.hotelContent }</td>
					</tr>
					
					<tr align = "center">
					<td colspan="2">
					<c:forTokens items="${hotelCommand.hotelImage }" delims="," var="hotelImage">
					<img src="../hotel/upload/${hotelImage }" /><br />
					</c:forTokens>
					</td>
					</tr>
					
					</table>
</td>


</body>
</html>

