<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header4.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    
    <p>${sessionScope.user_num } 님 환영합니다.</p>

    <input type="button" value="챌린지 관리" class="btn" onclick="location.href='/challengeManagement'"><p>
    <input type="button" value="팔로우 관리" class="btn" onclick="location.href='/followManagement'"><p>
    <input type="button" value="구독 관리" class="btn" onclick="location.href='/subscriptionManagement'"><p>
    <input type="button" value="쉐어링 관리" class="btn" onclick="location.href='/sharingManagement'"><p>
    <input type="button" value="회원정보수정" class="btn" onclick="location.href='/userDetail'"><p>
</body>
<%@ include file="footer.jsp" %>
</html>
