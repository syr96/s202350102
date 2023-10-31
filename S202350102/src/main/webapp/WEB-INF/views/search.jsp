<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>검색</h1>
	
	<div id="searchVar">
		<form action="searching">
			<table>
				<tr><td><label for="srch_word">검색</label></td>
					<td><input type="text" name="srch_word" id="srch_word">
					<button type="submit">검색</button></td></tr>
			</table>
		</form>
	</div>
	
	<hr>
	
	<div id="popchg">
		<table>
			<tr>
				<td>제목</td><td>신청자</td><td>신청일</td><td>시작일</td>
			</tr>
			<c:forEach var="popchg" items="${popchgList }">
				<tr>
					<td><a href="chg?chg_id=${popchg.chg_id }">${popchg.title }</a></td>
					<td>${popchg.user_num }</td>
					<td>${popchg.reg_date }</td>
					<td>${popchg.start_date }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<hr>
	
	<div id="popcommu">
		<table>
			<tr>
				<td>제목</td><td>작성자</td><td>좋아요</td><td>등록일</td>
			</tr>
			<c:forEach var="popBoard" items="${popBoardList }">
				<tr>
					<td><a href="commu?brd_num=${popBoard.brd_num }">${popBoard.title }</a></td>
					<td>${popBoard.user_num }</td>
					<td>${popBoard.like_cnt }</td>
					<td>${popBoard.reg_date }</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>