<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <a class="text-gray-400" href="shop.html">카테고리</a>
              </li>
              <li class="breadcrumb-item active">
                	챌린지명
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






<!-- src="${thumb || img/chgDfaultImg.png}"로 교체 예정  -->
                    <!-- Item -->
                      <img src="img/chgDfaultImg.png" alt="챌린지 이미지" class="card-img-top" onerror="img/chgDfaultImg.png">

<div class="avatar avatar-xxl">
	<img alt="챌린지 이미지" src="img/chgDfaultImg.png" onerror="img/chgDfaultImg.png" class="avatar-img rounded">
<%-- <img alt="챌린지 이미지" src="${thumb || img/chgDfaultImg.png}" onerror="img/chgDfaultImg.png"> --%>
	<span>${title}</span>
</div>                    





                  </div>

                </div>


              </div>
              <div class="col-12 col-md-6 ps-lg-10">

                <!-- Header -->
                <div class="row mb-1">
                  <div class="col">

                    <!-- Preheading -->
                    <a class="text-muted" href="shop.html">Sneakers</a>

                  </div>
                  <div class="col-auto">

                    <!-- Rating -->
                    <div class="rating fs-xs text-dark" data-value="4">
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

                    <a class="fs-sm text-reset ms-2" href="#reviews">
                      Reviews (6)
                    </a>

                  </div>
                </div>

                <!-- Heading -->
                <h3 class="mb-2">Leather Sneakers</h3>

                <!-- Price -->
                <div class="mb-7">
                  <span class="fs-lg fw-bold text-gray-350 text-decoration-line-through">$115.00</span>
                  <span class="ms-1 fs-5 fw-bolder text-primary">$85.00</span>
                  <span class="fs-sm ms-1">(In Stock)</span>
                </div>

                <!-- Form -->
                <form>
                  <div class="form-group">

                    <!-- Label -->
                    <p class="mb-5">
                      Color: <strong id="colorCaption">White</strong>
                    </p>

                  </div>
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
                          Wishlist <i class="fe fe-heart ms-2"></i>
                        </button>

                      </div>
                    </div>

                    <!-- Text -->
                    <p>
                      <span class="text-gray-500">Is your size/color sold out?</span>
                      <a class="text-reset text-decoration-underline" data-bs-toggle="modal" href="#modalWaitList">Join the Wait List!</a>
                    </p>

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









</body>
</html>