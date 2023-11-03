<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<c:import url="/WEB-INF/views/header4.jsp"/>

<h1>로그인</h1>
<form action="login" method="post">
	<fieldset>
		<input type="text" name="user_id" required placeholder="아이디"><p><p>
		<input type="text" name="user_pswd" required placeholder="비밀번호"><p>
		<input type="submit" value="로그인">	<input type="reset" value="다시쓰기">
	</fieldset>
</form>

<c:import url="/WEB-INF/views/footer.jsp"/>

</body>
</html>