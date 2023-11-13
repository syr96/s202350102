<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ include file="/WEB-INF/views/header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#comList{
		position: relative;
		align-self: center;
		left: 40%;
		right: 40%;
	}
</style>
</head>
<body>
	<div class="card card-xl" id="comList">
		<div class="card-body">
			<form action="deleteChgComm" method="post">
				<ul>
				<c:forEach items="${chgCommList }" var="chgCommList">
					<li>
						<input type="checkbox" name="ctn" value="${chgCommList.ctn }">${chgCommList.ctn }
					</li>	
				</c:forEach>
					<li><input type="submit" value="선택항목 삭제"></li>
				</ul>
			</form>
			<form action="insertChgComm" method="post">
				챌린지 카테고 입력: <input type="text" name="ctn"> <input type="submit" value="확인">
			</form>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>