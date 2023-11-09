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
	<h2>문의게시판 디테일</h2>
	<div id="qboard_title">
		<p>${board.title }
			<a href="qBoardUpdateForm?brd_num=${board.brd_num }">수정</a>
			<a href="qBoardDelete?brd_num=${board.brd_num }">삭제</a>
			<a href="qBoardList?board=${board }">목록</a></p>
	</div>
	<hr width="100%">
	<div id="qboard_content">
		<p>${board.conts }</p>
	</div>
	<hr width="100%">
	<div id="qboard_comment">
		
	</div>

<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>