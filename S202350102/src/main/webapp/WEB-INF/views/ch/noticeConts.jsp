<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/header4.jsp"/>

	<form action="noticeUpdateForm" onsubmit="return chk()">
		<input type="hidden" value="${noticeConts.brd_num  }" name="brd_num">
		<input type="hidden" value="${noticeConts.user_num  }" name="user_num">
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
				<td>${noticeConts.nick }</td>
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
					<c:if test="${status_md==102 }">
						<input type="submit" value="수정" >
						<input type="button" value="삭제" onclick="location.href='deleteNoticeForm?brd_num=${noticeConts.brd_num}'">
					</c:if>
					<input type="button" value="목록" onclick="location.href='notice?brd_md=${noticeConts.brd_md}'">
				</td>
			</tr>
		</table>
	</form>

<c:import url="/WEB-INF/views/footer.jsp"/>	
</body>
</html>