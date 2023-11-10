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
<c:set var="usernum" value="${sessionScope.user_num}" />
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
                                    <div class="ratio ratio-1x1 bg-cover mb-4" style="background-image: url(${board.img});"></div>
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
										    <a class="btn btn-dark w-100" href="/updateSharing1?brd_num=${board.brd_num}">
										        수정하기
										    </a>
										</div>

                                    <div class="col-lg-6 mb-2">
                                        <a class="btn btn-outline-dark w-100" href="/deleteSharing?brd_num=${board.brd_num}">
											    삭제하기
											</a>

                                           
                                    </div>
                                </div>
                                </div>
                               
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
                       

    
</section>

</body>
<%@ include file="../footer.jsp" %>
</html>
