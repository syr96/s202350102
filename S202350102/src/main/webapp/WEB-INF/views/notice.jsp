<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지사항</h1>
	
	<table border="1">
		<tr>
		<th>순번</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th>
		<tr>
		<c:forEach var="noticeList" items="${noticeList }">
			<tr>
				<td>${noticeList.brd_num}</td>
				<td><a href="noticeConts?brd_num=${noticeList.brd_num}">${noticeList.title}</a></td>
				<td>${noticeList.user_num}</td>
				<td>${noticeList.reg_date}</td>				
				<td>${noticeList.view_cnt}</td>
			</tr>
		</c:forEach>
		<tr><!-- id조회 혹은 권한 조회로 안보이게 구현하기 -> ID Session? 조회 user1, if 권한이 있으면 활성화 아니면 안보이게, 작성자 user_num 가져오기 -->
			<td colspan="5">
				<form action="noticeWriteForm" method="post">
					<input type="hidden" value="${brd_md }" name="brd_md">
					<input type="submit" value="글쓰기">
				</form>
			</td>
		</tr>
	</table>
	<c:choose>
		<c:when test="${brd_md == 105 }">		
			<a href="notice?brd_md=106">이벤트</a>
		</c:when>
		<c:when test="${brd_md == 106 }">
			<a href="notice?brd_md=105">공지</a>
		</c:when>
	</c:choose>
	
	
</body>
</html>