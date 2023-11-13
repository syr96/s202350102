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
              <a class="nav-link" href=/listChallenge>챌린지</a>
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
              <a class="nav-link" href="/qBoardList">문의</a>
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
	                        <a class="list-styled-link" href="/logout">로그아웃</a>
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
       		<div class="card" style="display: none;" id="alarmPopText" >
			  <div class="card-body">
			    <table id="test">
			    	<h4>새로운 댓글이 없습니다.</h4>
			    	<h6>더 열심히 활동해볼까요?</h6>
			    </table>
			    <a href="#" class="btn btn-primary" onclick="readAlarmAll() return false;">전체 읽음</a>
			    
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
<a href="detailCommunity?user_num=4&brd_num=11"></a>

<style>
	#alarmPopText{
		display: none;
		z-index: 999;
		position: absolute;
		right: 250px;
		top: 80px;
		width: 28em;
			
	}
	#alarmPopText td{
		padding: 10px;
		border-bottom: 1px solid #EAEAEA;
		
	}
	
	
</style>

<script type="text/javascript">
	function alarmText(data){
		var str = "";
		
		for(var i =0; i<data.reCount; i++){
			str += "<tr>";
			str += "<td><a href='javascript:void(0);' onclick='read("+data.listBdRe[i].user_num+","+data.listBdRe[i].brd_num+"); return false;' ><b>";			
			str += data.listBdRe[i].title + "</b>글에 "+data.listBdRe[i].re_step +"번째 댓글이 달렸습니다.</a></td>";
			str += "<td><a href='#' id='alarmRead' data-user-num='" + data.listBdRe[i].user_num + "' data-re-step='"+data.listBdRe[i].re_step + "'onclick='readAlarm(event)'>";
			str +="<button class='btn btn-danger btn-circle btn-xxs mb-1'><i class='fe fe-check'></i></button></a></td>"	  
	    	str += "</tr>";			
				
		}
				
		return str;
	}
	
	function readAlarm(event){
		event.preventDefault();
		
		var userNum = $(event.target).data("user-num");
		var reStep = $(event.target).data("re-step");
		alert(reStep);
		
		
		$.ajax(
				{
					type: "POST",
					url:"readAlarm",
					data:{user_num : userNum, re_step : reStep},
					dataType: "text",
					success:function(data){
						if(data > 0){
							alarmchk();
						}
					}
				}
		)
	}
	
	function read(user_num, brd_num){
		/* alert("user_num"+user_num);
		alert("brd_num"+brd_num); */
		$.ajax({
			type:"POST",
			url:"moveToNewCmt",
			data: {user_num : user_num, brd_num : brd_num},
			success:function(data){
				if(data > 0){
					window.location.href = 'detailCommunity?user_num=' + user_num + '&brd_num=' + brd_num;
				}
			}
		})
		
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

