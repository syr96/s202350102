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
    
    <!-- Title -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/thSignUp.js"></script>
 </head>
  <body class="bg-light">
  	<c:import url="/WEB-INF/views/header4.jsp"/>

    <!-- MODALS -->
<!--     {{> partials/modals}} -->

    <!-- NAVBAR -->
<!--     {{> navbars/navbar-topbar classList="bg-light"}} -->

    <!-- NAVBAR -->
<!--     {{> navbars/navbar classList="bg-white"}} -->

    <!-- CONTENT -->
    <section class="py-12">
      <div class="container">
        <div class="row">
          <div class="col-7" style="float: none; margin:0 auto;">

            <!-- Card -->
            <div class="card card-lg">
              <div class="card-body">

                <!-- Heading -->
                <h6 class="mb-7"><b>회원 가입</b></h6>

                <!-- Form -->
                <form action="/writeUser1" method="post" name="frm">
                  <div class="row">
                    
                     <!-- 아이디 -->
                    <div class="col-12 col-md-8">
                      <div class="form-group">
                     	<div class="form-floating mb-3">
	                        <input class="form-control form-control-sm" type="text" id="user_id" name="user_id" placeholder="아이디 *" onchange="checkId()">
	                        <label for="floatingInput">아이디</label>
	                        <font color = "red" id= "failId" 	  style = "display:none" size="2 rem"> 5~15자 이내로 영문자와 숫자를 조합해 입력해주세요.</font>
                        	<font color = "red" id= "failDupId"   style = "display:none" size="2 rem"> 이미 존재하는 ID입니다.</font>
                        </div>
                      </div>
                    </div>
                    
<!--                     <div class="col-12 col-md-4"> -->
<!-- 	                    <button class="btn btn-sm btn-dark" id="user1IdCheck" type="button" onclick="fn_user1IdCheck()" value="N"> -->
<!-- 	                        	중복확인 -->
<!-- 	                    </button> -->
<!--                     </div> -->
                        
                    

                      <!-- 비밀번호 -->
                    <div class="col-10"> 
                      <div class="form-group">
                        <div class="form-floating mb-3">																									<!--checkPwd2() 일단삭제 추후 만들어야함  -->
                        	<input class="form-control form-control-sm" type="password" id="user_pswd" name="user_pswd" placeholder="비밀번호 *" onchange="checkPwd()">
                        	<label for="floatingInput">비밀번호</label>
                        	<font color ="red" id = "failpwd" style = "display:none" size="2 rem">8자 이상 영문,숫자,특수기호를 조합해 입력해주세요 </font>
                        </div>	
                      </div>
                    </div>
                    
                    
                    <!-- 비밀번호 확인 -->
                    <div class="col-10">
                      <div class="form-group">
                      	<div class="form-floating mb-3">
                        <input class="form-control form-control-sm" id="user_confirmPswd" type="password" name="user_confirmPswd" placeholder="비밀번호  확인 *" onchange="checkConfirmPswd()">
                        <label for="floatingInput">비밀번호 확인</label>
                        <font color ="green" id = "matchPwd" 	style = "display:none" size="2 rem">비밀번호가 일치합니다 </font>
                        <font color ="red"   id = "notMatchPwd" style = "display:none" size="2 rem">비밀번호가 일치하지 않습니다 </font>
                        </div>
                      </div>

                    </div>
                    
                    <!-- 닉네임  -->    
                    <div class="col-12 col-md-8">
                      <div class="form-group">
                      	<div class="form-floating mb-3">
                        	<input class="form-control form-control-sm" type="text" id="nick" name="nick" placeholder="닉네임  *" onchange="checkNick()">
                        	<label for="floatingInput">닉네임</label>
                        	 <font color = "red" id= "failNick"		 style = "display:none" size="2 rem"> 2~12자 이내로 영문자와 숫자를 조합해 입력해주세요.</font>
                        	 <font color = "red" id= "failDupNick"   style = "display:none" size="2 rem"> 이미 존재하는 닉네임입니다.</font>
                        </div>
                      </div>
                    </div>
                    
