<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header4.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="noticeUpdate" method="post">
		<input type="hidden" value="${noticeConts.brd_num  }" name="brd_num">
		<input type="hidden" value="${noticeConts.brd_md  }" name="brd_md">
		<table border="1">
			<tr>
				<td>글 번호 </td>
				<td>${noticeConts.brd_num }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" value="${noticeConts.title }" name="title">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${noticeConts.user_num }</td>
				<td><input type="hidden" value="${noticeConts.user_num }" name="user_num"></td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${noticeConts.reg_date }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="30" cols="30" name="conts">
						${noticeConts.conts }
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="확인">
					<input type="button" value="취소" onclick="location.href='noticeConts?brd_num=${noticeConts.brd_num}'">
				</td>
			</tr>
		</table>
	</form>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>