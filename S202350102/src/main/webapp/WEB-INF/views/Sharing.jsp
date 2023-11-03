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
 <meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); 
    	body{
    	font-family: 'Noto Sans KR', sans-serif;} 
        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(227px, 1fr));
            gap: 20px;
        }
        .gallery-item {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
 
    </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

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
                <a class="list-group-item list-group-item-action dropend-toggle " href="account-orders.html">
                  	전체 쉐어링
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle active" href="account-wishlist.html">
                 	찜한 쉐어링
                </a>
              </div>
            </nav>

          </div>
          <div class="col-12 col-md-9 col-lg-8 offset-lg-1">


  <div class="row">
    <c:forEach var="board" items="${Sharing}">
        <div class="col-6 col-md-4">
            <div class="card mb-7">
                <div class="card-img">
                    <button class="btn btn-xs btn-circle btn-white-primary card-action card-action-end" onclick="likePost(${board.brd_num})">
                        <i class="fe fe-heart"></i>
                    </button>
                   <button class="btn btn-xs w-100 btn-dark card-btn" onclick="location.href='detailCommunity?user_num=${board.user_num}&brd_num=${board.brd_num}'">
				    <i class="fe fe-eye me-2 mb-1"></i> 자세히 보기
					</button>

                    <img class="card-img-top" src="${board.img}" alt="...">
                </div>
                <div class="card-body fw-bold text-center">
                    <a class="text-body" href="detailCommunity?user_num=${board.user_num}&brd_num=${board.brd_num}">
                        ${board.title}
                    </a><p>
                    <a class="text-primary" href="detailCommunity?user_num=${board.user_num}&brd_num=${board.brd_num}">
                        ${board.price}원</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>


            <!-- Pagination -->
            <nav class="d-flex justify-content-center justify-content-md-end">
              <ul class="pagination pagination-sm text-gray-400">
                <li class="page-item">
                  <a class="page-link page-link-arrow" href="#">
                    <i class="fa fa-caret-left"></i>
                  </a>
                </li>
                <li class="page-item active">
                  <a class="page-li nk" href="#">1</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">5</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">6</a>
                </li>
                <li class="page-item">
                  <a class="page-link page-link-arrow" href="#">
                    <i class="fa fa-caret-right"></i>
                  </a>
                </li>
              </ul>
            </nav>

          </div>
        </div>
      </div>
    </section>
  
  
  
  
  
  
  
  
  
  
  
   
</body>
<%@ include file="footer.jsp" %>
</html>
