<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/topStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/loginStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/footerStyle.css" rel="stylesheet" type="text/css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

</head>
<body>

<header>	
	<%@include file="../main/top.jsp" %>
</header>

<main id="main">

<form:form action="login" method="post" name="frm" modelAttribute="LogInCommand">


<div id="wrap">
	<div class="login-box">
		<input type="hidden" name="siteCd" value="AFK">
			<h2 class="h">로그인</h2>
			<div class="input-cell">
			<input type="text" name="userId" id="user_id" class="input--wide"
					placeholder="아이디"  >
				<form:errors path="userId"  />

			<div class="input-cell">
				<input type="password" name="userPw" id="user_pw" class="input--wide"
				placeholder="비밀번호"  >
				<form:errors path="userPw"  />

			</div>
			<div class="login-btnWrap">
				<button type="submit" class="btn--wide" onclick="Login();">
					<span class="btn-text">로그인</span>
				</button>
			</div>
			<ul class="login-util">
				<li><a href="../search/idFind">아이디 찾기</a></li>
				<li><a href="../search/findPassword" >비밀번호 찾기</a></li>
				<li><a href="../agree">회원 가입</a></li>
			</ul>
		</div>
	

	</form:form>
	
	
	
	
	
</div><!-- wrap/끝 -->
<script>
<!-- 카카오 로그인 스크립트   -->
Kakao.init('417bec12b55e86d2f7a4ef933a7e0366'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
function kakaoLogin() {
	Kakao.Auth.login({
		scope: 'account_email,birthday,gender',
		success: function (response) {
		Kakao.API.request({
			url: '/v2/user/me',
			success: function (response) {
				kakaoLoginPro(response)
			},
			fail: function (error) {
				console.log(error)
			},
		})
	},
		fail: function (error) {
			console.log(error)
		},
	})
}
</script>
<!-- 로그인  -->

<script type="text/javascript">


//아이디 검사 ---------------------------------------------------------------------------

   function Login()
   {
           var form = document.frm;

                  //아이디에서 입력 필수 조건문
                  if (form.userId.value == "")
                  {
                          alert("아이디를 입력해야 합니다!");
                          form.userId.focus();//포커스를 id박스로 이동.
                          return;
                  }
//패스워드 검사 -----------------------------------------------------------------
            if (form.userPw.value == "")
            {
                 alert("패스워드를 입력 해야 합니다!");
                 form.userPw.focus();//포커스를 Password박스로 이동.
                 return;
            }

   form.submit();
   }

</script>






</main><!-- main/끝 -->


<footer>
<jsp:include page="../main/footer.jsp" flush="false"/>
</footer>

</body>
</html>