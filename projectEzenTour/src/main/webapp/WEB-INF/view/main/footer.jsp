<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title> 
</head>
<body>

<footer id='footer'>
	<div  class='footer-wrap'>
		<div class="footerWapper">
			<div class='footer-company-wrap'>
				<span><a href='#'>회사소개</a></span>
				<span><a href='#'>이용약관</a></span>
				<span><a href='#'>개인정보처리방침</a></span>
				<span><a href='#'>여행약관</a></span>
				<span><a href='#'>해외여행자보험</a></span>
				<span><a href='#'>마케팅제휴</a></span>
				<span><a href='#'>공식인증예약센터</a></span>
				<span><a href="${root }emp/empList">직원 리스트</a></span>
			</div>
		</div>
		<div class='underLine'></div>
		<div class='footer-address-wrap'>
			<ul class='floatclear'>
				<li class='footer-bottom-left'>
					<div class='floatclear'>
						<address>
							(주)숭무투어대표 : 김숭무, 김오니 주소 : (03161) 서울 서초구 서초대로77길 54 서초더블유타워 13층
							사업자등록번호 : 181-18-18181 사업자정보확인통신판매업신고번호 : 강남01-겁나멀어호 관광사업자 등록번호 : 제1993-000006호
						</address>
						<address>
						개인정보 보호책임자 : 이상오 영업보증보험 : 단돈100원 가입팩스: 02-734-0392 이메일 : cs@soongmutour.com 고객센터  
						※ 부득이한 사정에 의해 여행일정이 변경되는 경우 사전 동의를 받습니다.
						※ 하나투어는 개별 항공권, 단품 및 일부 여행상품에 대하여 통신판매중개자로서 통신판매의 당사자가 아니며 해당상품의 거래정보 및 거래등에 대해 책임을 지지 않습니다.
						</address>
						<span>COPYRIGHTⓒ SoongMooTOUR SERVICE INC. ALL RIGHTS RESERVED</span>
						<p><a href='#'>공정거래위원회</a></p>
						<p><a href='#'>SBCR</a></p>
						<p><a href='#'>ESCROW</a></p>
					</div>
				</li>
				<li class='footer-bottom-right'>
					<ul>
						<li><p>숭무은행 구매안전 서비스</p></li>
						<li><p>1500-0000</p></li>
						<li><p>고객님은 안전거래를 위해 현금으로 결제시<br>
							(주)숭무투어에서 가입한 숭무은행으로<br>
							구매안전서비스를 이용하실 수 없습니다.</p></li>
					</ul>
				</li>
			</ul>
		</div>

	</div>
</footer>


</body>
</html>