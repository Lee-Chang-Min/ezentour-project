<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ include file="../include/includeTags.jsp" %>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="orderIn" method="post" >
<c:set  var="price" value="${dto.prodPrice }" > </c:set>   
<table border="1">
<tr><th>상품 번호</th>
	<th><input type="text" name="prodNo"
				value="${dto.prodNo}" readonly="readonly"/></th></tr>
<tr><th>주문 번호</th>
	<th><input type="text" name="orderNo"
				value="${orderNo}" readonly="readonly"/></th></tr>
<tr><th>상품 명</th>
	<th><input type="text" name="prodName"
				value="${dto.prodName }" readonly="readonly"/></th></tr>
<tr><th>상품가격</th>
	<th><input type="text" name="prodPrice"
				value="${dto.prodPrice }" readonly="readonly"/></th></tr>
<tr><th>상품갯수</th>
   <th><span onclick="prodMinus('${dto.prodPrice }')" >-</span>&nbsp;<input type="text" min= "0" step="1" value="1" max="10" name="orderCount" id ="orderCount"/>&nbsp;<span onclick="prodAdd('${dto.prodPrice }')" >+</span></th></tr>
<tr><th>조식갯수</th>
   <th><span onclick="mealMinus('${hotelNo.hotelBedPrice}')" >-</span>&nbsp;<input type="text" min= "0" step="1" value="0" max="10" name="hotelMealPax" id ="hotelMealPax"/>&nbsp;<span onclick="mealPlus('${hotelNo.hotelBedPrice}')" >+</span></th></tr>
<tr><th>조식가격</th>
	<th><input type="text" name="hotelMealPrice"
				value="${hotelNo.hotelMealPrice}" readonly="readonly"/></th></tr>
<tr><th>침대추가</th>
	<th><input type="radio" id="bedY" name="hotelBed" value="Y" onclick="chkY('${hotelNo.hotelBedPrice}')" />예
			<input type="radio" name="hotelBed" value="N"  onclick="chkN('${hotelNo.hotelBedPrice}')" checked/>아니오</th></tr>
<tr><th>침대가격</th>
	<th><input type="text" id="hotelBedPrice" name="hotelBedPrice"value="${hotelNo.hotelBedPrice}" readonly="readonly"/></th></tr>
<tr>
   <th>총 가격 </th>
   <th>     
    <span id="orderTotalPrice">${price }</span>원
      
	
      <input type="text" id="orderTotalPrice1" name="orderTotalPrice" value="${price }" > 
    </th>
  
</tr>	
	<tr><td colspan="2">
		<input type="submit" value="결제">
		<input type="reset" value="취소">
		<input type="button" value="홈으로"onclick="javascript:location.href='../'"/>


</table>
</form>
  
  
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


</body>
</html>