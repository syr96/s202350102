<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="noticeUpdateForm">
		<input type="hidden" value="${noticeConts.brd_num  }" name="brd_num">
		<table border="1">
			<tr>
				<td>글 번호 </td>
				<td>${noticeConts.brd_num }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${noticeConts.title }</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${noticeConts.view_cnt }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${noticeConts.user_num }</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${noticeConts.reg_date }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${noticeConts.conts }</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="button" value="목록" onclick="location.href='notice?brd_md=${noticeConts.brd_md}'">
					<input type="button" value="삭제" onclick="location.href='deleteNoticeForm?brd_num=${noticeConts.brd_num}'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>