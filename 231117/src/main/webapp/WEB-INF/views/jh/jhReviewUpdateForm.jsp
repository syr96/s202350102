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
		<div class="row justify-content-center py-9">
			<div class="col-12 col-lg-10 col-xl-8">
				<!-- Heading -->
				<h4 class="mb-10 text-center">후기 게시판</h4>
				<div class="card mb-3">
  	
  	
	<!-- 후기 글 내용 -->
	<div class="card-body">

	  <h3 class="card-title">${reviewContent.title }</h3>
	  <h6 class="card-subtitle mb-2 text-muted">${reviewContent.nick }${result }</h6>
	  
	  		 <c:choose>
		    <c:when test="${empty reviewContent.img}">
				<img src="assets/img/chgDfaultImg.png" alt="이미지가 없습니다" style="max-width: 700px; max-height: 600px; width: auto; height: auto;">
		    </c:when>
		    <c:otherwise>
				 <img src="${pageContext.request.contextPath}/upload/${reviewContent.img}" class="card-img-top" alt="이미지 업로드에 실패했습니다." style="max-width: 700px; max-height: 600px; width: auto; height: auto;">
		    </c:otherwise>
		</c:choose>
	  <!-- 이미지 null 아닌 경우 출력 -->
	  <c:if test="${not empty reviewContent.img} ">
	    <img src="${pageContext.request.contextPath}/upload/${reviewContent.img}" class="card-img-top" alt="이미지 업로드에 실패했습니다." style="max-width: 300px; max-height: 200px; width: auto; height: auto;">
  	  </c:if>
	  <p class="card-text">${reviewContent.conts }</p>
	  <p class="card-text"><small class="text-muted"><fmt:formatDate value="${reviewContent.reg_date }" pattern="yyyy-MM-dd"/></small></p>
	  <p class="card-text"><small class="text-muted">조회수 : ${reviewContent.view_cnt }</small>
	  <p class="card-text"><small class="text-muted">댓글수 : ${reviewContent.replyCount } </small>
	 </div>
							<!-- Header -->
							<div class="row align-items-center">
								
								<div class="col-12 col-md text-md">
				
								<!-- Count -->
				
								</div>
								
								<div class="col-12 col-md-auto">
				
								<!-- Button -->
								<a class="btn btn-sm btn-dark" data-bs-toggle="collapse" href="#reviewForm">
									Write Review
								</a>
				
								</div>
							</div>
						

							<!-- New Review -->
							<div class="collapse" id="reviewForm">
				
								<!-- Divider -->
								<hr class="my-8">
								
								<div class="col-12 col-md-auto">
				
								<strong class="fs-sm ms-2">${user.nick }님 후기를 입력해 주세요!</strong><p>
									
								</div>
				
								<!-- Form -->
								<form action="/reviewPost" method="post"  enctype="multipart/form-data">
								<input type="hidden" 	name="chg_id" 		value="${chg.chg_id}" >
								<input type="hidden" 	name="user_num" 	value="${user.user_num}" >
								<div class="row">
					
									<div class="col-12">
				
									<!-- Name -->
									<div class="form-group">
										<label class="visually-hidden" for="reviewTitle">Review Title:</label>
										<input class="form-control form-control-sm" id="reviewTitle" type="text" name="title" placeholder="Review Title *" required>
									</div>
				
									</div>
									<div class="col-12">
				
									<!-- Name -->
									<div class="form-group">
										<label class="visually-hidden" for="reviewText">Review:</label>
										<textarea class="form-control form-control-sm" id="reviewText" rows="5" name="conts" placeholder="Review *" required></textarea>
									</div>
				
									</div>
									
									<div class="input-group mb-3">
										<input type="file" class="form-control" name="file" id="inputGroupFile02">
										<label class="input-group-text" for="inputGroupFile02">이미지 업로드</label>
									</div>
									
									<div class="col-12 text-center">
				
									<!-- Button -->
									<button class="btn btn-outline-dark" type="submit">
										등록
									</button>
				
									</div>
								</div>
								</form>
				
							</div>
			</div>
		</div>
	</div>
</body>
</html>