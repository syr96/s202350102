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
	<table>
		<c:forEach items="${srch_chgResult }" var="chResultList">
			<tr>
				<td>${chResultList.title }</td>
				<td>${chResultList.reg_date }</td>
				<td>${chResultList.user_num }</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	<table>
		<c:forEach items="${srch_brdResult }" var="brdResultList">
			<tr>
				<td>${brdResultList.title }</td>
				<td>${brdResultList.reg_date }</td>
				<td>${brdResultList.user_num }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>