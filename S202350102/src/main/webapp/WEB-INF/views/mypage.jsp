<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>마이페이지</h1>
<p>${sessionScope.user_id } 님 환영합니다.</p>

<input type="button" value="회원정보수정" class="btn" onclick="location.href='/jk/memberupdate'"><p>
<input type="button" value="회원정보수정" class="btn" onclick="location.href='/jk/memberupdate'"><p>

</body>
</html>