<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
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

</script>
</head>
<body>
   <section class="pt-7 pb-12">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center">

            <!-- Heading -->
            <h3 class="mb-10">쉐어링 게시판</h3>

          </div>
        </div>
        <div class="row">
          <div class="col-12 col-md-3">

            <!-- Nav -->
            <nav class="mb-10 mb-md-0">
              <div class="list-group list-group-sm list-group-strong list-group-flush-x">
                <a class="list-group-item list-group-item-action dropend-toggle active" href="../sharing">
                  	전체 쉐어링
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="account-wishlist.html">
                 	찜한 쉐어링
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="/mySharing">
                 	내가 쓴 글
                </a>
               <a class="btn w-100 btn-dark mb-2" href="sharingUserDetail" style=" margin-top: 50px;">게시글 작성하기
               </a>
                
              </div>
            </nav>
 			<!-- Nav End -->
          </div>
              
          <div class="col-12 col-md-9 col-lg-8 offset-lg-1">
            <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-between mb-3">
                <!-- 공간을 벌리기 위해 클래스 추가 -->
            </div>
            <div class="d-flex justify-content-end mb-3">
              <select class="form-select form-select-xxs w-auto">
                  <option value="1">최근 게시물</option>
                  <option value="1">조회수 높은 순</option>
              </select>
            </div>
            </div>
  <div class="row">
  	<c:set var="usernum" value="${sessionScope.user_num}" />
	<c:set var="mySharingList" value="${mySharing}" />
    <c:forEach var="board" items="${mySharing}">
  	<c:if test = "${board.user_num eq usernum}">
        <div class="col-6 col-md-4" style="padding-left: 8px; padding-right: 8px;">
            <div class="card mb-7">
                <div class="card-img">
                    <button class="btn btn-xs btn-circle btn-white-primary card-action card-action-end" onclick="likePost(${board.brd_num})">
                        <i class="fe fe-heart"></i>
                    </button>
                   <button class="btn btn-xs w-100 btn-dark card-btn" onclick="location.href='myDetailSharing?user_num=${board.user_num}&brd_num=${board.brd_num}'">
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
                    						<i class="fe fe-eye me-1 mb-1" style="margin-left: 30px;"></i> ${board.view_cnt}
                    						<i class="fas fa-comment text-secondary me-1" style="margin-left: 20px;"></i>${board.replyCount}
                    				
				</div>
				 
            </div>
        </div>
    </c:if>
    </c:forEach>
    </div>
</div>


          </div>
        </div>
      </div>
    </section>
  
  
  
  
  
  
  
  
  
  
  
   
</body>
<%@ include file="../footer.jsp" %>
</html>
