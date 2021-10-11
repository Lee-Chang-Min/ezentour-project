<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here </title>
</head>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/top.js"></script>
<body>
	<header id="header">
	
		<div class="header-userTop floatclear">
			<!-- 로그인하기 // 로그인 되지않았을때-->
			<c:if test="${authInfo == null}">
			<div class="header-aside">
				<ul class="aside-user-wrap floatclear">
					<li><a href="${root }login/login">로그인</a></li>
					<li><a href="${root }agree">회원 가입</a></li>
				</ul>
			</div>
			</c:if>
			
			<!-- 로그인하기 // 회원,관리자 로그인-->
			<c:if test="${!empty authInfo }">
			
			<!-- 회원로그인-->
			<c:if test="${authInfo.grade == 1 }">
			<div class="header-aside">
				<ul class="aside-user-wrap floatclear">
					<li><a href="${root }memMy/myPage">마이페이지</a></li>
					<li><a href="${root }wish/wishlist">위시리스트</a></li>
					<li><a href="${root }pl/OrderProcessList">구매확인</a></li>
					<li><a href="${root }chatting">채팅하기</a></li>
					<li><a href="${root }login/logOut">로그아웃</a></li>
				</ul>
			</div>
			</c:if>
			
			<!-- 관리자 -->
			<c:if test="${authInfo.grade != 1 }">
			<div class="header-aside">
				<ul class="aside-user-wrap floatclear">
					<li><a href="${root }product/prodList">여행상품리스트</a></li>
					<li><a href="${root }hotel/hotelList">호텔리스트</a></li>
					<li><a href="${root }empmy/myInfo">직원 마이페이지</a></li>
					<li><a href="${root }memList">회원리스트</a></li>
					<li><a href="${root }emp/empList">직원 리스트</a></li>
					<li><a href="${root }login/logOut">로그아웃</a></li>
					<li><a href="${root }couponregist/cpregist">쿠폰등록</a></li>
					<li><a href="${root }notice/noticeRegist">공지/이벤트등록</a></li>
				</ul>
			</div>
			</c:if>
			
			</c:if><!-- 로그인하기끝 // 회원,관리자 로그인-->
		</div>
	
	
	
		<div class="header-inner floatclear">
			<h2 class="logo">
				<a href="${root }main">이젠투어</a>
			</h2>
			<!-- 카테고리 -->
			<ul id="gnb-wrap" class="gnb-wrap floatclear">
				<li>
					<p>
						<a href="javascritp:void(0);" class="gnb1">지역별 여행</a>
					</p>
					<div class='subMenu sub1'>
						<ul class="subMenu-contants floatclear">
							<li><a href="${root}product/prodSeoulList?prodLocation=서울">서울</a></li>
							<li><a href="${root}product/prodGyeonggiList?prodLocation=경기도">경기도</a></li>
							<li><a href="${root}product/prodJejuList?prodLocation=제주도">제주도</a></li>
							<li><a href="${root}product/prodgsdList?prodLocation=경상도">경상도</a></li>
							
						</ul>
					</div>
				</li>
				<li>
					<p>
						<a href="javascritp:void(0);" class="gnb1">테마여행</a>
					</p>
					<div class='subMenu sub2'>
						<ul class="subMenu-contants floatclear">
							<li><a href="${root}product/themeFood?prodTheme=food">맛집</a></li>
							<li><a href="${root}product/themeHeeling?prodTheme=heeling">힐링</a></li>
							<li><a href="${root}product/themeActive?prodTheme=activity">액티브</a></li>
							<li><a href="${root}product/themeHistory?prodTheme=history">문화탐방</a></li>
						</ul>
					</div>
				</li>
				<li>
					<p>
						<a href="javascritp:void(0);" class="gnb1">이벤트</a>
					</p>
					<div class='subMenu sub3'>
						<ul class="subMenu-contants floatclear">
							<li><a href="${root}event/eventHome">이달의 이벤트</a></li>
							<li><a href="javascritp:void(0);">출석체크</a></li>
						</ul>
					</div>
				</li>
				<li>
					<p>
						<a href="${root}notice/noticeList" class="gnb1">공지사항</a>
					</p>
				</li>
				<li>
					<p>
						<a href="javascritp:void(0);" class="gnb1">고객센터</a>
					</p>
							<div class='subMenu sub4'>
						<ul class="subMenu-contants floatclear">
							<li><a href="${root}qna/main">자주 묻는 질문</a></li>
							<li><a href="https://about.myrealtrip.com/">회사소개</a></li>
							<li><a href="https://career.myrealtrip.com/">채용</a></li>
						</ul>
					</div>
				</li>
				
			
			<!-- 
			<li><a href="${root }product/prodList">여행상품리스트</a></li>
			<li><a href="${root }hotel/hotelList">호텔리스트</a></li>
			
			<li><a href="${root }wish/wishlist" >위시리스트</a></li>
			<li><a href="${root }cart/goodsCartList" >장바구니</a></li>
			
			
			<li><a href="${root }comment/comment">코멘트</a></li>
			<li><a href="${root }mapview">지도api</a></li>
			<li><a href="${root }pop">poptest</a></li>
			 -->

			</ul><!-- gnb-wrap/끝  -->
			<!-- 카테고리 //끝 -->
			
			


		</div>
	</header>
</body>
</html>