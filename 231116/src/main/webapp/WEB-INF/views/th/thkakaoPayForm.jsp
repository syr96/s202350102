<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>카카오페이 API 이용하기</h1>
<form method="post" action="/thKakaoPay">
    <button>카카오페이로 결제하기</button>
</form>
 
    <!-- MODALS -->
<!--     {{> partials/modals}} -->

    <!-- NAVBAR -->
<!--     {{> navbars/navbar-topbar classList="bg-light"}} -->

    <!-- NAVBAR -->
<!--     {{> navbars/navbar classList="bg-white border-bottom"}} -->

    <!-- PROMO -->
    {{> misc/promo}}

    <!-- BREADCRUMB (Home > Women's Clothing 부분 -->
<!--     <nav class="my-5"> -->
<!--       <div class="container"> -->
<!--         <div class="row"> -->
<!--           <div class="col-12"> -->

<!--             Breadcrumb -->
<!--             <ol class="breadcrumb mb-0 fs-xs text-gray-400"> -->
<!--               <li class="breadcrumb-item"> -->
<!--                 <a class="text-reset" href="#">Home</a> -->
<!--               </li> -->
<!--               <li class="breadcrumb-item active"> -->
<!--                 Women's Clothing -->
<!--               </li> -->
<!--             </ol> -->

<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </nav> -->

    <!-- HEADER -->
    <div class="pt-7">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Heading -->
            <h3 class="mb-13 text-center">구독하기</h3>

            <!-- Slider -->
            <div class="row justify-content-center">

              <!-- Item -->
              <div class="col px-4" style="max-width: 200px;">
                <div class="card">

                  <!-- Image -->
                  <img class="card-img-top" src="images/th/participantUp.jpg" alt="participantUp.jpg">

                  <!-- Body -->
                  <div class="card-body py-4 px-0 text-center">

                    <!-- Heading -->
                    <a class="stretched-link text-body" href="#!">
                      <h6>참여자수 증가 <small>(58)</small></h6>
                    </a>

                  </div>

                </div>
              </div>


              <!-- Item -->
              <div class="col px-4" style="max-width: 200px;">
                <div class="card">

                  <!-- Image -->
                  <img class="card-img-top" src="assets/img/products/product-27.jpg" alt="...">

                  <!-- Body -->
                  <div class="card-body py-4 px-0 text-center">

                    <!-- Heading -->
                    <a class="stretched-link text-body" href="#!">
                      <h6>T-shirts <small>(27)</small></h6>
                    </a>

                  </div>

                </div>
              </div>



              <!-- Item -->
              <div class="col px-4" style="max-width: 200px;">
                <div class="card">

                  <!-- Image -->
                  <img class="card-img-top" src="assets/img/products/product-29.jpg" alt="...">

                  <!-- Body -->
                  <div class="card-body py-4 px-0 text-center">

                    <!-- Heading -->
                    <a class="stretched-link text-body" href="#!">
                      <h6>Jeans <small>(12)</small></h6>
                    </a>

                  </div>

                </div>
              </div>

              <!-- Item -->
              <div class="col px-4" style="max-width: 200px;">
                <div class="card">

                  <!-- Image -->
                  <img class="card-img-top" src="assets/img/products/product-14.jpg" alt="...">

                  <!-- Body -->
                  <div class="card-body py-4 px-0 text-center">

                    <!-- Heading -->
                    <a class="stretched-link text-body" href="#!">
                      <h6>Misc <small>(19)</small></h6>
                    </a>

                  </div>

                </div>
              </div>

            </div>

          </div>
        </div>
      </div>
    </div>

    <!-- CONTENT -->
    <section class="py-12">
      <div class="container">
        <div class="row">
          <div class="col-12">

         

          </div>
        </div>
        
        <div class="row">
          <div class="col-12">

            <!-- Progress -->
            <div class="row justify-content-center mt-7">
              <div class="col-12 text-center">

                <!-- Caption -->
                <p class="fs-sm text-muted">
                  	프리미엄 유저를 위해, 특별한 기능을 제공 합니다<br>
                  	구독료&nbsp;:&nbsp;￦5,900
                </p>

                <!-- Progress -->
                <div class="progress mx-auto mb-7" style="max-width: 250px;">
                  <div class="progress-bar bg-dark" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                </div>

                <!-- Button -->
                <a class="btn btn-sm btn-outline-dark" href="#!">
                  Load more
                </a>

              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

    <!-- FOOTER -->
<!--     {{> footers/footer}} -->

    <!-- JAVASCRIPT -->
<!--     {{> partials/scripts}} -->
 
</body>
</html>