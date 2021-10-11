<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/productStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function addWish(){
		if(${wishResult}==1){
			if(confirm("이미 위시리스트에 등록되어 있습니다. \n위시리스트에서 삭제하시겠습니까?") == true){
				location.href="wishDelete?prodNo=${prodCommand.prodNo}";
			}
		}else{
			location.href="wishAdd?prodNo=${prodCommand.prodNo}";
		}
	}	
		
	
</script>
</head>
<body>

<header>	
	<%@include file="../main/top.jsp" %>
</header>

<main id="main" class="main">
<div id="wrap" class="wrap">

	<c:if test="${empty authInfo}">
	<span style="font-size:15px; line-height:1.3; display: block; padding: 10px 0;">현재 고객님은 비회원입니다. 상품 구매를 원하시면 로그인해주세요.</span>
	</c:if>
	 
	
	<div class="prodInfoWrap floatclear">
	
		<div class="prodThum">
		<c:forTokens items="${prodCommand.prodImage }" delims="," var="image">
			<img src="../product/upload/${image }" alt="../product/upload/${image }"/>
		</c:forTokens>
		</div>
		
		<input type="hidden" name="prodNo" value="${prodCommand.prodNo}" />
		<input type="hidden" name="hotelNo" value="${hotelViewCommand.hotelNo}" />
		
		<!-- 오른쪽 여행 정보 -->
		<div class="prodInfo">
			<ul class="prod-title">
				<li class="prod-thema"><span>여행 테마 : </span><h4>${prodCommand.prodTheme}</h4></li>
				<li class="prod-name"><span>상품이름 : </span><h3>${prodCommand.prodName }</h3></li>
				<li class="prod-person"><span>여행 인원</span><input type="number" min= "1" step="1" value="1" name="prodcutQty" id ="productQty"/></li>
				<li class="pd-line"></li>
			</ul>
		
	
			<div class="product-buy-wrap floatclear">
			
				<!-- 위시 -->
				<div class="pd-wish-wrap">
						<!-- 위시에 담기전 흰 하트 -->
						<p><a  href="javascript:addWish()" id="wishBtn" class="wishOff">♡Wish</a></p>
						<!-- 위시에 담은뒤 까만하트 -->
						<p><a  href="javascritp:void(0);" id="wishBtn" class="wishOn" >♥Wish</a></p>
						
						<c:if test="${num == 0 }">
						<p>
							<a href="javascritp:void(0);" id="wishBtn">♥위시리스트 삭제</a>
							<img src="../images/left_arrow.png" id = "wishBtn"/>
						</p>
						</c:if>
						<c:if test="${num == 1 }">
						<p><a href="javascritp:void(0);" id="wishBtn">♡위시리스트 등록</a>
						<img src="../images/right_arrow.png" id = "wishBtn"/></p>
						</c:if>
				</div>
				
				<!-- 결제하기 -->
				<div class="pd-buy-wrap">
					<p><a href="../pay/payment?prodNo=${prodCommand.prodNo }" class="paymentTag">결제하기</a></p> 
				</div>
				<!-- 
				<div class="pd-wish-wrap">
					<p><input type="button" value="관심상품" onclick="javascript:location.href='wishAdd?prodNo=${prodCommand.prodNo}'" class="wishOnOffBtn"/></p>
				</div>
				 -->
				
					
				<!-- 쿠폰 -->
				<div class="pd-coupon-wrap">
					<c:if test="${cp.cpNo != null }">
						<div id="cp" class="cpWarp">
							<span class="cp_title">쿠폰 다운</span>
							<span class="cp_sale" onclick="alertInsertCp()">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${cp.cpDiscount}" /><em>원</em>
							</span>
						</div>
					</c:if>
					
					<c:if test="${cp.cpNo == null }">
						<span>쿠폰이 없는 상품입니다.</span>
					</c:if>
				</div>
			
			</div><!-- product-buy-wrap/ 끝 -->
		</div><!-- prodInfo/끝 -->
		
		
		</div><!-- prodInfoWrap/끝 -->
		
		<!-- 상품 메뉴 BAR -->
		<div id="tabMenu_01" class="pdt100"></div>
		<div class="component-tabMenu">
			<ul class="floatclear">
				<li class="tab-list">
					<span><a href="#tabMenu_01" target="_self" class="addOn">상세정보</a></span>
				</li>
				<li class="tab-list">
					<span><a href="#tabMenu_02" target="_self">사용후기</a></span>
				</li>
			</ul>
		</div>
		<!-- 상품 메뉴 BAR 끝-->
		
		
		<div class="prodImgInfo"><!-- 상품 이미지 시작 -->
		<c:forTokens items="${prodCommand.prodImage }" delims="," var="image">
				<img src="../product/upload/${image }" alt="${prodCommand.prodName }"/><br />
		</c:forTokens>
		
		</div><!-- 상품 이미지 끝 -->
		
		<div class="prod_Infomation">
			<table class="prod_info_table">
				<colgroup>
					<col width="250px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th scope="col">여행 일정 </th>
						<td scope="col">시작날짜 :<fmt:formatDate value='${prodCommand.prodSDate }' type='date' pattern='yyyy-MM-dd'/>
						 <br/>	마지막날짜:<fmt:formatDate value='${prodCommand.prodEDate }' type='date' pattern='yyyy-MM-dd'/> </td> 
					</tr>
					
					<tr>
						<th scope="col">여행 상세 정보</th>
						<td scope="col">${prodCommand.prodDetail }</td>
					</tr>
					
					<tr>
						<th scope="col">호텔 이름</th>
						<td scope="col">${hotelViewCommand.hotelName }</td>
					</tr>
			
					<tr>
						<th scope="col">호텔 이미지</th>
						<td scope="col">
							<c:forTokens items="${hotelViewCommand.hotelImage }" delims="," var="image">
							<img src="../hotel/upload/${image }" /><br />
							</c:forTokens>
						</td>
					</tr>
					
					<tr>
						<th scope="col">호텔 상세정보</th>
						<td scope="col">${hotelViewCommand.hotelContent }</td>
					</tr>
					
					<tr>
						<th scope="col">호텔 주소</th>
						<td scope="col">${hotelViewCommand.hotelAddr}</td>
					</tr>
					
					<tr>
						<th scope="col">호텔 전화번호</th>
						<td scope="col">${hotelViewCommand.hotelPh}</td>
					</tr>
			</tbody>
		</table>
		
		</div>
	

		<!-- 지도   -->
		<input type="hidden" value="${hotelViewCommand.hotelAddr}" id="HotelAddr">
		<input type="hidden" value="${hotelViewCommand.hotelName }" id="HotelName">
		<!-- 맵위치 자바로 자동 삽입 / 수정가능 -->
		<div id="map" style="width:100%;height:350px;"></div>

		
		<!-- 상품 메뉴 BAR -->
		<div id="tabMenu_02" class="pdt100"></div>
		<div class="component-tabMenu">
			<ul class="floatclear">
				<li class="tab-list">
					<span><a href="#tabMenu_01" target="_self" >상세정보</a></span>
				</li>
				<li class="tab-list">
					<span><a href="#tabMenu_02" target="_self" class="addOn">사용후기</a></span>
				</li>
			</ul>
		</div>
		<!-- 상품 메뉴 BAR 끝-->
		<jsp:include page="../product/productReviewList.jsp" flush="false"/>
		
	
	</div>
