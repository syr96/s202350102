<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %> 
  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="./assets/css/libs.bundle.css" />
    <link rel="stylesheet" href="./assets/css/theme.bundle.css" />
</head>
<body>
 <div class="container">
         <div class="row profile">
            <div class="col-md-3">
                <%@ include file="../mypageMenu.jsp" %>
            </div>
             <div class="col-md-9 profile-form">
           <!-- Heading -->
                 <h5 class="mb-4">회원정보 수정</h5>

                <!-- Form -->
                <form action="/writeUser1" method="post" name="frm" style=" height: 800px;">
                  <div class="row">
                    
                     <!-- 아이디 -->
                    <div class="col-12 col-md-8">
                      <div class="form-group">
                     	<div class="form-floating mb-3">
	                        <input class="form-control form-control-sm" type="text" id="user_id" name="user_id" placeholder="아이디 *" onchange="checkId()">
	                        <label for="floatingInput">아이디(5~15자 이내)</label>
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
                        <div class="form-floating mb-3">																									
                        	<input class="form-control form-control-sm" type="password" id="user_pswd" name="user_pswd" placeholder="비밀번호 *" onchange="checkPwd()">
                        	<label for="floatingInput">비밀번호 8자 이상 영문,숫자,특수기호 조합</label>
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
	                        <font color ="green" id = "matchPwd" 		style = "display:none" size="2 rem">비밀번호가 일치합니다 </font>
	                        <font color ="red"   id = "notMatchPwd" 	style = "display:none" size="2 rem">비밀번호가 일치하지 않습니다 </font>
	                        <font color ="red"   id = "failConfirmpwd" 	style = "display:none" size="2 rem">8자 이상 영문,숫자,특수기호를 조합해 입력해주세요 </font>
                        </div>
                      </div>
                    </div>
                    
                    <!-- 닉네임  -->    
                    <div class="col-12 col-md-8">
                      <div class="form-group">
                      	<div class="form-floating mb-3">
                        	<input class="form-control form-control-sm" type="text" id="nick" name="nick" placeholder="닉네임  *" onchange="checkNick()">
                        	<label for="floatingInput">닉네임(2~12자 이내)</label>
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
                        	<label for="floatingInput">이름(2~6자 이내)</label>
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
                        	<label for="floatingInput">이메일 you@xxx.xxx</label>
                        	<font color ="red" id = "failemail" style = "display:none" size="2 rem">you@example.com 형태로 입력해주세요 </font>
                        </div>
                      </div>

                    </div>

                    
                   
                    <!-- 생년월일  년-->
                    <div class="col-5">
                      <div class="form-group">
                      	<select class="form-select" id="birth_year" name="birth_year" class="form-control">
						  <option value="">생년월일(년)</option>
						  <c:forEach var="i" begin="1950" end="2023">
						    <option value="${i}">${i}</option>
						  </c:forEach>
						</select>
                      </div>
                    </div>
                    
                    <!-- 생년월일  월--> 
                    <div class="col-3">
                      <div class="form-group">
                      	<select class="form-select" id="birth_month" name="birth_month" class="form-control">
						  <option value="">월</option>
						  <c:forEach var="i" begin="1" end="12">
						  <c:choose>
						      <c:when test="${i lt 10 }">		<!-- lt = < 의미 -->
						          <option value="0${i}">0${i}</option>
						      </c:when>
						      <c:otherwise>
						          <option value="${i}">${i}</option>
						      </c:otherwise>
						  </c:choose>
						  </c:forEach>
						</select>
                      </div>
                    </div>
                     
                     <!-- 생년월일  일-->
                     <div class="col-3">
                      <div class="form-group">
                      		<select class="form-select" id="birth_date" name="birth_date" class="form-control">
							  <option value="">일</option>
							  <c:forEach var="i" begin="1" end="31">
							  <c:choose>
							      <c:when test="${i < 10 }">
							          <option value="0${i}">0${i}</option>
							      </c:when>
							      <c:otherwise>
							          <option value="${i}">${i}</option>
							      </c:otherwise>
							  </c:choose>
							  </c:forEach>
							</select>
                      </div>
                    </div>
                  
                    
                    <!-- 주소  -->
                    <!-- 우편번호  -->
                    <div class="col-6">
                      <div class="form-group">
                       	<div class="form-floating mb-3">
                        	<input class="form-control form-control-sm" type="text" id="sample6_postcode" name="zipCode" placeholder="우편번호">
                        	<label for="floatingInput">우편번호</label>
                        </div>
                      </div>
                   </div>
                    
                    <!-- 주소 우편번호 찾기(버튼) -->
                    <div class="col-6">
                      <div class="form-group">
                       	<div class="form-floating mb-3">
                        	<button class="btn btn-sm btn-dark" type="button" onclick="sample6_execDaumPostcode()"> 우편번호 찾기<br></button>
                        </div>
                      </div>	
                    </div>
                    
                    <!-- 사용자 입력 주소 -->
                    <div class="col-12">
                      <div class="form-group">
                       	<div class="form-floating mb-3">
                        	<input class="form-control form-control-sm" type="text" id="sample6_address" name="addr" placeholder="주소">
                        	<label for="floatingInput">주소</label>
                        </div>
                      </div>
                   </div>
                   
                    <!-- 상세 주소 -->
                    <div class="col-12">
                      <div class="form-group">
                       	<div class="form-floating mb-3">
                        	<input class="form-control form-control-sm" type="text" id="sample6_detailAddress" name="addr_detail" placeholder="상세주소">
                        	<label for="floatingInput">상세주소</label>
                        </div>
                      </div>
                   </div>
					<!-- 다음 주소API에서 이거 안담으면 실행안되서 hidden으로 받아 놓음  -->
					<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">							        
							             
                    <!-- 휴대폰번호  -->
                    <div class="col-12">
                      <div class="form-group">
                       	<div class="form-floating mb-3">
                        	<input class="form-control form-control-sm" id="tel" type="tel" name="tel" placeholder="전화번호  *" onchange="checkTel()">
                        	<label for="floatingInput">휴대폰번호 010-XXXX-XXXX</label>
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
					  <button class="btn btn-sm btn-dark" type="reset" onclick="resetAll()">
                        	다시 입력
                      </button>
                    </div>
                  </div>
                </form>
        </div>
</div>
</div>



</body>
<%@ include file="../footer.jsp" %>
</html>
