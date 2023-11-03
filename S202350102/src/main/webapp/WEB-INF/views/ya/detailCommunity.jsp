<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>게시글 상세내용 확인</h3>

<input type="hidden" name="brd_num" value="${board.brd_num}"> 
		
<c:if test="${loggedIn}">
    <c:if test="${board.user_id == sessionScope.user_id}">
        <a href="updateCommunityForm?brd_num=${board.brd_num}" class="btn btn-primary">수정</a>
        <a href="deleteCommunity?brd_num=${board.brd_num}" class="btn btn-danger">삭제</a>
    </c:if>
</c:if>


<!--제목, 닉네임,  조회수, 작성일자, 내용, 댓글창 수정 삭제, 목록이동 -->
<table>
	<tr>
		<th>제목</th> <td>
		<td>${board.title}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${board.nick}</td>
	</tr>
	<tr>
		<td> 조회수 </td>
		<td> ${board.view_cnt} </td>
	</tr>
	<tr>
		<th>작성일자</th>
		<td>${board.reg_date}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${board.conts}</td>
	</tr>
	
</table>
</body>
</html>