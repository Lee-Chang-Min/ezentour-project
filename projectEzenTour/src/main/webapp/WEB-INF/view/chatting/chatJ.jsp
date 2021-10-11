<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#monitor{			
				margin: 5px;
				width: 340px;
				height: 200px;
				overflow: auto;
				border: 1px solid black;
			}
		</style>
		<title>Insert title here</title>
	</head>
	<body>
		<h3>채팅 페이지</h3>
		<form>
		
			그룸명 : <div id="groupName">제주도</div>

			사용자 : <input id="userId" type="text" value="${authInfo.userId }"/> <!-- memid로 받아와야됨???????????? -->
			<div id="monitor" contentEditable="true"></div>
			<div>							
				메시지 : <input id="msg" type="text"/>
				<input type="button" value="전송" onClick="sendMsg()"/>
				<input type="button" value="나가기" onClick="disConn()"/>
			</div>
		</form>
	</body>
	<script>
		var url = "ws://3.35.220.114:8080/soket/chat/";			
		var webSocket = null;
		var monitor = document.getElementById("monitor");
		const groupName = document.querySelector("#groupName").innerText;
		const userId = document.getElementById("userId").value;
		const groupNameUserId = groupName + "`" + userId;
		url += groupNameUserId; //url 뒤에 닉네임이 붙는 것
		console.log(url);
		webSocket = new WebSocket(url);//웹 소켓 객체 생성	
			
			//웹소켓 연결됐을 때(client <- server)
		webSocket.onopen = function(e){
			console.log(e);			
		}
			
			//웹소켓 끊겼을 때(client <- server)
		webSocket.onclose = function(e){
			if(e.type=="close"){
				monitor.innerHTML += "접속이 종료 되었습니다.<br/>";
			}
		}		
		
		//메시지 수신(client <- server)
		webSocket.onmessage = function(e){
			console.log(e);
			monitor.innerHTML += e.data+"<br/>";
		}
		
		//웹소켓 종료(client -> server)
		function disConn(){
			webSocket.close();
		}
		
		//메시지 전송(client -> server)
		function sendMsg(){
			webSocket.send(groupNameUserId + "`" + $("#msg").val());
			$("#msg").val("");//메세지는 새로 작성해야되니까 지워지는것
		}
	
	</script>
</html>