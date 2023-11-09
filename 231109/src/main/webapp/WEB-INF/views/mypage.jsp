<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header4.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="./assets/favicon/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./assets/css/libs.bundle.css" />
    <link rel="stylesheet" href="./assets/css/theme.bundle.css" />
    <title>Insert title here</title>
</head>
<body>
    <p>${sessionScope.user_num } 님 환영합니다.</p>

    <button type="button" class="btn btn-primary" onclick="location.href='/challengeManagement'">챌린지 관리</button><p>
    <button type="button" class="btn btn-primary" onclick="location.href='/followManagement'">팔로우 관리</button><p>
    <button type="button" class="btn btn-primary" onclick="location.href='/subscriptionManagement'">구독 관리</button><p>
    <button type="button" class="btn btn-primary" onclick="location.href='/sharingManagement'">쉐어링 관리</button><p>
    <button type="button" class="btn btn-primary" onclick="location.href='/userDetail'">회원정보수정</button><p>
    <button type="button" class="btn btn-primary" onclick="location.href='/chgCommManagement'">챌린지 카테고리 관리</button><p>
</body>
<%@ include file="footer.jsp" %>
</html>
