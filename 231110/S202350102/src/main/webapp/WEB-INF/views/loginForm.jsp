<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">

</head>
<body class="bg-light">
	<!-- MODALS  -->
	 <!-- Password Reset -->
    <div class="modal fade" id="modalPasswordReset" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
    
          <!-- Close -->
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            <i class="fe fe-x" aria-hidden="true"></i>
          </button>
    
          <!-- Header-->
          <div class="modal-header lh-fixed fs-lg">
            <strong class="mx-auto">비밀번호 찾기</strong>
          </div>
    
          <!-- Body -->
          <div class="modal-body text-center">
    
            <!-- Text -->
            <p class="mb-7 fs-sm text-gray-500">
              	아이디와 이메일을 입력해주세요 <br>
              	해당 이메일로 새로운 비밀번호를 발급 받으실 수 있습니다
            </p>
    
            <!-- Form -->
            <form action="/sendMailForResetPswd">
    			
    		  <!-- 아이디 -->
              <div class="form-group">
                <label class="visually-hidden" for="modalPasswordResetEmail">
                  	아이디 *
                </label>
                <input class="form-control form-control-sm" id="modalPasswordResetEmail" name="user_id" type="text"  placeholder="아이디 " required>
              </div>
              		
              <!-- Email -->
              <div class="form-group">
                <label class="visually-hidden" for="modalPasswordResetEmail">
                  	이메일 *
                </label>
                <input class="form-control form-control-sm" id="modalPasswordResetEmail" name="email" type="email" placeholder="이메일 you@xxx.xxx" required>
              </div>
              
           
    
              <!-- Button type ="submit을" 안걸어도 알아서 연동됨 ;; 왜지?-->
              <button class="btn btn-sm btn-dark">
                	비밀번호 리셋
              </button>
    
            </form>
    
          </div>
    
        </div>
    
      </div>
    </div>
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
                <h6 class="mb-7">로그인</h6>

                <!-- Form -->
                <form action="login" method="post">
                  <div class="row">
                    
                    <div class="col-12">
                      <!-- Email -->
                      <div class="form-group">
                        <label class="visually-hidden" for="loginEmail">
                         ID *
                        </label>
                        <input class="form-control form-control-sm" id="loginEmail" type="text"  name="user_id"  placeholder="ID *" required>
                      </div>
                    </div>
                   
					<div class="col-12">
                      <!-- Password -->
                      <div class="form-group">
                        <label class="visually-hidden" for="loginPassword">
                          Password *
                        </label>
                        <input class="form-control form-control-sm" id="loginPassword" type="password" name="user_pswd" placeholder="Password *" required>
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
                        <a class="fs-sm text-reset" href="/findIdForm">아이디 찾기 </a>
                        <small class="fs-sm text-reset"> | </small>
                        <a class="fs-sm text-reset" data-bs-toggle="modal" href="#modalPasswordReset">비밀번호 찾기 </a>
                      </div>
                    </div>
                    
                    <div class="col-12">
                      <!-- Button -->
                      <button class="btn btn-sm btn-dark" type="submit">
                        	로그인
                      </button>				  
                    </div>
                  </div>
                </form>

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