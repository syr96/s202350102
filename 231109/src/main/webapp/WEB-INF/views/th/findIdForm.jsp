<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    
    <!-- ICON -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
   
    <!-- Title -->
    <title>Ssj</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/th/findId.js"></script>
</head>
<body class="bg-light">
    <!-- NAVBAR -->
	<c:import url="/WEB-INF/views/header4.jsp"/>

    <!-- NAVBAR -->
<!--     {{> navbars/navbar classList="bg-white"}} -->
 	
     <!-- CONTENT -->
    <section class="py-12">
      <div class="container">
        <div class="row">
          <div class="col-12 col-md-6" style="float: none; margin:0 auto;">

            <!-- Card -->
            <div class="card card-lg mb-10 mb-md-0">
              <div class="card-body">

                <!-- Heading -->
                <ul class="list-unstyled flex-row">
	                <li><i class="bi bi-file-lock2" style="font-size: 1.7rem; color: cornflowerblue;"></i><b>아이디 찾기</b></li>
										
                </ul>
                

                <!-- Form -->
<!--                 <form action="/findIdForm" method="post"> -->
                  <div class="row">
                    
                    <div class="col-12">
                      <!-- Email -->
                      <div class="form-group">
                        <label class="visually-hidden" for="user_name">
                         	이름 *
                        </label>
                        <input class="form-control form-control-sm" id="user_name" type="text"  name="user_name"  placeholder="이름  *" required>
                      </div>
                    </div>
                   
					<div class="col-12">
                      <!-- Password -->
                      <div class="form-group">
                        <label class="visually-hidden" for="email">
                          	이메일 *
                        </label>
                        <input class="form-control form-control-sm" id="email" type="email" name="email" placeholder="이메일 *" required>
                      </div>
                    </div>
                   
                    <div class="col-12 col-md">
                      <!-- Remember -->
                      <div class="form-group">
                        <div class="form-check">
                          <input class="form-check-input" id="loginRemember" type="checkbox">
                          <label class="form-check-label" for="loginRemember">
                            Remember me
                          </label>
                        </div>
                      </div>
                    </div>
                    
                   <!-- Link -->
                    <div class="col-12 col-md-auto">
                      <div class="form-group">
                      	<a class="fs-sm text-reset" href="/signUp">회원가입 </a>
                      	<small class="fs-sm text-reset"> | </small>
                        <a class="fs-sm text-reset" href="/loginForm">로그인 </a>
                        <small class="fs-sm text-reset"> | </small>
                        <a class="fs-sm text-reset" href="/user1ResetPswd">비밀번호 찾기 </a>
                      </div>
                    </div>
                    
                    <div class="col-12">
                      <!-- Button -->
                      <button class="btn btn-sm btn-dark" onclick="return findId_click()">
                        	아이디찾기
                      </button>				  
                    </div>
                 
                  </div>
<!--                 </form> -->

              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

    <!-- FOOTER -->
    <c:import url="/WEB-INF/views/footer.jsp"/>


    <!-- JAVASCRIPT -->
    {{> partials/scripts}}

</body>

</html>