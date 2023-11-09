<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>테스트</h1>
	<table class="table table-bordered table-sm table-hover" border="1">
		       <thead>
		         <tr>
		           <th>글번호</th>
		           <th>제목</th>
		           <th>작성자</th>
		           <th>조회수</th>
		           <th>작성일</th>
		         </tr>
		       </thead>
		       <tbody>
		         <c:forEach var="review" items="${chgReviewList}">
		          <tr>
		            <td>${review.rn }</td>
		            <td>${review.title }</td>
		            <td>${review.nick }</td>
		            <td>${review.view_cnt }</td>
		            <td><fmt:formatDate value="${review.reg_date }" pattern="yyyy-MM-dd"/></td>
		          </tr>
		         </c:forEach>
		       </tbody>
     </table>
</body>
</html>