</main>
<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>





<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=417bec12b55e86d2f7a4ef933a7e0366&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
<script>

//==============================================================지도api
//호텔 데이터 변수선언 
var HotelAddr = document.querySelector("#HotelAddr").value;
var HotelName = document.querySelector("#HotelName").value;

//지도생성 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
  center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
  level: 3 // 지도의 확대 레벨
};  
//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
//호텔 주소를 불러와서 지도에 표시합니다
geocoder.addressSearch( HotelAddr, function(result, status) {
//정상적으로 검색이 완료됐으면 
	if (status === kakao.maps.services.Status.OK) {
  	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });
	
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">' + HotelName + "</div>"
	    });
	    infowindow.open(map, marker);
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
}); 

$(function(){
	var rating = $('.rating');

	rating.each(function(){
		var targetScore = $(this).attr('data-rate');
		console.log(targetScore);
		$(this).find('svg:nth-child(-n+' + targetScore + ')').css({color:'#F05522'});
	  });
		
		var userScore = $('#makeStar');
		userScore.change(function(){
			var userScoreNum = $(this).val();
			console.log(userScoreNum);
			$('.make_star svg').css({color:'#000'});
			$('.make_star svg:nth-child(-n+' + userScoreNum + ')').css({color:'#F05522'});
		});
		
		/* $('.make_star svg').click(function(){
			var targetNum = $(this).index() + 1;
			$('.make_star svg').css({color:'#000'});
			$('.make_star svg:nth-child(-n+' + targetNum + ')').css({color:'#F05522'});
		}); */
	});

var paymentTag = document.querySelector('.paymentTag');
var wishBtn = document.querySelector('.wishOnOffBtn');
var cpSale = document.querySelector('.cp_sale'); //쿠폰버튼
console.log(cpSale);

//쿠폰기능
function alertInsertCp() {
	if(${!empty authInfo}) { //로그인 안했을때 쿠폰 기능x
		
		if('${cpMemCk.cpNo}' == '${cp.cpNo}'  &   '${authInfo.userId}' == '${cpMemCk.memId}' ){
			cpSale.style.cursor='hand';
			alert("이미 쿠폰이 존재합니다.");
			location.href="prodView?prodNo="+${prodCommand.prodNo };
		} else {
			cpSale.style.cursor='hand';
			alert("쿠폰이 등록되었습니다.");
			location.href="../cp/cpMemInsert?cpNo= "+'${cp.cpNo}';
		}
	}else {//로그인 했을때 쿠폰 기능o
		alert("로그인 후 이용해 주세요");
	}
}

//로그인 안했을때 결제기능 막기
onAndOff();
function onAndOff() {
	if(${empty authInfo}){
		paymentTag.style.pointerEvents= 'none';
		paymentTag.style.cursor ='default';
		wishBtn.disabled="disabled";
	} else {
		paymentTag.style.pointerEvents= 'all';
		paymentTag.style.cursor ='hand';	
		wishBtn.able;
		wishBtn.style.cursor ='hand';	
	}
}

</script>
</body>
</html>