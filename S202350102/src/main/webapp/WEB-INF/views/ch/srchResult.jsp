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
	<div id="searchVar">
		<form action="searching">
			<table>
				<tr><td><label for="srch_word">검색</label></td>
					<td><input type="text" name="srch_word" id="srch_word" value="${srch_word }">
					<button type="submit">검색</button></td></tr>
			</table>
		</form>
	</div>
	<h2>${srch_word }에 대한 검색결과 입니다.</h2>
	<h4>챌린지</h4>
	<c:if test="${empty srch_chgResult }">
		<h6>검색결과가 없습니다.</h6>
	</c:if>
	<table>
		<c:forEach items="${srch_chgResult }" var="chResultList">
			<tr>
				<td>
					<a href="challengeDetail?chg_id=${chResultList.chg_id }">${chResultList.title }</a>
				</td>
				<td><fmt:formatDate value="${chResultList.reg_date }" pattern="yyyy-MM-dd"/></td>
				<td>${chResultList.nick }</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	<h3>커뮤니티</h3>
	<c:if test="${empty srch_brdResult }">
		<h6>검색결과가 없습니다.</h6>
	</c:if>
	<table>
		<c:forEach items="${srch_brdResult }" var="brdResultList">
			<tr>
				<td>
					<a href="detailCommunity?user_num=${brdResultList.user_num}&brd_num=${brdResultList.brd_num}">${brdResultList.title }</a>
				</td>
				<td><fmt:formatDate value="${brdResultList.reg_date }" pattern="yyyy-MM-dd"/></td>
				<td>${brdResultList.nick }</td>
			</tr>
		</c:forEach>
	</table>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>