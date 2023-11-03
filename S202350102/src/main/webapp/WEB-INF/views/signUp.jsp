<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/header4.jsp"/>

<h1>회원가입</h1>
<form method="post" action="/writeUser1">
	<fieldset>
	<input type="text" name="user_id" 	required placeholder="아이디"><p><p>
	<input type="text" name="user_pswd" required placeholder="비밀번호"><p>
	<input type="text" name="nick" 		required placeholder="닉네임"><p>
	<input type="text" name="user_name" required placeholder="이름"><p>
	<input type="text" name="email" 	required placeholder="이메일"><p>
	<input type="text" name="birth" 	required placeholder="생년월일"><p>
	<input type="text" name="addr" 		required placeholder="주소"><p>
	<input type="text" name="tel" 		required placeholder="전화번호"><p>
		  
	<input type="radio" name="gender" value="M">남자
	<input type="radio" name="gender" value="F">여자 <p>
	
	
	<input type="submit" value="회원가입">	
	<input type="reset" value="다시 입력">
	</fieldset>
	
<c:import url="/WEB-INF/views/footer.jsp"/>
</form>
</body>
</html>