<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="./assets/favicon/favicon.ico" type="image/x-icon" />
    
    <!-- Libs CSS -->
    <link rel="stylesheet" href="./assets/css/libs.bundle.css" />
    
    <!-- Theme CSS -->
    <link rel="stylesheet" href="./assets/css/theme.bundle.css" />
    
</head>
<script type="text/javascript">
	function chk(){
		if(!frm.user_pswd.value){
			alert('비밀번호를 입력해 주세요')
			frm.user_pswd.focus()
			return false;
		}
		return true;
	}
</script>
<body>
<c:import url="/WEB-INF/views/header4.jsp"/>
<!-- CONTENT -->
    <section class="py-12">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-md-10 col-lg-8 col-xl-6 text-center">

            <!-- Icon -->
            <div class="mb-7 fs-1">❤️</div>

            <!-- Heading -->
            <h2 class="mb-5">회원탈퇴를 하시겠습니까?? </h2>

            <!-- Text -->
            <p class="mb-7 text-gray-500">
              	회원 탈퇴는 영구적이며 되돌릴 수 없습니다.<br> 
              	탈퇴하는 즉시 귀하의 계정에 액세스 할 수 없게 됩니다.<br>
              	탈퇴를 원하시면, 비밀번호를 입력해 주세요 
            </p>
			<form action="deleteUser1" method="post" onsubmit="return chk()" name="frm">
				   
				   <div class="row">
				   
				    <div class="col-2"></div>
				    
				    <div class="col-5"> 
                      <div class="form-group">
                        <div class="form-floating mb-3">		
                        	<input type="hidden" name="user_num" value="${sessionScope.user_num }">																						
                        	<input class="form-control form-control-sm" type="password" id="user_pswd" name="user_pswd" placeholder="비밀번호 *">
                        	<label for="floatingInput">비밀번호</label> 	
                        </div>	
                      </div>
                    </div>
                    
                     <div class="col-3 g-0">
                      <div class="form-group">
                       	<div class="form-floating mb-3">
                    		<button class="btn btn-dark" name="delchk" type="submit">회원탈퇴</button>    	
                        </div>
                      </div>	
                    </div>
                    
                    <div class="col-2"></div>
                    
                  </div>
                    
			</form>
          </div>
        </div>
      </div>
    </section>

<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>