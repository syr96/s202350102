<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 유저 조회</title>
</head>
<body>
	<%@ include file="../adminMenu.jsp" %>
		<div class="col-10">
		<c:set var="num" value="${page.total-page.start+1 }"></c:set>
			<table class="table table-bordered table-sm mb-0">
			  <thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>회원상태</th>
					<th>탈퇴여부</th>
					<th class="text-center"> - </th>
				</tr>
			  </thead>
			  <tbody>
				<c:forEach var="user1" items="${user1List }">
					<tr>
						<td>${num }</td>
						<td>${user1.user_id }</td>
						<td>${user1.user_name}</td>
						<td>${user1.email}</td>
						<td>${user1.tel }</td>
						<c:choose>
							<c:when test="${user1.status_md == 100 }"><td>일반</td></c:when>
							<c:when test="${user1.status_md == 101 }"><td>멤버쉽</td></c:when>
							<c:when test="${user1.status_md == 102 }"><td>관리자</td></c:when>
							<c:when test="${user1.status_md == '' }"><td></td></c:when>
						</c:choose>						
						<td>${user1.delete_yn }</td>
						<td class="justify-content-center"><button type="button" class="btn btn-secondary btn-xs">상세보기</button></td>
					</tr>
					<c:set var="num" value="${num -1 }"></c:set>
				</c:forEach>
			 </tbody>
			</table>
			
				<!-- 페이지네이션  -->
					 <nav class="d-flex justify-content-center justify-content-md-center mt-3">
	      	   		 <ul class="pagination pagination-lg text-gray-400">
					  	<c:if test="${page.startPage > page.pageBlock }">
					  		<li class="page-item">
								<a class="page-link page-link-arrow" href="listUserAdmin?currentPage=${page.startPage-page.pageBlock }">
								<i class="fa fa-caret-left">이전</i></a>
							</li>
						</c:if>
						
					    <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
							<li class="page-item">
									<a class="page-link px-2" href="listUserAdmin?currentPage=${i }">${i}</a>
							</li>
						</c:forEach>
					    <c:if test="${page.endPage < page.totalPage }">
					    	<li class="page-item">
								<a class="page-link page-link-arrow" href="listUserAdmin?currentPage=${page.startPage + page.pageBlock }">
								<i class="fa fa-caret-right">다음</i></a>
							</li>
						</c:if>
					 </ul>
			  		</nav>
			  </div>
		  	</div>
		  <div class="py-10"></div>	
		  </div>
<%@ include file="/WEB-INF/views/footer.jsp" %>		  		

</body>


</html>