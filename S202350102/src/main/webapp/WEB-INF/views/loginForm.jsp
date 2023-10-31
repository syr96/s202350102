<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h1>로그인</h1>
<form action="login" method="post">
	<fieldset>
		<input type="text" name="user_id" required placeholder="아이디"><p>
		<input type="text" name="user_pswd" required placeholder="비밀번호"><p>
		<input type="submit" value="로그인">	<input type="reset" value="다시쓰기">
	</fieldset>
</form>

</body>
</html>