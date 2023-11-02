<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>문의게시판</h1>
	<div id="container">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<c:forEach var="board" items="${qBoardList}">
				<c:if test="${board.user_num == user1.user_num || user1.status_md == 102 }">	
					<tr>
						<td>${board.brd_num}</td>
						<td><a href="qBoardDetail?brd_num=${board.brd_num}">${board.title}</a></td>
						<td>${board.view_cnt}</td>
						<td>${board.nick}</td>
						<td>${board.reg_date}</td>
					</tr>
				</c:if>		
			</c:forEach>
		</table>
		<a href="qBoardWrite" class="btn">글쓰기</a>
	</div>
</body>
</html>