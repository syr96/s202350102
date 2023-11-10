<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<!-- CSS -->
<link rel="shortcut icon" href="./assets/favicon/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./assets/css/libs.bundle.css" />
<link rel="stylesheet" href="./assets/css/theme.bundle.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    @import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<!-- PRODUCT -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <div class="col-12 col-md-6">
                        <!-- Images -->
                        <div class="row gx-5 mb-10 mb-md-0">
                            <div class="col-2">
                                <!-- Slider -->
                                <div class="flickity-nav flickity-vertical" data-flickity='{"asNavFor": "#productSlider", "draggable": false}'>
                                    <!-- Item -->
                                    <div class="ratio ratio-1x1 bg-cover mb-4" style="background-image: url(${pageContext.request.contextPath}/upload/${board.img});"></div>
                                </div>
                            </div>
                            <div class="col-10">
                                <!-- Card -->
                                <div class="card">
                                    <!-- Badge -->
                                    <div class="badge bg-secondary card-badge card-badge-end text-uppercase">
                                        Out of Stock
                                    </div>
                                    <!-- Slider -->
                                    <div data-flickity='{"draggable": false, "fade": true}' id="productSlider">
                                        <!-- Item -->
                                        <a href="${pageContext.request.contextPath}/upload/${board.img}">
                                            <img src="${pageContext.request.contextPath}/upload/${board.img}" alt="..." class="card-img-top">
                                        </a>
                                        <!-- Other Items -->
                                        <!-- ... -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 ps-lg-10" style="margin-top: 40px;">
                        <!-- Header -->
                        <div class="row mb-1">
                            <div class="col">
                                <!-- Preheading -->
                                <a class="text-muted" href="../sharing">쉐어링 게시판</a>
                            </div>
                            <div class="col-auto">
                                <a class="fs-sm text-reset ms-2" href="#reviews">
                                    Reviews ()
                                </a>	
                            </div>
                        </div>
                        <!-- Heading, Price, Form -->
                        <h3 class="mb-1">${board.title}</h3>
                        <div class="mb-3 text-gray-400">
                            <span class="ms-1 fs-5 fw-bold">${board.price}원</span>
                        </div>
                        <hr class="my-3">
                        
                        <!--  신청내용 -->
                        <p class="mb-4 fs-sm fw-bold">
	                      <a class="text-body" href="product.html">작성일</a> <br>
	                      <span class="text-muted">${board.reg_date}</span>
	                    </p>
	                    
	                    <p class="mb-4 fs-sm fw-bold">
	                      <a class="text-body" href="product.html">모집인원</a> <br>
	                      <span class="text-muted">${board.applicants}명</span>
	                    </p>
                        
                        <p class="mb-4 fs-sm fw-bold">
	                      <a class="text-body" href="product.html">참여인원</a> <br>
	                      <span class="text-muted">${board.participants}명</span>
	                    </p>
                        
                        <p class="mb-4 fs-sm fw-bold">
	                      <a class="text-body" href="product.html">거래지역</a> <br>
	                      <span class="text-muted">${board.addr}</span>
	                    </p>
                        
                        <p class="mb-4 fs-sm fw-bold">
	                      <a class="text-body" href="product.html">내용</a> <br>
	                      <span class="text-muted">${board.conts}</span>
	                    </p>
                        <form>
                            <div class="form-group">
                                <!-- Labels for Applicants, Participants, and Content -->
                                <!-- ... -->
                                <!-- Submit Buttons -->
                                <div class="row">
                                    <div class="col-lg-6 mb-2">
                                        <button class="btn btn-dark w-100" data-toggle="button">
                                            <i class="fe fe-mail me-2"></i> 구매신청
                                        </button>
                                    </div>
                                    <div class="col-lg-6 mb-2">
                                        <button class="btn btn-outline-dark w-100" data-toggle="button">
                                            찜하기 <i class="fe fe-heart ms-2"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- Additional Text with Registration Link -->
                                <span class="text-gray-500">마음에 드시는 물건이 있으신가요?<a class="text-reset text-decoration-underline" data-bs-toggle="modal" href="../loginForm"> 회원가입 후 이용하실 수 있습니다!</a></span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- REVIEWS -->
    <section class="pt-9 pb-11" id="reviews">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Heading -->
            <h4 class="mb-10 text-center">Reviews</h4>

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

              <!-- Form -->
              <form>
                <div class="row">
                  <div class="col-12 mb-6 text-center">

                    <!-- Text -->
                    <p class="mb-1 fs-xs">
                      Score:
                    </p>

                    <!-- Rating form -->
                    <div class="rating-form">

                      <!-- Input -->
                      <input class="rating-input" type="range" min="1" max="5" value="5">

                      <!-- Rating -->
                      <div class="rating h5 text-dark" data-value="5">
                        <div class="rating-item">
                          <i class="fas fa-star"></i>
                        </div>
                        <div class="rating-item">
                          <i class="fas fa-star"></i>
                        </div>
                        <div class="rating-item">
                          <i class="fas fa-star"></i>
                        </div>
                        <div class="rating-item">
                          <i class="fas fa-star"></i>
                        </div>
                        <div class="rating-item">
                          <i class="fas fa-star"></i>
                        </div>
                      </div>

                    </div>

                  </div>
                  <div class="col-12 col-md-6">

                    <!-- Name -->
                    <div class="form-group">
                      <label class="visually-hidden" for="reviewName">Your Name:</label>
                      <input class="form-control form-control-sm" id="reviewName" type="text" placeholder="Your Name *" required>
                    </div>

                  </div>
                  <div class="col-12 col-md-6">

                    <!-- Email -->
                    <div class="form-group">
                      <label class="visually-hidden" for="reviewEmail">Your Email:</label>
                      <input class="form-control form-control-sm" id="reviewEmail" type="email" placeholder="Your Email *" required>
                    </div>

                  </div>
                  <div class="col-12">

                    <!-- Name -->
                    <div class="form-group">
                      <label class="visually-hidden" for="reviewTitle">Review Title:</label>
                      <input class="form-control form-control-sm" id="reviewTitle" type="text" placeholder="Review Title *" required>
                    </div>

                  </div>
                  <div class="col-12">

                    <!-- Name -->
                    <div class="form-group">
                      <label class="visually-hidden" for="reviewText">Review:</label>
                      <textarea class="form-control form-control-sm" id="reviewText" rows="5" placeholder="Review *" required></textarea>
                    </div>

                  </div>
                  <div class="col-12 text-center">

                    <!-- Button -->
                    <button class="btn btn-outline-dark" type="submit">
                      Post Review
                    </button>

                  </div>
                </div>
              </form>

            </div>

