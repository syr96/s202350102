<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ include file="/WEB-INF/views/header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="searchVar">
		<form action="searching">
			<table>
				<tr><td><label for="srch_word">검색</label></td>
					<td><input type="text" name="srch_word" id="srch_word" value="${srch_word }" list="wordlist">
						<datalist id="wordlist">
							<option value="test">test</option>
							<option value="test">test</option>
							<option value="test">test</option>
						</datalist>
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
		<c:set var="num" value="1"/>
		<c:forEach items="${srch_chgResult }" var="chResultList" varStatus="status">
			<c:if test="${num < 6 }">
				<tr>
					<td>
						<a href="challengeDetail?chg_id=${chResultList.chg_id }">${chResultList.title }</a>
					</td>
					<td><fmt:formatDate value="${chResultList.reg_date }" pattern="yyyy-MM-dd"/></td>
					<td>${chResultList.nick }</td>
				</tr>
			<c:set var="num" value="${num+1 }"/>
			</c:if>	
		</c:forEach>
	</table>
	<hr>
	
	<h3>쉐어링</h3>
	<c:if test="${empty srch_shareResult }">
		<h6>검색결과가 없습니다.</h6>
	</c:if>
	<table>
		
		<c:set var="num" value="1"/>
		<c:forEach items="${srch_shareResult }" var="shrResultList" varStatus="status">
			<c:if test="${num < 6 }">
				<tr>
					<td>
						<a href="detailCommunity?user_num=${shrResultList.user_num}&brd_num=${shrResultList.brd_num}">${shrResultList.title }</a>
					</td>
					<td><fmt:formatDate value="${shrResultList.reg_date }" pattern="yyyy-MM-dd"/></td>
					<td>${shrResultList.nick }</td>
				</tr>
				<c:set var="num" value="${num+1 }"/>
			</c:if>
		</c:forEach>
	</table>
	
	<hr>
	
	<h3>자유게시판</h3>
	<c:if test="${empty srch_brdResult }">
		<h6>검색결과가 없습니다.</h6>
	</c:if>
	<table>
		<c:set var="num" value="1"/>	
		<c:forEach items="${srch_brdResult }" var="brdResultList">
			<c:if test="${num < 6 }">
				<tr>
					<td>
						<a href="detailCommunity?user_num=${brdResultList.user_num}&brd_num=${brdResultList.brd_num}">${brdResultList.title }</a>
					</td>
					<td><fmt:formatDate value="${brdResultList.reg_date }" pattern="yyyy-MM-dd"/></td>
					<td>${brdResultList.nick }</td>
				</tr>
				<c:set var="num" value="${num+1 }"/>
			</c:if>
		</c:forEach>
		
	</table>
<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>