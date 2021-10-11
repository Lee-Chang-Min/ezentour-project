<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<form action="prodJoin" method="post" name="frm" enctype="multipart/form-data">
	<table border = 1 align="center">
		<tr><th>상품 번호</th>
			<td><select name="prodTheme" >
					<option value="heeling">자연/힐링</option>
					<option value="activity">액티비티</option>
					<option value="food">맛집</option>
					<option value="histroy">문화탐방</option>
				</select>
				<input type="text" name="prodNo" 
						value="${prodNo }" readonly="readonly"/>
				</td> </tr>	
					
		<tr><th>상품명</th>
			<td><input type="text" name="prodName" /></td></tr>
			
		<tr><th>지역</th>
			<td>
			<select name="prodLocation" >
					<option value="서울">서울</option>
					<option value="경기도">경기도</option>
					<option value="제주도">제주도</option>
					<option value="경상도">경상도</option>
			</select>
			</td></tr>
			
		<tr><th>가격</th>
			<td><input type="text" name="prodPrice" /></td></tr>
			
		<tr><th>최대 인원</th>
			<td><input type="text" name="maxPer"/></td></tr>
		
		<tr><th>여행시작 날짜</th>
			<td><input type="date" value="" name="prodSDate"/></td></tr>
			
		<tr><th>여행끝 날짜</th>
			<td><input type="date" value="" name="prodEDate"/></td></tr>
			
		<tr><th>상품 관련 호텔 고유 번호</th>
			<td><input type="text" name="hotelNo"/></td></tr>
			
		<tr><th>내용</th>
			<td><textarea rows="6" cols="50" name="prodDetail"></textarea></td></tr>
			
		<tr><th>이미지파일</th>
			<td><input type="file" name="prodImage" multiple="multiple"/></td></tr>
		<tr><th colspan="2">
			<input type="submit" value="여행 상품 등록" />
			<input type="reset" value="취소" />
			<input type="button" value="홈으로"  onclick="javascript:location.href='main'"/> 
			</th></tr>
		</table> 
</form>
</body>
</html>







