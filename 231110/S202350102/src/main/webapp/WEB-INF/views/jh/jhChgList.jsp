<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header4.jsp" %>
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
<h1>챌린지 목록</h1>
<a href="/chgDetail">jh 챌린지 상세</a><p>
    <section class="py-11">
      <div class="container">
        <div class="row">
        
        
        
          <div class="col-12 col-md-4 col-lg-3">

            <!-- Filters -->
            <form class="mb-10 mb-md-0">
              <ul class="nav nav-vertical" id="filterNav">
                <li class="nav-item">

                  <!-- Toggle -->
                  <a class="nav-link dropdown-toggle fs-lg text-reset border-bottom mb-6" data-bs-toggle="collapse" href="#ingChallenge">
                    	진행중 챌린지
                  </a>

                  <!-- Collapse -->
                  <div class="collapse" id="ingChallenge">
                    <div class="form-group">
                      <ul class="list-styled mb-0" id="chgCtNav">
                        <li class="list-styled-item">
                          <a class="list-styled-link" href="#">
                            	카테고리들 데이터 가져오기
                          </a>
                        </li>
                      </ul>
                    </div>
    			  </div>
    			  
    			</li>
    
    
    
     			<li class="nav-item">

                  <!-- Toggle -->
                  <a class="nav-link dropdown-toggle fs-lg text-reset border-bottom mb-6" data-bs-toggle="collapse" href="#endChallenge">
                    	종료된 챌린지
                  </a>

                  <!-- Collapse -->
                  <div class="collapse" id="endChallenge">
                    <div class="form-group">
                      <ul class="list-styled mb-0" id="productsNav">
                        <li class="list-styled-item">
                          <a class="list-styled-link" href="#">
                            	카테고리들 데이터 가져오기
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>

                </li>
                
              </ul>
            </form>
          </div>
         
		  <div class="col-12 col-md-8 col-lg-9">
			<!-- Header -->
            <div class="row align-items-center mb-7">
              <div class="col-12 col-md">

                <!-- Heading -->
                <h3 class="mb-1">카테고리명 챌린지</h3>

              </div>
              <div class="col-12 col-md-auto">

                <!-- Select -->
                <select class="form-select form-select-xs">
                  <option selected>최신 개설순</option>
                  <!-- 종료 챌린지는 최신 종료순? -->
                  <option selected>찜순</option>
                  <option selected>참여자순</option>
                </select>

              </div>
            </div>  
            
            <div class="col-6 col-md-4">

               <!-- Card -->
              <div class="card mb-7">

                <!-- Image -->
                <div class="card-img">

                  <!-- Action -->
                  <button class="btn btn-xs btn-circle btn-white-primary card-action card-action-end" data-toggle="button">
                  <i class="fe fe-heart"></i>
                  </button>

                  <!-- Button -->
                  <button class="btn btn-xs w-100 btn-dark card-btn">
                    <i class="fe me-2 mb-1"></i>챌린지에 도전하세요!
                  </button>

                  <!-- Image -->
                  <img class="card-img-top" src="assets/img/products/product-6.jpg" alt="...">

              </div>

              <!-- Body -->
              <div class="card-body fw-bold text-center">
                <a class="text-body" href="#!">챌린지명</a>
                <div class="text-muted">참여기간</div>
              </div>

            </div>
		  </div>

      </div>
    </div>
  </div>
</section>
</body>
</html>