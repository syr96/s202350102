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
	<h4>인증 게시판</h4>
	<table><!-- 인증 -->
		<c:forEach items="${myCertiList }" var="myCertiList">
			<tr>
				<td><a href="#">${myCertiList.chg_title }</a></td>
				<td><a href="${myCertiList.brd_num }">${myCertiList.title }</a></td>
				<td><fmt:formatDate value="${myCertiList.reg_date }" pattern="yy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</table>
	
	<hr>
	
	<h4>후기 게시판</h4>
	
	<table><!-- 후기 게시판 -->
		<c:forEach items="${myReviewList }" var="myReviewList">
			<tr>
				<td><a href="#">${myReviewList.chg_title }</a></td>
				<td><a href="${myReviewList.brd_num }">${myReviewList.title }</a></td>
				<td><fmt:formatDate value="${myReviewList.reg_date }" pattern="yy-MM-dd"/></td>
				<td><a href="${myReviewList.brd_num }">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<hr>
	
	<h4>자유 게시판</h4>
	
	<table><!-- 자유 게시판 -->
		<c:forEach items="${myCommuList }" var="myCommuList">
			<tr>
				<td><a href="#">${myCommuList.title }</a></td>
				<td><fmt:formatDate value="${myCommuList.reg_date }" pattern="yy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</table>
	
	<hr>
	
	<h4>쉐어링 게시판</h4>
	
	<table><!-- 쉐어링 게시판  -->
		<c:forEach items="${myShareList }" var="myShareList">
			<tr>
				<td><a href="#">${myShareList.title }</a></td>
				<td><fmt:formatDate value="${myShareList.reg_date }" pattern="yy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>