<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 수정 페이지</title>
</head>


<body>

<form:form action="hotelUpdate" name="frm" method="post" modelAttribute="hotelCommand" enctype="multipart/form-data">

<input type="hidden" name="hotelNo" value="${hotelCommand.hotelNo }"/>



호텔이름 : <input type="text" name="hotelName" value="${hotelCommand.hotelName }"/>
	  <form:errors path="hotelName"/> <br />

호텔주소 : <input type="text" name="hotelAddr" value="${hotelCommand.hotelAddr }"/>
	  <form:errors path="hotelAddr"/> <br />

호텔전화번호 : <input type="number" name="hotelPh" value="${hotelCommand.hotelPh }"/>
	  <form:errors path="hotelPh"/> <br />

호텔 가격 : <input type="number" name="hotelPrice"   value="${hotelCommand.hotelPrice }"/>
      <form:errors path="hotelPrice"/><br />

호텔 조식 가격 : <input type="number" name="hotelMealPrice"   value="${hotelCommand.hotelMealPrice }"/>
      <form:errors path="hotelMealPrice"/><br />

호텔 침대 가격 : <input type="number" name="hotelBedPrice"  value="${hotelCommand.hotelBedPrice }"/>
      <form:errors path="hotelBedPrice"/><br />

호텔 룸타입 : <select name="hotelRoomType">
			<option value="2" 
			<c:if test="${hotelCommand.hotelRoomType == '2'}">selected</c:if> >2인실</option>
			<option value="4" 
			<c:if test="${hotelCommand.hotelRoomType == '4'}">selected</c:if>>4인실</option>
		</select> <br /> 
      

상세내용 : <textarea rows="5" cols="50" name="hotelContent">${hotelCommand.hotelContent }</textarea>
		<form:errors path="hotelContent"/><br />
		
파일
<br />
<c:forTokens items="${hotelCommand.hotelImage }" delims="," var="hotelImage">
<p>
	<span id="fileName">${hotelImage }</span>
	<input type="button" id="btn" value="삭제" onclick="fileDel(this)"/>
	</p>
</c:forTokens>

파일추가 : 
<input type="file" name="hotelImage" multiple="multiple" />

<!-- delims는 이미지를 한번에 불어오면 에러발생 그래서 이미지마다 ,로 구분 -->
<input type="hidden" id="fileDel1" name="fileDel1" />
<input type="submit" value="수정하기" />
<input type="button" value="삭제하기" onclick="javascript:location.href='hotelDel?hotelNo=${hotelCommand.hotelNo }'" />
<input type="button" value="리스트" />
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