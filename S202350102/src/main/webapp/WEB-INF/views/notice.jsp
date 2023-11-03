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
	<c:if test="${brd_md == 105 }"><h1>공지</h1></c:if>
	<c:if test="${brd_md == 106 }"><h1>이벤트</h1></c:if>
	
	<c:set var="num" value="${page.total-page.start+1 }"></c:set>
	
	<table border="1">
		<tr>
		<th>순번</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th>
		<tr>
		<c:forEach var="noticeList" items="${noticeList }">
			<tr>
				<td>${num}</td>
				<td><a href="noticeConts?brd_num=${noticeList.brd_num}">${noticeList.title}</a></td>
				<td>${noticeList.nick}</td>
				<td><fmt:formatDate value="${noticeList.reg_date }" pattern="yyyy-MM-dd"/></td>				
				<td>${noticeList.view_cnt}</td>
			</tr>
			<c:set var="num" value="${num -1 }"></c:set>
		</c:forEach>
		
		<c:if test="${status_md == 102 }">
			<tr><!-- id조회 혹은 권한 조회로 안보이게 구현하기 -> ID Session? 조회 user1, if 권한이 있으면 활성화 아니면 안보이게, 작성자 user_num 가져오기 -->
				<td colspan="5">
					<form action="noticeWriteForm" method="post">
						<input type="hidden" value="${brd_md }" name="brd_md">
						<input type="submit" value="글쓰기">
					</form>
				</td>
			</tr>
		</c:if>
	</table>
	<c:choose>
		<c:when test="${brd_md == 105 }">		
			<a href="notice?brd_md=106">이벤트</a>
		</c:when>
		<c:when test="${brd_md == 106 }">
			<a href="notice?brd_md=105">공지</a>
		</c:when>
	</c:choose>
	
	<c:if test="${page.startPage > page.pageBlock }">
		<a href="notice?currentPage=${page.startPage - page.pageBlock }&brd_md=${brd_md }">[이전]</a>		
	</c:if>
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
		<a href="notice?currentPage=${i }&brd_md=${brd_md }">[${i }]</a><!-- 바꾸고 싶다면 currentPage와 keyword를 가져가는 알고리즘을 짜면 될 듯  -->
	</c:forEach>
	<c:if test="${page.endPage < page.totalPage }">
		<a href="notice?currentPage=${page.startPage + page.pageBlock }&brd_md=${brd_md }">[다음]</a>
	</c:if>
	
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>