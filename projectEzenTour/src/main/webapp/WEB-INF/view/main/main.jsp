<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="${root }/js/main.js"></script>

<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/mainStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">

</head>
<body onload="openWin()">

<header>   
   <%@include file="../main/top.jsp" %>
</header>
<main>
<section id='section1'>
   <div>
      <ul class='slide-wrap'>
         <li class='slide'>
            <div class='slide-content slide-contents01'>
               <a href='#' class='slideLink blind'>슬라이드링크</a>
               <p><img src='${pageContext.request.contextPath}/images/slide_01_bg.jpg' alt='visual01'></p>
               <ul>
                  <li><span>럭셔리 휴향지의 끝판왕</span></li>
                  <li><h2 style='color:#3d1b1a;font-weight:600;'>제주 요트 여행<br></h2></li>
                  <li><p style="color:#3d1b1a;">The islands of jeju</p></li>
                  <li><p><a href='#'> Go shop </a></p></li>
               </ul>
            </div>
         </li>
         
         <li class='slide'>
            <div class='slide-content slide-contents02'>
               <a href='#' class='slideLink blind'>슬라이드링크</a>
               <p><img src='${pageContext.request.contextPath}/images/slide_02_bg.jpg' alt='visual01'></p>
               <ul>
                  <li><span>지친 일상 천혜의 자연으로 떠나요</span></li>
                  <li><h2 style="color:#000;font-weight:600;">치유와 쉼으로 만나다<br>새로운 경상 북도</h2></li>
                  <li><p style="color:#000;">최대 20%할인! 경상북도 쉼표여행</p></li>
                  <li><p><a href='#'> Go shop </a></p></li>
               </ul>
            </div>
         </li>
                  
      </ul><!-- slide-wrap //end -->

      <!-- 슬라이듣 좌,우 화살버튼 -->
      <span class='prevBtn-wrap'><a href='javascript:' class='prevBtn slideStopBtn'><img src='${pageContext.request.contextPath}/images/left-arrow.png' alt='prev button 이전버튼'></a></span> 
      <span class='nextBtn-wrap'><a href='javascript:' class='nextBtn slideStopBtn'><img src='${pageContext.request.contextPath}/images/right-arrow.png' alt='next button 다음버튼'></a></span> 

      <!-- 네비게이션 둥근버튼 자동추가 영역 -->
      <ul class='navBtn-wrap slideStopBtn floatclear'>
      
      </ul>
      <!-- 네비게이션 둥근버튼 자동추가 영역 -->
      
   </div>
</section>


<section id='section2' >
<div class="section2-wrap">
<center>
<table width="1100">
<tr>

<td>
<a href = "product/prodSeoulList?prodLocation=서울">
<img src="${pageContext.request.contextPath}/images/seoul.jpg" width="240" height="320"/>
</a>
</td>

<td>
<a href = "product/prodGyeonggiList?prodLocation=경기도">
<img src="${pageContext.request.contextPath}/images/gyeonggi.jpg" width="240" height="320"/>
</a>
</td>

<td>
<a href = "product/prodJejuList?prodLocation=제주도">
<img src="${pageContext.request.contextPath}/images/jeju.png" width="240" height="320"/>
</a>
</td>

<td>
<a href = "product/prodgsdList?prodLocation=경상도">
<img src="${pageContext.request.contextPath}/images/gye.jpg" width="240" height="320"/>
</a>
</td>

</tr>
</table>

</div>
</section>

<section id="section3" >
<div class="section3-wrap">
   <h2>오늘의 여행상품</h2>
   
   <div class="sec3-wrap">
      <div class="sec3-contents">
      <c:forEach items="${prodList }" var="dto" varStatus="cnt">
      <c:if test="${cnt.count < 5}">
         <div class="floatclear">            
            <div class="newIcon">NEW</div>
            <p class="floatL">
               <a href="product/prodView?prodNo=${dto.prodNo }" >
                  <c:if test="${dto.prodImage != null }">
                  <span class="prod-img"><img src="product/upload/${dto.prodImage.split(',')[0] }" /></span>
                  </c:if>
                  <c:if test="${dto.prodImage == null }">
                  <span class="prod-text">상품이미지 준비중 입니다.</span>
                  </c:if>
               </a>
            </p>
            <p class="sec3-prod-info floatL">
               <span class="prod-name">${dto.prodName }</span>
               <span class="prod-price"><fmt:formatNumber value="${dto.prodPrice }" type="currency" /></span>
            </p>
         </div>
      </c:if>
      </c:forEach>
      </div>
   </div>
   
