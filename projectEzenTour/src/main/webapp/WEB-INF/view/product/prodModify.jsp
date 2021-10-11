<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>여행 상품 수정 페이지</title>
</head>


<body>
<form:form action="prodUpdate" name="frm" method="post" modelAttribute="prodCommand" enctype="multipart/form-data">
<input type="hidden" name="prodNo" value="${prodCommand.prodNo }"/> 


여행상품이름 : <input type="text" name="prodName" value="${prodCommand.prodName }"/>
	  <form:errors path="prodName"/> <br />

호텔 고유번호 : <input type="text" name="hotelNo"  value="${prodCommand.hotelNo }"/><br/>

여행상품 가격 : <input type="text" name="prodPrice" value="${prodCommand.prodPrice }"/>
	  <form:errors path="prodPrice"/> <br />

여행 최대인원 : <input type="text" name="maxPer" value="${prodCommand.maxPer }"/>
	  <form:errors path="maxPer"/> <br />

여행상품 지역 : <select name="prodLocation">

			<option value="서울" 
			<c:if test="${prodCommand.prodLocation == '서울'}">selected</c:if>>서울 </option>
			<option value="경기도" 
			<c:if test="${prodCommand.prodLocation == '경기도'}">selected</c:if>> 경기도 </option>
			<option value="제주도"
			<c:if test="${prodCommand.prodLocation == '제주도'}">selected</c:if>> 제주도 </option>
			<option value="경상도"
			<c:if test="${prodCommand.prodLocation == '경상도'}">selected</c:if>> 경상도 </option>
		</select>
      <form:errors path="prodLocation"/><br />

여행 시작 날짜 : <input type="DATE" name="prodSDate"   value="${prodCommand.prodSDate }"/>
      <form:errors path="prodSDate"/><br />

여행 끝 날짜 : <input type="DATE" name="prodEDate"  value="${prodCommand.prodEDate }"/>
      <form:errors path="prodEDate"/><br />

여행테마 : <select name="prodTheme">

			<option value="heeling" 
			<c:if test="${prodCommand.prodTheme == 'heeling'}">selected</c:if>> 자연/힐링 </option>
			<option value="activity" 
			<c:if test="${prodCommand.prodTheme == 'activity'}">selected</c:if>> 액티비티 </option>
			<option value="food"
			<c:if test="${prodCommand.prodTheme == 'food'}">selected</c:if>> 맛집 </option>
			<option value="histroy"
			<c:if test="${prodCommand.prodTheme == 'histroy'}">selected</c:if>> 문화탐방 </option>
		</select>
      

상세내용 : <textarea rows="5" cols="50" name="prodDetail">${prodCommand.prodDetail }</textarea>
		<form:errors path="prodDetail"/>
		<br />
<br />	
파일
<br />
<c:forTokens items="${prodCommand.prodImage }" delims="," var="prodImage">
<p>
	<span id="fileName">${prodImage }</span>
	<input type="button" id="btn" value="삭제" onclick="fileDel(this)"/>
	</p>
</c:forTokens>

파일추가 : 
<input type="file" name="prodImage" multiple="multiple" />

<!-- delims는 이미지를 한번에 불어오면 에러발생 그래서 이미지마다 ,로 구분 -->
<input type="hidden" id="fileDel1" name="fileDel1" />
<input type="submit" value="수정하기" />
<input type="button" value="삭제하기" onclick="javascript:location.href='prodDel?prodNo=${prodCommand.prodNo }'" />
<input type="button" value="리스트" onclick="javascript:location.href='prodList?prodNo=${prodCommand.prodNo }'" /> />
</form:form> 


 <!-- 이미지 삭제버튼 스크립트 -->
 <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript">

	function fileDel(btn) {
		var delFile = $("#fileDel1").val()
		if ($(btn).attr("value") == "삭제") {
			$(btn).attr("value", "삭제취소");
			$("#fileDel1").val(
					$(btn).parent().children("#fileName").text().trim() + ","
							+ delFile)
		} else {
			$(btn).attr("value", "삭제");
			fileName = $(btn).parent().children("#fileName").text().trim()
					+ ",";
			$("#fileDel1").val(delFile.replace(fileName, ""));
		}
	}
	
</script> 
</body>
</html>