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

</script>
</head>
<body>
<c:import url="/WEB-INF/views/header4.jsp"/>
	<h2>문의게시판 글쓰기폼</h2>
	<form action="qBoardWrite" enctype="multipart/form-data">
		<input type="hidden" name="brd_lg" value="400">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required="required"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="brd_md">
						<option value="100" selected="selected">회원관련</option>
						<option value="101">버그</option>
						<option value="102">챌린지</option>
						<option value="103">쉐어링</option>
						<option value="104">팔로워</option>
						<option value="105">기타/건의</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td>파일</td>
				<td><input type="file" name="file" id="file"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="30" cols="30" name="conts" id="conts" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="확인">
					<input type="button" onclick="location.href='qBoardList'" value="취소">
				</td>
			</tr>
		</table>
	</form>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>