<!--                     <div class="col-12 col-md-6"> -->
<!-- 	                    <button class="btn btn-sm btn-dark" type="button" onclick="nickCheck()" value="N"> -->
<!-- 	                        	중복확인 -->
<!-- 	                    </button> -->
<!--                     </div> -->
                    
                    <!-- 이름 -->
                     <div class="col-12 col-md-6">
                      <div class="form-group">
                     	 <div class="form-floating mb-3">
                        	<input class="form-control form-control-sm" type="text" id="user_name" name="user_name" placeholder="이름  *" onchange="checkName()">
                        	<label for="floatingInput">이름</label>
                         </div>
                      </div>
                    </div>
                    
					<!-- 성별 -->
					 <div class="col-12 col-md-2">
                      <div class="form-group">
                        <div class="form-check">
                          <input class="form-check-input" id="registerGenderMale" type="radio" name="gender" value="M">
                          <label class="form-check-label" for="registerGenderMale">
                            	남자     
                          </label>
                        </div>
                      </div>
                    </div>
                    
                    <div class="col-12 col-md-2">
                      <div class="form-group">
                        <div class="form-check">
                           <input class="form-check-input" id="registerGenderFemale" type="radio" name="gender" value="F">
                          <label class="form-check-label" for="registerGenderFemale">
                            	여자
                          </label>
                        </div>
                      </div>
                    </div>
                
                       
                    <!-- 이메일 -->
					<div class="col-12">
                      <div class="form-group">
                      	<div class="form-floating mb-3">
                        	<input class="form-control form-control-sm" type="text" id="email" name="email" placeholder="you@example.com" onchange="checkEmail()">
                        	<label for="floatingInput">이메일</label>
                        	<font color ="red" id = "failemail" style = "display:none" size="2 rem">you@example.com 형태로 입력해주세요 </font>
                        </div>
                      </div>

                    </div>
                
                    
                   
                    <!-- 생년월일  -->
                    <div class="col-12">
                      <div class="form-group">
                      	<div class="form-floating mb-3">
                        	<input class="form-control form-control-sm" id="birth" type="text" name="birth" placeholder="생년월일  *" >
                        	<label for="floatingInput">생년월일</label>
                        </div>
                      </div>
                    </div>
                    
                    <!-- 주소 -->
                    <div class="col-12">
                      <div class="form-group">
                       	<div class="form-floating mb-3">
                        	<input class="form-control form-control-sm" id="addr" type="text" name="addr" placeholder="주소  *" >
                        	<label for="floatingInput">주소</label>
                        </div>
                      </div>

                    </div>
                    
                    <!-- 휴대폰번호  -->
                    <div class="col-12">
                      <div class="form-group">
                       	<div class="form-floating mb-3">
                        	<input class="form-control form-control-sm" id="tel" type="tel" name="tel" placeholder="전화번호  *" onchange="checkTel()">
                        	<label for="floatingInput">휴대폰번호</label>
                        	<font color ="red" id = "failtel" style = "display:none" size="2 rem">010-XXXX-XXXX 형태로 입력해주세요 </font>
                        </div>
                      </div>
                    </div>
                    
               
                    <div class="col-12 col-md-auto">

                      <!-- Link -->
                      <div class="form-group fs-sm text-muted">
                        By registering your details, you agree with our Terms & Conditions,
                        and Privacy and Cookie Policy.
                      </div>

                    </div>
                    <div class="col-12 col-md">

                      <!-- Newsletter -->
                      <div class="form-group">
                        <div class="form-check">
                          <input class="form-check-input" id="registerNewsletter" type="checkbox">
                          <label class="form-check-label" for="registerNewsletter">
                            Sign me up for the Newsletter!
                          </label>
                        </div>
                      </div>

                    </div>
                    <div class="col-12">

                      <!-- Button -->
                      <button class="btn btn-sm btn-dark" type="submit" id="signupbtn" onclick="return checkSignupbtn()">
                        	회원가입
                      </button>
					  <button class="btn btn-sm btn-dark" type="reset">
                        	다시 입력
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
