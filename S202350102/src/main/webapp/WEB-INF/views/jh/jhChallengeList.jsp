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
<div class="container">
  <div class="row">
    <div class="col-12">

      <!-- Filters -->
      <div class="btn-group-justified btn-group-expand-lg mb-10" role="group">
        <div class="btn-group dropdown">

          <!-- Toggle -->
          <button class="btn btn-sm w-100 btn-outline-border dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" data-bs-auto-close="outside">
            Sort by
          </button>

          <!-- Menu -->
          <form class="dropdown-menu">
            <div class="card">
              <div class="card-body">

                <!-- Form group -->
                <div class="form-group-overflow">
                  <div class="form-check form-check-text mb-3">
                    <input class="form-check-input" id="sortOne" name="sort" type="radio" value="Default">
                    <label class="form-check-label" for="sortOne">Default</label>
                  </div>
                  <div class="form-check form-check-text mb-3">
                    <input class="form-check-input" id="sortTwo" name="sort" type="radio" value="Newest">
                    <label class="form-check-label" for="sortTwo">Newest</label>
                  </div>
                  <div class="form-check form-check-text mb-3">
                    <input class="form-check-input" id="sortThree" name="sort" type="radio" value="Most Popular">
                    <label class="form-check-label" for="sortThree">Most Popular</label>
                  </div>
                  <div class="form-check form-check-text mb-3">
                    <input class="form-check-input" id="sortFour" name="sort" type="radio" value="Default Price">
                    <label class="form-check-label" for="sortFour">Default Price</label>
                  </div>
                  <div class="form-check form-check-text">
                    <input class="form-check-input" id="sortFive" name="sort" type="radio" value="Highest Price">
                    <label class="form-check-label" for="sortFive">Highest Price</label>
                  </div>
                </div>

              </div>
            </div>
          </form>

      </div>
    </div>
  </div>
</div>
              
 <div class="row">
          <div class="col-12 col-md-4 col-lg-3">

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
                <a class="text-body" href="#!">Cotton floral print Dress</a>
                <div class="text-muted">$40.00</div>
              </div>

            </div>

          </div>
</div>
</body>
</html>