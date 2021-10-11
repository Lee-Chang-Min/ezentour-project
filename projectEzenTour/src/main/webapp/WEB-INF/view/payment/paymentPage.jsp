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
<form action="paymentOk" method="post" id="frm">
<c:set  var="price" value="${orderD.orderTotalPrice }" />
	<table border="1" id="table">
	<input type="hidden" value="${orderD.orderCount}" name="orderCount">
		<tr>
			<td>옵션번호</td>
			<td><input type="text" name="orderNo" value="${orderD.orderNo }" readonly="readonly" id="odn"/></td>
		</tr>
		<tr>
			<td>결제번호</td>
			<td><input type="text" name="paymentNo" value="${paymentNo }" readonly="readonly"/></td>
		</tr>
		<!-- 쿠폰  있을때-->
		<c:if test="${cpMem.cpNo != null }">
			<tr id="cpBtn" >
				<td>쿠폰선택</td>
				<td><input type="button" value="쿠폰적용" onclick="cpVisible()"/></td>
			</tr>
			<tr>
				<td>쿠폰할인율</td>
				<td><input type="hidden" name="cpDiscount" id="cpDiscount" value="${cpMem.cpDiscount }"/></td>
			</tr>
			<tr>
				<td>쿠폰번호</td>
				<td><input type="hidden" name="cpNo" id="cpNo" value="${cpMem.cpNo }"/></td>
			</tr>
		</c:if>
		<!-- 쿠폰 없을때   -->
		<c:if test="${cpMem.cpNo == null }">
			<tr>
				<td colspan="2">쿠폰이 없습니다</td>
			</tr>
		</c:if>
		<!-- 쿠폰선택시  -->
		<tr>			
			<td>총가격</td>
			<td><span id="totalPrice">${price }</span>원</td>
			<td style="visibility: hidden"><input type="text" name="totalPrice" id="totalPrice1" value="${price }" /></td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type="button" value="결제취소" onclick="revoke()">
			</td>
		</tr>
</table>
<!-- 상품이름, 멤버이름, 멤버 전화번호 , 멤버이메일 ,멤버주소 -->
</form>
<button onclick="pay()">카카오페이 결제하기 </button>
	<div style="visibility: hidden;">
	<div id="name">${dto.memName }</div>
   	<div id="email">${dto. memEmail}</div>
   	<div id="phone">${dto.memPh }</div>
   	<div id="address">${dto.memAddr }</div>
   	</div>





<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>
    var sub = document.querySelector('#sub');
    var orderNo = document.querySelector('#odn').value;
    var cpDiscount = document.querySelector('#cpDiscount');
    var cpNo = document.querySelector('#cpNo');
    var cpBtn = document.querySelector('#cpBtn');
    var table = document.querySelector('#table');
    var discountPrice1 = document.querySelector('#totalPrice1');
    var discountPrice = document.querySelector('#totalPrice');
    
   
    
    //
    var name = document.querySelector('#name').innerHTML;
    var email = document.querySelector('#email').innerHTML;
    var phone = document.querySelector('#phone').innerHTML;
    var address = document.querySelector('#address').innerHTML;
 
    var price2 =0;
    price2 = discountPrice.innerHTML;//핸드폰결제창에 뜨는 할인가격
    console.log(price2);
    

    //쿠폰 나타내기
    function cpVisible() {
    	cpDiscount.type="text";
    	cpNo.type="text";
    	table.deleteRow(2);
    	discountPrice.innerHTML= Number(discountPrice.innerHTML) - Number(cpDiscount.value);
    	discountPrice1.value= Number(discountPrice1.value) - Number(cpDiscount.value);
    }
    
    //결제취소
    function revoke() {
    	location.href="orderDel?orderNo=" + orderNo;
    }
    
    
	//카카오결제
    function pay() {
    	$(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp99068442'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '숭무투어의 결제입니다',
            amount : price2,
            buyer_email : email,
            buyer_name : name,
            buyer_tel : phone,
            buyer_addr : address,
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                document.querySelector('#frm').submit();
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="orderDel?orderNo=" + orderNo;
                alert(msg);
            }
        });
        
    });
    };
    </script>
</body>
</html>