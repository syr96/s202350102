<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원탈퇴</h1>
<h2>탈퇴하기위해 비밀번호를 입력해주세요</h2>
<form action="deleteUser1" method="post">
	<input type="hidden" name="user_id" value="${sessionScope.user_id }">
	<input type="text"   name="user_pswd" placeholder="비밀번호 입력" required>
	<input type="submit" value="회원탈퇴">
</form>



</body>
</html>