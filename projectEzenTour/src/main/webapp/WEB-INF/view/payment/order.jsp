
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ include file="../include/includeTags.jsp" %>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/orderStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">


</head>
<body>
<header>	
	<%@include file="../main/top.jsp" %>
</header>

<main id="main" class="main">
<div id="wrap" class="wrap">
	<div class="contentTop">
		<h2>주문/결제</h2>
	</div>
	
	<div class="orderThum">
	<c:forTokens items="${dto.prodImage }" delims="," var="image">
		<span><img src="../product/upload/${image }" alt="../product/upload/${image }"/></span>
	</c:forTokens>
	</div>

	<div class="order-wrap">
	
	
		<form action="orderIn" method="post" >
		<c:set  var="price" value="${dto.prodPrice }" ></c:set>   
			<ul class="order-info-wrap">
				<li><span class="w30per">상품 번호</span>
					<span class="w60per"><input type="text" name="prodNo" value="${dto.prodNo}" readonly="readonly"/></span>
				</li>
				<li><span class="w30per">주문 번호</span>
					<span class="w60per"><input type="text" name="orderNo" value="${orderNo}" readonly="readonly"/></span>
				</li>
				<li><span class="w30per">상품명</span>
					<span class="w60per"><input type="text" name="prodName" value="${dto.prodName}" readonly="readonly"/></span>
				</li>
				<li><span class="w30per">상품가격</span>
					<span class="w60per"><input type="text" name="prodPrice" value="${dto.prodPrice}" readonly="readonly"/></span>
				</li>
				<li><span class="w30per">상품갯수</span>
					<span class="w60per">
						<a onclick="prodMinus('${dto.prodPrice }')" ><img src="../images/qty_minus.gif"></a>
						<input type="text" min= "0" step="1" value="1" max="10" name="orderCount" id ="orderCount"/>
						<a onclick="prodAdd('${dto.prodPrice }')" ><img src="../images/qty_plus.gif"></a>
					</span>
				</li>
				<li>
					<span class="w30per">조식 인원</span>
					<span class="w60per">
						<a onclick="mealMinus('${hotelNo.hotelBedPrice}')" ><img src="../images/qty_minus.gif"></a>
						<input type="text" min= "0" step="1" value="0" max="10" name="hotelMealPax" id ="hotelMealPax"/>
						<a onclick="mealPlus('${hotelNo.hotelBedPrice}')" ><img src="../images/qty_plus.gif"></a>
					</span>
				</li>
				<li>
					<span class="w30per">조식 가격</span>
					<span class="w60per"><input type="text" name="hotelMealPrice"value="${hotelNo.hotelMealPrice}" readonly="readonly"/></span>
				</li>
				<li>
					<span class="w30per">침대 추가</span>
					<span class="w60per">
						<input type="radio" id="bedY" name="hotelBed" value="Y" onclick="chkY('${hotelNo.hotelBedPrice}')" />예
						<input type="radio" name="hotelBed" value="N"  onclick="chkN('${hotelNo.hotelBedPrice}')" checked/>아니오
					</span>
				</li>
				
				<li class="bedPrice">
					<span class="w30per">침대 가격</span>
					<span class="w60per">
						<input type="hidden" id="hotelBedPrice" name="hotelBedPrice"value="${hotelNo.hotelBedPrice}" readonly="readonly"/>
						<span>${hotelNo.hotelBedPrice}</span>
						<em>원</em>
					</span>
				</li>
				
				
				<li class="totPrice">
					<span class="w30per">총 금액</span>
					<span id="orderTotalPrice">${price }</span><em>원</em>
				    <input type="hidden" id="orderTotalPrice1" name="orderTotalPrice" value="${price }" > 
				</li>
			
			</ul>
	
			<div>
				<input type="submit" value="결제">
				<input type="reset" value="취소">
				<input type="button" value="홈으로"onclick="javascript:location.href='../'"/>
			</div>

		</form>
		
		
		
		
		
		
		
		
		
		
		
		
		
	</div>
  
<script type="text/javascript">
   
   // DOM
   var orderCount = document.querySelector("#orderCount");
   var hotelMealPax = document.querySelector("#hotelMealPax");
   var orderTotalPrice = document.querySelector("#orderTotalPrice");
   var TotPrice = 0;
   var MealTotPrice =0;
   
   
   
   
   
// 상품 가격 
   function prodAdd(event) {
      var addedCount = Number(orderCount.value) + 1;
      orderCount.value = addedCount;
      
      //orderTotalPrice 에 추가된 인원 보내기
      TotPrice = Number(event); //event - 상품가격 / orderCount.value- 상품갯수
      document.getElementById("orderTotalPrice1").value=    Number(document.getElementById("orderTotalPrice").innerHTML) + TotPrice;      
      document.getElementById("orderTotalPrice").innerHTML =  Number(document.getElementById("orderTotalPrice").innerHTML) + TotPrice;   
}
   
   function prodMinus(event) {
      if(Number(orderCount.value) > 1) {
         var subCount = Number(orderCount.value) -1;
         orderCount.value = subCount;
         
         //orderTotalPrice 에 뺀 인원 보내기
         TotPrice = Number(event);
         document.getElementById("orderTotalPrice1").value=    Number(document.getElementById("orderTotalPrice").innerHTML) - TotPrice;     
         document.getElementById("orderTotalPrice").innerHTML= Number(document.getElementById("orderTotalPrice").innerHTML) - TotPrice;
         return;
      } else {
         alert("최소인원은 한명입니다");
         return;
      }
   }
   
   
// 조식가격
   function mealPlus(event) {
      var addedCount = Number(hotelMealPax.value) + 1;
      hotelMealPax.value = addedCount;
      
      //조식가격 추가
      MealTotPrice =  Number(event); 
      document.getElementById("orderTotalPrice1").value = Number(document.getElementById("orderTotalPrice").innerHTML) + MealTotPrice;
      document.getElementById("orderTotalPrice").innerHTML =  Number(document.getElementById("orderTotalPrice").innerHTML) + MealTotPrice;
      console.log(orderTotalPrice.firstChild);
   }
   
   
   function mealMinus(event) {
      if(Number(hotelMealPax.value) > 0) {
         var subCount = Number(hotelMealPax.value) -1;
         hotelMealPax.value = subCount;
         
         //조식가격 감소
         MealTotPrice =  Number(event);      
         document.getElementById("orderTotalPrice1").value=Number(document.getElementById("orderTotalPrice").innerHTML) - MealTotPrice;
         document.getElementById("orderTotalPrice").innerHTML = Number(document.getElementById("orderTotalPrice").innerHTML) - MealTotPrice;
         return;
      } else {
         alert("최소수치 입니다!");
         return;
      }
   }
//침대 아아dfdsadasd
   
   function chkY(event) {
      document.getElementById("orderTotalPrice1").value=     Number(document.getElementById("orderTotalPrice").innerHTML) + Number(event);
      document.getElementById("orderTotalPrice").innerHTML =  Number(document.getElementById("orderTotalPrice").innerHTML) + Number(event);
   }
   
   function chkN(event) {
      document.getElementById("orderTotalPrice1").value=     Number(document.getElementById("orderTotalPrice").innerHTML) - Number(event);
      document.getElementById("orderTotalPrice").innerHTML =  Number(document.getElementById("orderTotalPrice").innerHTML) - Number(event);
   }
   
</script>


	</div>
</main>
<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>

</body>
</html>



