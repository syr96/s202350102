<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 


    <nav class="navbar navbar-expand-lg navbar-light bg-white" id="nav">
      <div class="container">

        <!-- Brand -->
        <a class="navbar-brand" href="/"><img src="assets/img/logo01.png" alt="logo">
        </a>

        <!-- Toggler -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
          aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="navbarCollapse">

          <!-- Nav -->
          <ul class="navbar-nav mx-auto">
          
            <li class="nav-item">
              <a class="nav-link" href=/challengeList>챌린지</a>
            </li>
            
            <li class="nav-item">
              <a class="nav-link" href="/nearbySharing">내주변 쉐어</a>
            </li>
            
            <li class="nav-item dropdown hovered">

              <!-- Toggle -->
              <a class="nav-link" data-bs-toggle="dropdown" href="#" aria-expanded="false">커뮤니티</a>

              <!-- Menu -->
              <div class="dropdown-menu">
                <div class="card card-lg">
                  <div class="card-body">
                    <ul class="list-styled fs-sm">
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/sharing">쉐어링</a>
                      </li>
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/listCommunity">자유게시판</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              
            </li>
            
            <li class="nav-item dropdown hovered">

              <!-- Toggle -->
              <a class="nav-link" data-bs-toggle="dropdown" href="#" aria-expanded="false">소식</a>

              <!-- Menu -->
              <div class="dropdown-menu">
                <div class="card card-lg">
                  <div class="card-body">
                    <ul class="list-styled fs-sm">
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/notice?brd_md=105">공지사항</a>
                      </li>
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/notice?brd_md=106">이벤트</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              
            </li>
            
            <li class="nav-item">
              <a class="nav-link" href="/introduce">서비스 소개</a>
            </li>
            
          </ul>

          <!-- Nav -->
          <ul class="navbar-nav flex-row">
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="offcanvas" href="./search">
                <i class="fe fe-search"></i>
              </a>
            </li>
            
            <li class="nav-item dropdown hovered">

              <!-- Toggle -->
              <c:choose>
	              
	             <c:when test="${sessionScope.user_num != null}"> 
				  	<a class="nav-link" data-bs-toggle="dropdown" href="#" aria-expanded="false">
	              		<i class="fa fa-user"></i>
	              	</a>
				  
				  <!-- Menu -->
	              <div class="dropdown-menu">
	                <div class="card card-lg">
	                  <div class="card-body">
	                    <ul class="list-styled fs-sm">
	                      <li class="list-styled-item">
	                        <a class="list-styled-link" href="/logoutForm">로그아웃</a>
	                      </li>
	                      <li class="list-styled-item">
	                        <a class="list-styled-link" href="/mypage">마이페이지</a>
	                      </li>
	                    </ul>
	                  </div>
	                </div>
	              </div>
		  		 </c:when>
		  		 
		  		 <c:when test="${sessionScope.user_num == null}"> 
	              <a class="nav-link" data-bs-toggle="dropdown" href="#" aria-expanded="false">
	              	<i class="fe fe-user"></i>
	              </a>
	
	              <!-- Menu -->
	              <div class="dropdown-menu">
	                <div class="card card-lg">
	                  <div class="card-body">
	                    <ul class="list-styled fs-sm">
	                      <li class="list-styled-item">
	                        <a class="list-styled-link" href="/loginForm">로그인</a>
	                      </li>
	                      <li class="list-styled-item">
	                        <a class="list-styled-link" href="/signUp">회원가입</a>
	                      </li>
	                    </ul>
	                  </div>
	                </div>
	              </div>
	            </c:when>
              </c:choose>
            </li>

            <li class="nav-item ms-lg-n4">
              <a class="nav-link" href="./account-wishlist.html">
                <i class="fe fe-heart"></i>
              </a>
            </li>
            <li class="nav-item ms-lg-n4">
              <a class="nav-link" data-bs-toggle="offcanvas" href= "#" id="alarmpopup">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16" >
				  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
				</svg>
				<span class="alarmAjax"></span>			
              </a>
            </li>
          </ul>
		 
        </div>
       
        <div id="alarmDiv">
        	<div class="card" style="width: 18rem;" id="alarmPopText" >
			  <div class="card-body">
			    <ul id="test">
			    	
			    </ul>
			    <a href="#" class="btn btn-primary">Go somewhere</a>
			  </div>
			</div>
	  	</div>
	  	
	  	
	  	
      </div>
    </nav>
		


<!-- CSS start -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
    
<!-- Favicon -->
<link rel="shortcut icon" href="./assets/favicon/favicon.ico" type="image/x-icon" />

<!-- Libs CSS -->
<link rel="stylesheet" href="./assets/css/libs.bundle.css" />

<!-- Theme CSS -->
<link rel="stylesheet" href="./assets/css/theme.bundle.css" />    
    
<!-- JAVASCRIPT -->
<!-- Map (replace the API key to enable) -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnKt8_N4-FKOnhI_pSaDL7g_g-XI1-R9E"></script>

<!-- Vendor JS -->
<script src="./assets/js/vendor.bundle.js"></script>

<!-- Theme JS -->
<script src="./assets/js/theme.bundle.js"></script>

<!--  jquery.js-->
<script src="./js/jquery.js"></script>


<style>
	#alarmPopText{
		display: none;
			
	}
	
	#alarmDiv{
		z-index: 999;
		position: absolute;
		right: 250px;
		top: 80px;
	}
	
</style>

<script type="text/javascript">
	function alarmText(data){
		var str = "";
		for(var i =0; i<data.reCount; i++){
			str += "<li>'" + data.listBdRe[i].title +"'글에 댓글이 달렸습니다.</li>"
		}
		
		return str;
	}
	
	
	function alarmchk(){
		/* alert("test"); */
		$.ajax(
				{
				type:"GET",
				url: "rechk",
				dataType:"json", 
				success:function(data){
					
					if(data.reCount > 0){
						var str = "<span data-cart-items='"+data.reCount+"'></span>";
						$(".alarmAjax").html(str); 
						
						var text = alarmText(data);
						$("#test").html(text);
						
					}
				}
			}
		);
	}
	
	$(function(){
			var alarmpopup = document.getElementById("alarmpopup");
			var alarmPopText = document.getElementById("alarmPopText");
			alarmpopup.addEventListener("click", clickalarm);
			function clickalarm(){
				if($("#alarmPopText").css("display") == "none"){
					alarmPopText.style.display = "block";
				} else {
					$("#alarmPopText").hide();
				}
				
			}
		
			
	}	
	)
	
</script>
<body onload="alarmchk()"></body>

