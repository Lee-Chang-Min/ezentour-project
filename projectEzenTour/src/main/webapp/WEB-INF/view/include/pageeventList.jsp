<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/> 
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
.w3-bar .w3-button a.off {
	pointer-events: none;
}

.w3-bar .w3-button a.on {
	pointer-events: all;
}

#pageOn {
	pointer-events: all;
}

#pageOff {
	pointer-events: none;
}
</style>

<body>

	<div class="w3-center">

		<div class="w3-bar w3-border w3-round">

			<!-- << 비활성화 -->
			<c:if test="${pageDTO.prevPage <= 0 }">
				<a href="#" class="w3-bar-item w3-button off" id="pageOff">&laquo;</a>
			</c:if>

			<!-- << 활성화 -->
			<c:if test="${pageDTO.prevPage >= 1 }">
				<a href="${root }event/eventHome?page=${pageDTO.prevPage}"
					class="w3-bar-item w3-button on" id="pageOn">&laquo;</a>
			</c:if>


			<c:forEach var="idx" begin="${pageDTO.min }" end="${pageDTO.max }">
				<c:if test="${idx == pageDTO.currentPage }">
					<a href="${root }event/eventHome?page=${idx}"
						class="w3-bar-item w3-button">${idx }</a>
				</c:if>
				<c:if test="${idx != pageDTO.currentPage }">
					<a href="${root }event/eventHome?page=${idx}"
						class="w3-bar-item w3-button">${idx }</a>
				</c:if>
			</c:forEach>

				<c:if test="${pageDTO.max >= pageDTO.pageCnt }">
					<a href="#" class="w3-bar-item w3-button off" id="pageOff">&raquo;</a>
				</c:if>
				
				<c:if test="${pageDTO.max < pageDTO.pageCnt }">
					<a href="${root }event/eventHome?page=${pageDTO.nextPage}"
						class="w3-bar-item w3-button on" id="pageOn">&raquo;</a>
				</c:if>

		</div>
	</div>


</body>
</html>