</div>
</section>



<section id="section4" class="section4">
<div class="section4-wrap">
   <div class="sec4-search">
      <form action="searchName">
         <input type="search" name="prodName" placeholder="상품을 검색해보세요" >
         <!--  <img class="SearchBar-icon" src="${pageContext.request.contextPath}/images/searchIcon.svg" alt="검색"> -->
         <input type="submit" id="SearchBar__input" class="" style=" background-image: url('${pageContext.request.contextPath}/images/searchIcon.svg')">
      </form>
   </div>
   
   
   
   <div class="search-wrapper floatclear">
      <c:forEach items="${searchList}" var="sList">
      <div>
         <c:if test="${sList.prodName != null }">
         <p>
            <span>${sList.prodNo }</span>
            <span>${sList.prodName }</span>
         </p>
         <p>
            <a href="product/prodView?prodNo=${sList.prodNo }" >
               <img src="product/upload/${sList.prodImage.split(',')[0] }" alt="이미지 준비중 ...." width="400px" height="200px"/>
            </a>
         </p>
         </c:if>
      </div>
      </c:forEach>
   </div>
</div>
</section>





<div id="main-bar-warp">
   <div class="barBG">
      
   </div>
   <div class="bar-text-wrap">
      <div class="text-wapper floatclear">
         <div>
            <span>고객들이 많이 찾는</span>
            <span>금주의 인기 키워드 </span>
         </div>
         <ul>
            <li><a href="javascript:">#제주도</a></li>
            <li><a href="javascript:">#드라이브</a></li>
            <li><a href="javascript:">#전주</a></li>
            <li><a href="javascript:">#맛집투어</a></li>
            <li><a href="javascript:">#3박4일</a></li>
         </ul>
      </div>
   </div>
</div>

<section id="section3" >
<div class="section3-wrap">
   <h2>베스트 여행 상품(조회순)</h2>
   
   <div class="sec3-wrap">
      <div class="sec3-contents">
      <c:forEach items="${hitsList }" var="dto" varStatus="cnt">
      <c:if test="${cnt.count < 5}">
         <div class="floatclear">
            <p class="floatL">
               <a href="product/prodView?prodNo=${dto.prodNo }" >
                  <c:if test="${dto.prodImage != null }">
                  <span class="prod-img"><img src="product/upload/${dto.prodImage.split(',')[0] }" /></span>
                  </c:if>
                  <c:if test="${dto.prodImage == null }">
                  <span class="prod-text">상품이미지 준비중 입니다.</span>
                  </c:if>
               </a>
            </p>
            <p class="sec3-prod-info floatL">
               <span class="prod-name">${dto.prodName }</span>
               <span class="prod-name">조회수:${dto.prodCount }</span>               
               <span class="prod-price"><fmt:formatNumber value="${dto.prodPrice }" type="currency" /></span>
            </p>
         </div>
      </c:if>
      </c:forEach>
      </div>
   </div>
</div>
</section>

</main>
<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>



<script type="text/javascript">
function getCookie(name) {
   var nameOfCookie = name + "=";
   var x = 0
   
   while ( x <= document.cookie.length ) {
      var y = (x+nameOfCookie.length);
      if ( document.cookie.substring( x, y ) == nameOfCookie ) {
         if ( (endOfCookie=document.cookie.indexOf( ";",y )) == -1 )
         endOfCookie = document.cookie.length;
         return unescape( document.cookie.substring(y, endOfCookie ) );
      }
      x = document.cookie.indexOf( " ", x ) + 1;
      if ( x == 0 )
      break;
   }
   return "";
}

function openWin() {
   if (getCookie("name1") != "done") {
      window.open("./pop","name1","width=500, height=300, top=150,left=100");
   }

}

</script>

</body>
</html>