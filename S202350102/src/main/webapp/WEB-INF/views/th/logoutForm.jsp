<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
<script type="text/javascript">
	function goBack() {
		history.back();
	}
</script>
</head>
<body>
<p>${sessionScope.status_md }</p>
<h2>로그아웃하시겠습니까?</h2>
<form action="/logout">
	<input type="submit" value="네">
	<input type="button" value="돌아가기" onclick="goBack()"> <p>
</form>

<form action="/deleteUser1Form">
	<input type="submit" value="회원탈퇴">
</form>

</body>
</html>

