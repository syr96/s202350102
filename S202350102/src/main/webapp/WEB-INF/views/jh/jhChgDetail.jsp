<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header4.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="./assets/favicon/favicon.ico" type="image/x-icon" />
    
    <!-- Libs CSS -->
    <link rel="stylesheet" href="./assets/css/libs.bundle.css" />
    
    <!-- Theme CSS -->
    <link rel="stylesheet" href="./assets/css/theme.bundle.css" />
<style>
    .list-group-horizontal-sm .list-group-item {
        border: none; /* 테두리 없애기 */
    }
</style>
<title>Insert title here</title>
</head>
<body>

    <!-- BREADCRUMB -->
    <nav class="py-5">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Breadcrumb -->
            <ol class="breadcrumb mb-0 fs-xs text-gray-400">
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="index.html">챌린지</a>
              </li>
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="shop.html">${chg.ctn }</a>
              </li>
              <li class="breadcrumb-item active">${chg.title }
                	
              </li>
            </ol>

          </div>
        </div>
      </div>
    </nav>

<!-- PRODUCT -->
    <section>
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="row">
              <div class="col-12 col-md-6">

                <!-- Card -->
                <div class="card">

                  <!-- Badge -->
                  <div class="badge bg-primary card-badge text-uppercase">
                                    인기
                                    <!-- 찜수  -->
                  </div>

                  <!-- Slider -->
                  <div class="mb-4" data-flickity='{"draggable": false, "fade": true}' id="productSlider">






                    <!-- Item -->
                      <img src="assets/img/chgDfaultImg.png" alt="${chg.title }" class="card-img-top" onerror="assets/img/chgDfaultImg.png">
             <!--썸네일 처리 해야 함 파일 위치랑 null일 때 뜨게 할 것  -->





                  </div>

                </div>


              </div>
              <div class="col-12 col-md-6 ps-lg-10">

                <!-- Heading -->
                <h3 class="mb-2">${chg.title }</h3>
                
                
                <div class="col-12 col-md-6">

                
              	<ul class="list-group list-group-horizontal-sm">
			  	  <li class="list-group-item">개설자</li>
			  	  <li class="list-group-item">${chg.nick }</li>
				</ul>
				<ul class="list-group list-group-horizontal-sm">
			  	  <li class="list-group-item">참여 인원</li>
			 	  <li class="list-group-item">${chg.now_parti } / ${chg.chg_capacity }</li>
				</ul>
				<ul class="list-group list-group-horizontal-sm">
				  <li class="list-group-item">진행 기간</li>
				  <li class="list-group-item"><fmt:formatDate value="${chg.start_date }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${chg.end_date }" pattern="yyyy-MM-dd"/> </li>
				</ul>
				<ul class="list-group list-group-horizontal-sm">
				  <li class="list-group-item">진행 상태</li>
				  <li class="list-group-item">${chg.stateCtn }</li>
				</ul>
				<ul class="list-group list-group-horizontal-sm">
				  <li class="list-group-item">인증 빈도</li>
				  <li class="list-group-item">${chg.freq }</li>
				</ul>
				<ul class="list-group list-group-horizontal-sm">
				  <li class="list-group-item">챌린지 찜</li>
				  <li class="list-group-item">${chg.pick_cnt }</li>
				</ul> 
               
               
                  <div class="form-group">

                    <div class="row gx-5 mb-7">
                     
                      <div class="col-12 col-lg">

                        <!-- Submit -->
                        <button type="submit" class="btn w-100 btn-dark mb-2">
                          	참여하기 
                        </button>

                      </div>
                      <div class="col-12 col-lg-auto">

                        <!-- Wishlist -->
                        <button class="btn btn-outline-dark w-100 mb-2" data-toggle="button">
                          	챌린지 찜 <i class="fe fe-heart ms-2"></i>
                        </button>

                      </div>
                    </div>


                    <!-- Share -->
                    <p class="mb-0">
                      <span class="me-4">Share:</span>
                      <a class="btn btn-xxs btn-circle btn-light fs-xxxs text-gray-350" href="#!">
                        <i class="fab fa-twitter"></i>
                      </a>
                      <a class="btn btn-xxs btn-circle btn-light fs-xxxs text-gray-350" href="#!">
                        <i class="fab fa-facebook-f"></i>
                      </a>
                      <a class="btn btn-xxs btn-circle btn-light fs-xxxs text-gray-350" href="#!">
                        <i class="fab fa-pinterest-p"></i>
                      </a>
                    </p>

                  </div>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>



 <!-- DESCRIPTION -->
    <section class="pt-11">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Nav -->
            <div class="nav nav-tabs nav-overflow justify-content-start justify-content-md-center border-bottom">
              <a class="nav-link active" data-bs-toggle="tab" href="#descriptionTab">
               	 챌린지 소개
              </a>
              <a class="nav-link" data-bs-toggle="tab" href="#sizeTab">
                             인증 게시판
              </a>
              <a class="nav-link" data-bs-toggle="tab" href="#shippingTab">
                             소세지들
              </a>
              <a class="nav-link" data-bs-toggle="tab" href="#shippingTab">
                             후기 게시판
              </a>
            </div>

            <!-- Content -->
            <div class="tab-content">
              <div class="tab-pane fade show active" id="descriptionTab">
                <div class="row justify-content-center py-9">
                  <div class="col-12 col-lg-10 col-xl-8">
                    <div class="row">
                      <div class="col-12">

                        <!-- Text -->
                        <p class="text-gray-500">
                        	${user.nick} <p>
							${chg.chg_conts }<p>
							인증방법 : ${chg.upload }<p>
							<img alt="인증예시" src="${sample_img }">
                        </p>

                      </div>
                      
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="sizeTab">
                <div class="row justify-content-center py-9">
                  <div class="col-12 col-lg-10 col-xl-8">
                    <div class="row">
                      <div class="col-12 col-md-6">

                        <!-- Text -->
                        <p class="mb-4">
                          <strong>Fitting information:</strong>
                        </p>

                        <!-- List -->
                        <ul class="mb-md-0 text-gray-500">
                          <li>
                            Upon seas hath every years have whose
                            subdue creeping they're it were.
                          </li>
                          <li>
                            Make great day bearing.
                          </li>
                          <li>
                            For the moveth is days don't said days.
                          </li>
                        </ul>

                      </div>
                      <div class="col-12 col-md-6">

                        <!-- Text -->
                        <p class="mb-4">
                          <strong>Model measurements:</strong>
                        </p>

                        <!-- List -->
                        <ul class="list-unstyled text-gray-500">
                          <li>Height: 1.80 m</li>
                          <li>Bust/Chest: 89 cm</li>
                          <li>Hips: 91 cm</li>
                          <li>Waist: 65 cm</li>
                          <li>Model size: M</li>
                        </ul>

                        <!-- Size -->
                        <p class="mb-0">
                          <img src="assets/img/icons/icon-ruler.svg" alt="..." class="img-fluid">
                          <a class="text-reset text-decoration-underline ms-3" data-bs-toggle="modal" href="#modalSizeChart">Size chart</a>
                        </p>

                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="shippingTab">
                <div class="row justify-content-center py-9">
                  <div class="col-12 col-lg-10 col-xl-8">

                    <!-- Table -->
                    <div class="table-responsive">
                      <table class="table table-bordered table-sm table-hover">
                        <thead>
                          <tr>
                            <th>Shipping Options</th>
                            <th>Delivery Time</th>
                            <th>Price</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>Standard Shipping</td>
                            <td>Delivery in 5 - 7 working days</td>
                            <td>$8.00</td>
                          </tr>
                          <tr>
                            <td>Express Shipping</td>
                            <td>Delivery in 3 - 5 working days</td>
                            <td>$12.00</td>
                          </tr>
                          <tr>
                            <td>1 - 2 day Shipping</td>
                            <td>Delivery in 1 - 2 working days</td>
                            <td>$12.00</td>
                          </tr>
                          <tr>
                            <td>Free Shipping</td>
                            <td>
                              Living won't the He one every subdue meat replenish
                              face was you morning firmament darkness.
                            </td>
                            <td>$0.00</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>

                    <!-- Caption -->
                    <p class="mb-0 text-gray-500">
                      May, life blessed night so creature likeness their, for. <a class="text-body text-decoration-underline" href="#!">Find out more</a>
                    </p>

                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>








</body>
</html>