<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/loginStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;                
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
        
    }
    </script>
</head>
<body>

<header>	
	<%@include file="../main/top.jsp" %>
</header>


<main id="main">
<div id="wrap" class="wrap">

	<form:form action="memJoin" method="post" name="frm" id="frm" modelAttribute="memberCommand" onsubmit="return checkAll()"> 
		<div class="join-wrap">
			<h2 class="h">정보 입력</h2>
			<ul>
				<li class="wndqhr floatclear" >
					<p>아이디</p>
					<div class="wndqhr2">
						<form:input type="text" path="memId" id="memId" name="memId" placeholder="4~12자의 영문 대소문자와 숫자로만 입력" />
						<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복<br/>확인</button>
					</div>
					<p class="errorText"><form:errors path="memId" /></p>
				</li>
				<li class="floatclear">
					<p>비밀번호</p>
					<form:password path="memPw" id="memPw" placeholder="비밀번호 영문자+숫자+특수조합(8~25자리 입력)" />
					<p class="errorText"><form:errors path="memPw"/></p>
				</li>
				<li class="floatclear">
					<p>비밀번호 확인</p>
					<form:password path="memPwCon" id="memPwCon" placeholder="비밀번호 확인" />
					<p class="errorText"><form:errors path="memPwCon"/></p>
				</li>
				<li class="floatclear">
					<p>이름</p>
					<form:input path="memName" id="memName" placeholder="이름" />
					<p class="errorText"><form:errors path="memName"/></p>
				</li>
				<li class="addrSt floatclear">
					<p>우편번호</p>
					<div>
						<form:input path="memAddrPost" id="sample4_postcode" readonly="readonly" placeholder="우편번호" />
						<form:input path="memAddr" id="sample4_roadAddress" size="30" readonly="readonly" placeholder="주소" />
						<form:input path="memAddrDetail" placeholder="상세 주소"  />
					</div>
					<p class="addrFind-wrap"><a href="javascript:sample4_execDaumPostcode();" class="addr-find-btn">주소 찾기</a></p>
					<p class="errorText"><form:errors path="memAddr"/></p>
				</li>
				<li class="floatclear">
					<p>연락처</p>
					<form:input path="memPh" id="memPh" placeholder="연락처" />
					<p class="errorText"><form:errors path="memPh"/></p>
				</li>
			
				<li class="floatclear">
					<p>이메일</p>
					<form:input path="memEmail" id="memEmail" placeholder="예)lee35@lee35.com" />
					<p class="errorText"><form:errors path="memEmail"/></p>
				<li class="floatclear">
					<p>생년월일</p>
					<input type="date" name="memBirth" placeholder="생년월일" />
					<p class="errorText"><form:errors path="memBirth"/></p>
				</li>
				<li class="gender-wrap floatclear">
					<p>성별</p>
					<div class="w70 floatR">
						<form:radiobutton path="memGender"  value="M" checked="checked" />남자
						<form:radiobutton path="memGender" value="F" />여자
					</div>
					<p class="errorText"><form:errors path="memGender"/></p>
				</li>
				<li class="mail-wrap floatclear">
					<p>이메일 수신여부</p>
					<div class="w70 floatR">
						<input type="radio" name="memEmailAd" value="Y" checked />예
						<input type="radio" name="memEmailAd" value="N" />아니오
					</div>
					<p class="errorText"><form:errors path="memEmailAd"/></p>
				</li>
				<li class="memJoinCom floatclear">
					<input type="button" value="가입 완료" onclick=" joinform_check();" />
					<input type="button" value="가입 안함" class="joinClear" onclick="javascript:location.href='main.sm'" />
				</li>
			</ul>
		</div>
	</form:form>
<script type="text/javascript" >
function joinform_check() {
var memId = document.getElementById("memId");
var memPw = document.getElementById("memPw");
var memPwCon = document.getElementById("memPwCon");
var memName = document.getElementById("memName");
var memPh = document.getElementById("memPh");
var frm = document.getElementById("frm");

var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
if (!idRegExp.test(memId.value)) {
    alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
    form.memId.value = "";
    form.memId.focus();
    return false;
};


  if (memPw.value == "") {
    alert("비밀번호를 입력하세요.");
    memPw.focus();
    return false;
  };

  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
  if (!pwdCheck.test(memPw.value)) {
    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
    memPw.focus();
    return false;
  }

  if (memPw.value !== memPwCon.value) {
    alert("비밀번호가 일치하지 않습니다..");
    memPwCon.focus();
    return false;
  };

  if (memName.value == "") {
    alert("이름을 입력하세요.");
    memName.focus();
    return false;
  };


  var reg = /^[0-9]+/g; //숫자만 입력하는 정규식

  if (!reg.test(memPh.value)) {
    alert("전화번호는 숫자만 입력할 수 있습니다.");
    memPh.focus();
    return false;
  };

  //입력 값 전송
  document.frm.submit(); //유효성 검사의 포인트   
}




function fn_idChk(){
	$.ajax({
		url : "member/idChk",
		type : "post",
		dataType : "html",
		data: {"memId" : $("#memId").val()},
		success : function(data){
			
			 if(data.trim() == 1){
				alert("중복된 아이디입니다.");
			}else if(data.trim() == 0){
				
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}
</script>



</div>
</main>



<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>

</body>
</html>