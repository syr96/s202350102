<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table><!-- 후기게시판 -->
		<c:forEach items="${myReviewList }" var="myReviewList">
			<tr>
				<td><a href="#">${myReviewList.chg_title }</a></td>
				<td><a href="#">${myReviewList.title }</a></td>
				<td><fmt:formatDate value="${myReviewList.reg_date }" pattern="yy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>