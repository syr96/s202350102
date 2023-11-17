<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header4.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<!--  CSS  -->
<link rel="shortcut icon" href="./assets/favicon/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./assets/css/libs.bundle.css" />
<link rel="stylesheet" href="./assets/css/theme.bundle.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

 <meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); 
    	body{
    	font-family: 'Noto Sans KR', sans-serif;} 
			
    </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
function likePost(brd_num) {
  
	$.ajax({
	    type: 'POST',
	    url: '/board/' + brd_num + '/like', // 좋아요 업데이트를 처리할 서버 엔드포인트
	    data: { brd_num : brd_num }, // 업데이트할 게시물의 ID를 전송
	    success: function (response) {
	        // 성공 시 수행할 작업
	    },
	    error: function (error) {
	        // 오류 발생 시 수행할 작업
	    }
	});
}


</script>

</head>
<body>
		<div class="container">
	        <div class="row">
	        	<div class="col-12">	
	            	<!-- Heading -->
	            	<h5 class="mb-4">챌린지 목록</h5>
	            
		            <!-- Nav -->
		            <div class="nav justify-content-center mb-10">
		            	<a class="nav-link active" href="#topSellersTab" data-bs-toggle="tab">참여 챌린지</a>
		            	<a class="nav-link" href="#topSellersTab" data-bs-toggle="tab">신청한 챌린지</a>
		            	<a class="nav-link" href="#topSellersTab" data-bs-toggle="tab">최근 본 챌린지</a>
		            	<a class="nav-link" href="#topSellersTab" data-bs-toggle="tab">찜한 챌린지</a>
		            </div>	
		            
	            	<!-- Content -->
		            <div class="tab-content">	
		            	<!-- Pane -->
		            	<div class="tab-pane fade show active" id="topSellersTab">
		            	  <!-- Slider -->
			                <div class="flickity-buttons-lg flickity-buttons-offset px-lg-6" data-flickity='{"prevNextButtons": true}'>			
							 <c:forEach var="board" items="${popShareList}">
			                  <div class="card mb-7">
                <div class="card-img">
                    <button class="btn btn-xs btn-circle btn-white-primary card-action card-action-end" onclick="likePost(${board.brd_num})">
                        <i class="fe fe-heart"></i>
                    </button>
                   <button class="btn btn-xs w-100 btn-dark card-btn" onclick="location.href='detailSharing?user_num=${board.user_num}&brd_num=${board.brd_num}'">
				    <i class="fe fe-eye me-2 mb-1"></i> 자세히 보기
					</button>

                  <img class="card-img-top" src="${pageContext.request.contextPath}/upload/${board.img}" alt="..." style="width: 100%; height: 200;">
					 </div>
                <div class="card-body fw-bold text-center">
                    <a class="text-body" href="detailSharing?user_num=${board.user_num}&brd_num=${board.brd_num}">
                        ${board.title}
                    </a><p>
                    <a class="text-primary" href="detailSharing?user_num=${board.user_num}&brd_num=${board.brd_num}">
                        ${board.price}원</a><p>
                    <a class="text-primary"><i class="fas fa-heart me-1"></i> ${board.like_cnt}</a>
                    						<i class="fe fe-eye me-1 mb-1" style="margin-left: 20px;"></i> ${board.view_cnt}
                    						<i class="fas fa-comment text-secondary me-1" style="margin-left: 20px;"></i>${board.replyCount}
                    				
				</div>
				 
            </div>
					  
				</c:forEach>		
			                		          
			                </div> <!-- slider -->
		
		            	</div> <!-- topSellertsTab -->
		        	</div> <!-- tab-content -->
				</div> <!-- col-12 -->
			</div> <!-- row -->
		</div> <!-- container -->

<%@ include file="footer.jsp" %>
</html>
