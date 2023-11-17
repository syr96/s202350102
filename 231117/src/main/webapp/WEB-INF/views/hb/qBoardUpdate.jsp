<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
	    $('submit').click(function(event) {
	        var contsValue = $('#conts').val();
	        $('input[name="conts"]').val(contsValue);
	    });
	});
</script>
</head>
<body>
<c:import url="/WEB-INF/views/header4.jsp"/>
	<form action="qBoardUpdate" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${board.brd_num  }" name="brd_num">
		<input type="hidden" value="${board.brd_md  }" name="brd_md">
		<input type="hidden" value="${board.img  }" name="img">
		<table border="1">
			<tr>
				<td>글 번호 </td>
				<td>${board.brd_num }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" value="${board.title }" name="title">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${board.nick }</td>
				<td><input type="hidden" value="${board.user_num }" name="user_num"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<c:if test="${not empty board.img }"><img alt="UpLoad Image" src="${pageContext.request.contextPath}/upload/qBoard/${board.img}"><p></c:if>
					<%@ include file="/WEB-INF/views/hb/test.jsp" %>
					<textarea rows="30" cols="30" id="conts" name="conts">
						${board.conts }
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="확인" id="submit">
					<input type="button" value="취소" onclick="location.href='qBoardDetail?brd_num=${board.brd_num}'">
				</td>
			</tr>
		</table>
	</form>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>