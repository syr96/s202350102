<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="document_136648_5 rhymix_content xe_content">
		<table border="1" style="width:500px;">
			<tbody>
				<tr>
					<td style="text-align: center;"><span style="font-family:굴림,Gulim,sans-serif;"><span style="font-size:16px;">레벨</span></span></td>
					<td style="text-align: center;"><span style="font-family:굴림,Gulim,sans-serif;"><span style="font-size:16px;">아이콘</span></span></td>
					<td style="text-align: center;"><span style="font-family:굴림,Gulim,sans-serif;"><span style="font-size:16px;">경험치</span></span></td>
					<td style="text-align: center;"><span style="font-family:굴림,Gulim,sans-serif;"><span style="font-size:16px;">설명</span></span></td>
				</tr>
				<c:forEach var="level" items="${level1List }">
					<tr>
						<td style="text-align: center;"><span style="font-family:굴림,Gulim,sans-serif;"><span style="font-size:16px;">${level.user_level }</span></span></td>
						<td style="text-align: center;"><span style="font-family:굴림,Gulim,sans-serif;"><img alt="${level.user_level }" src="/images/level/${level.lv_name }.gif"></span></td>
						<td style="text-align: center;"><span style="font-family:굴림,Gulim,sans-serif;"><span style="font-size:16px;">${level.tot_exp }.Exp</span></span></td>
						<td style="text-align: center;"><span style="font-family:굴림,Gulim,sans-serif;"><span style="font-size:16px;">${level.lv_name }레벨</span></span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>