<!-- Reviews -->

<div class="row">
 	<c:forEach var="board" items="${sharing}">
	<div class="mt-8">

    <!-- Iterate over the reviews -->

        <!-- Review -->
        <div class="review">
            <div class="review-body">
                <div class="row">
                    <div class="col-12 col-md-auto">

                        <!-- Avatar -->
                        <div class="avatar avatar-xxl mb-6 mb-md-0">
                            <span class="avatar-title rounded-circle">
                                <i class="fa fa-user"></i>
                            </span>
                        </div>

                    </div>
                    <div class="col-12 col-md">

                        <!-- Header -->
                        <div class="row mb-6">
                            <div class="col-12">

                                <!-- Time -->
                                <span class="fs-xs text-muted">
                                   ${board.nick} ${board.reg_date}
                                </span>

                            </div>
                        </div>

                        <!-- Title -->
                        <p class="mb-2 fs-lg fw-bold">
                            ${board.title}
                        </p>

                        <!-- Text -->
                        <p class="text-gray-500">
                            <!-- Add your text here -->
                        </p>

                        <!-- Footer -->
                        <div class="row align-items-center">
                            <div class="col-auto d-none d-lg-block">

                                <!-- Text -->
                                <p class="mb-0 fs-sm">이 댓글이 마음에 드시나요?</p>

                            </div>
                            <div class="col-auto me-auto">

                                <!-- Rate -->
                                <div class="rate">
                                    <a class="rate-item" data-toggle="vote" data-count="3" href="#" role="button">
                                        <i class="fe fe-thumbs-up"></i>
                                    </a>
                                    <a class="rate-item" data-toggle="vote" data-count="0" href="#" role="button">
                                        <i class="fe fe-thumbs-down"></i>
                                    </a>
                                </div>

                            </div>
                            <div class="col-auto d-none d-lg-block">

                                <!-- Text -->
                                <p class="mb-0 fs-sm">Comments (0)</p>

                            </div>
                            <div class="col-auto">

                                <!-- Button -->
                                <a class="btn btn-xs btn-outline-border" href="#!">
                                    Comment
                                </a>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


</div>
</c:forEach>
</div>
         </div>

                   

    
</section>

</body>
<%@ include file="commentSharing.jsp" %>
<%@ include file="../footer.jsp" %>
</html>
