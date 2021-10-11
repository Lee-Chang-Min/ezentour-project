<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{margin:0; padding:0}
#pop-continer{overflow: hidden; height: 300px; position: relative;z-index: 1;}
.pop-wrap{padding:20px 20px 0 20px; height: 100%;}
.pop-wrap p{font-size:21px;}
h1{margin: 5px 0; font-size:30px;}
/* 닫기 */
.close-wrap{width:100%; background-color:#000; color:#fff; position: relative; z-index: 2; left:0; bottom:52px;}
.close-wrap span{color:#fff;}
.close-wrap span a{color:#fff; display: inline-block; padding:5px;}
</style>
<script type="text/javascript">

function setCookie(name,value,expiredays) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function closeWin() {
	if(document.checkClose.name1.checked == true) {
		setCookie("name1", "done" ,1);
	}
	self.close();
}

</script>
</head>
<body id="pop-continer" bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<div class="pop-wrap" >
		<p>여행지 추천</p>
		<h1><a href="survey">시작하기</a></h1>
	</div>
	<div class="close-wrap">
		<form name="checkClose">
			<input type="checkbox" name="name1" onfocus="this.blur()"><span>오늘 하루 이 창 띄우지 않음</span>
	 		<span><a href="#" onclick="closeWin()">[닫기]</a></span>
	  	</form>
	</div>
</body>
</html>