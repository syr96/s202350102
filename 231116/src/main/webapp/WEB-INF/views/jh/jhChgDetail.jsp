<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .list-group-horizontal-sm .list-group-item {
        border: none /* 테두리 없애기 */
    }
</style>
<title>챌린지 상세 페이지</title>
<script type="text/javascript">
/* 	//jh 작성 -> 보류(챌린지 후기 10개 이상 쓰고 다시 해보기)
 * 일단 리뷰에만 적용되게 하고 추후에 변경하기 1페이지 누르면 아래 적용 안됨
 */
 	$(document).ready(function() {
 			//jh작성
	        var tap = $("#reviewCurrentPage").val();
	        //alert("tap -> " + tap);
	        if (tap == 3) {
					var targetElement = $('.nav-link');
					if(targetElement.length > 0) {
						 $('html, body').animate({
			                    scrollTop: targetElement.offset().top +1000
			                }, 500);
					}

					// 현재 active 클래스가 있는 요소를 찾아서 제거
					document.getElementById('descriptionNav')?.classList.remove('active');
					document.getElementById('descriptionTab')?.classList.remove('active', 'show');
/* 					document.querySelector('.nav-link.active')?.classList.remove('active');
					document.querySelector('.tab-pane.fade.show.active')?.classList.remove('active', 'show'); */

					// 새로운 active 클래스를 추가할 요소들을 찾아서 추가
					document.getElementById('reviewNav')?.classList.add('active');
					document.getElementById('reviewTab')?.classList.add('active', 'show');
	        } 
	            
	        
	}); 




	// yr 작성	
	// 챌린지 신청
	function cJoin() {
		var sendData = $('#cJoinForm').serialize();	// user_num=?&chg_id=?
		// alert("sendData -> " + sendData);
		
		$.ajax({
			url: "/chgJoinPro",
			type : "POST",
			data : sendData,
			dataType : 'json',
			success : function(joinResult) {
				if(joinResult.chgJoin > 0) {
					// 참여 완료 modal
					document.getElementById('chgResultModalClick').click();
				}
			},
			error : function() {
				alert("참여 오류");
			} 		
		});
	}

	// 유저 닉네임 클릭 시 modal 창 띄우기
	function userInfoModal(index) {
		// 모달창에 넘겨줄 값을 저장 
		var user_num = $("#ssjUserNum" + index).val();
		var user_nick = $("#ssjNick" + index).val();
		var user_img = $("#ssjImg" + index).val();
		
		// DB에 있는지 존재 유무 체크
		$.ajax({
			url : "/followingCheck",
			type : "POST",
			data:{following_id : user_num},
			dataType : 'json',
			success : function(followingCheck) {
				if(followingCheck.fStatus > 0) {
					$("#follow").removeClass("btn-danger");
					$("#follow").addClass("btn-light");
 					$("#follow").text("팔로잉");
				} else {
					$("#follow").removeClass("btn-light");
					$("#follow").addClass("btn-danger");
					$("#follow").text("팔로우");
				}
			},
			error : function() {
				alert("팔로우 오류");
			}

		});

		// userShowModal 모달 안의 태그 -> 화면 출력용  <span> <p> -> text
		$('#displayUserNick').text(user_nick);
		$('#displayUserImg').text(user_img);
			
		// userShowModal 모달 안의 태그 input Tag -> Form 전달용		<input> -> <val>
		$('#inputUserNum1').val(user_num);	// following()
		$('#inputUserNum2').val(user_num);	// sendMessage()

		// 모달 창 표시
		$('#userShowModal').modal('show');
	}


	// 팔로우 하기 버튼
	function following() {
		var sendData = $('#followingForm').serialize();	// user_num=?

		$.ajax({
			url : "/followingPro",
			type : "POST",
			data : sendData,
			dataType : 'json',
			success : function(followResult) {

				if(followResult.following > 0) {
					$("#follow").removeClass("btn-danger");
					$("#follow").addClass("btn-light");
					$("#follow").text("팔로잉");
				} else {
					$("#follow").removeClass("btn-light");
					$("#follow").addClass("btn-danger");
					$("#follow").text("팔로우");
				}
			},
			error : function() {
				alert("팔로우 오류");
			}

		});
		
	}


	// 챌린지 찜하기
	function chgPick(p_index) {
		// var chg_id = p_chg_id;
		// alert("chg_id -> " + chg_id);

		$.ajax({
			url : "/chgPickPro",
			type : "POST",
			data : {chg_id : p_index},
			dataType : 'json',
			success : function(chgPickResult) {
				if(chgPickResult.chgPick > 0) {
					$("#chgPick").removeClass("btn-outline-dark").addClass("btn-dark");
				} else {
					$("#chgPick").removeClass("btn-dark").addClass("btn-outline-dark");
				}

			},
			error : function() {
				alert("찜하기 오류");
			}
		});
	}


	// 쪽지보내기 버튼
	function sendMessage() {
		var sendData = $('#sendMessageForm').serialize();	// user_num=?
		alert("sendDate -> " + sendData);
	}
  
  
	// bg 작성
	function writeCertBrd() {
		
		//alert("writeCertBrd Start");
		
		// EL값을 JavaScript 변수에 저장
		var user_num = ${user.user_num};
		// chg_id 챌린지 페이지 아직 없어서 임시용으로 변수에 저장함
		//var chg_id = 1;
		var chg_id = ${chg.chg_id};
		
		// 이미지 파일 선택
		var screenshot = $("#screenshot")[0].files[0];
		
		
		// 이미지 파일, 제목, 내용을 FormData 에 추가
		var formData = new FormData();
		formData.append("title", $('#title').val());
		formData.append("conts", $('#conts').val());
		formData.append("chg_id", chg_id);
		formData.append("user_num", user_num);
		formData.append("screenshot", screenshot);
		
		
		// 사용자가 입력한 내용 가져오기 -> ver.1:  이미지도 전달해야 해서 보류
		//var paramData = {
		//					"title"	:	$('#title').val(),
		//					"conts"	:	$('#conts').val(),
		//					"chg_id":	chg_id,
		//					"user_num":	user_num
		//};
		
		// alert("paramData $('#title').val() ->"+$('#title').val());
		// alert("paramData $('#conts').val() ->"+$('#conts').val());
		// alert("paramData chg_id ->"+chg_id);
		// alert("paramData user_num ->"+user_num); 
		
		// 서버로 데이터 전송
		$.ajax({
			url	:	"/writeCertBrd",
			type:	"POST",
			data:	formData,
			dataType:'text',
			processData: false,		// 이미지 파일 처리를 위해 false로 설정
			contentType: false,		// 이미지 파일 처리를 위해 false로 설정
			success:function(data){
				alert(".ajax writeCertBrd->"+data); 
				if (data == '1') {
					// 성공하면 아래라인 수행 
					alert("입력성공");
				}
			},
			error: function() {
				// Ajax 요청 자체가 실패한 경우
				alert("error: 글 등록에 실패했습니다");
			}
		});
	}
	
	
	
	//  '수정' 버튼 클릭 시    ->   글 수정용 모달 창 열기
	function updateModalCall(index) {
		
		// alert("updateModalCall Start...");
		
		// 모달창에 넘겨줄 값을 저장 
		var brd_num =   $("#brd_num"+index).val();  		
		var nick =   	$("#nick"+index).val();  		
		var reg_date =	$("#reg_date"+index).val();  
		var title =		$("#title"+index).val();  
		var conts =		$("#conts"+index).val();  
		var img =		$("#img"+index).val();  
		
		// alert("img -> " + img);
		// alert("${pageContext.request.contextPath}/upload/"+img);
		
		/*
			 alert("updateModalCall nick -> "+nick);
		 alert("updateModalCall reg_date -> "+reg_date);
		 alert("updateModalCall title -> "+title);
		 alert("updateModalCall conts -> "+conts); 
		 */
		 
		// 이미지 설정
		$('#modalImage').attr('src', '${pageContext.request.contextPath}/upload/'+img);
		 
		//  글 수정 모달 창 안의 태그 -> 화면 출력용  <span> <p> -> text
		$('#displayNick').text(nick);     
		$('#displayReg_date').text(reg_date); 
		$('#editImage').text(img);
		
		//   글 수정 모달 창 안의 태그 input Tag -> Form 전달용		<input> -> <val>
		$('#editBrd_num').val(brd_num);     
		$('#editNick').val(nick);     
		$('#editTitle').val(title);     
		$('#editConts').val(conts);     
		
		// 모달 창 표시
		$('#modalUpdateCertBrdForm').modal('show');
	}
	
	
	
	// 수정 시, 업로드 사진 변경할 수 있게
	function fileUpdate() {
		var fileInput = document.getElementById('fileInput');
		if(fileInput.style.display == "none") {
			fileInput.style.display = "block";
			fileInput.removeAttribute('disabled');
			$("#imgOroot").hide();
		} else {
			fileInput.style.display = "none";
			fileInput.setAttribute('disabled', 'true');
			$('#imgOroot').show();
		}
	}
	
	
	
	// '삭제' 버튼 클릭 시
	function deleteCertBrd(index) {
		
		var brd_num = $("#brd_num"+index).val();
		
		$.ajax({
			url:"/brdNumDelete",
			data:{brd_num : brd_num},
			dataType:'text',
			
			success:function(data){
				alert(".ajax deleteCertBrd data -> "+data);
				if (data == '1') {
					// id 가 review +index 성공하면 아래 라인 수행
					$('#review'+index).remove();		/* Delete Tag */
					
				}
			}
		});
	}

	
	
	// 찌르기 모달창 띄우기 
	// 		forkModalCall(${status.index}) 에서 올 때 index 입력 잊지 말기~! 
	function forkModalCall(index) { 
		 
		// 모달 창에 넘겨줄 값을 저장 
		var ssjUserNum = $("#ssjUserNum"+index).val(); 
		 
		// 찌르기 모달 창 안의 태그 
		$('#ssjUserNum').val(ssjUserNum); 
		 
		// 모달 창 표시 
		$('#modalfork').modal('show'); 
		document.getElementById('cheerUpMsg').placeholder = "안녕하세요!\n얼마 동안 활동이 뜸한 것 같아 걱정이 되네요\n함께 더 활발한 모습으로 돌아오기를 기대하고 있어요\n응원합니다!"; 
		 
	} 
	 
	 
	 
	// 찌르기 메일 보내기 
	function sendMail() { 
		 
		// EL값을 JavaScript 변수에 저장 
		// 실패:  
		var sendMailUser_num	= ${user.user_num}; 
		alert("sendMailUser_num -> "+sendMailUser_num); 
		 
		// 넘겨줄 값을 저장 
		var ssjUserNum	= $("#ssjUserNum").val(); 
		var cheerUpMsg	= $("#cheerUpMsg").val(); 
		 
		 
		$.ajax({ 
			type:	"POST", 
			url:	"sendMail", 
			data:	{ 
				sendMailUser_num:	sendMailUser_num, 
				ssjUserNum:	ssjUserNum, 
				cheerUpMsg:	cheerUpMsg 
			}, 
			success:	function (response) { 
				// 성공했을 때의 동작 
				console.log(response); 
			}, 
			error:		function (error) { 
				// 실패했을 때의 동작 
				console.log(error); 
			} 
		}); 
		 
		// 다음 동작으로 넘어가는 코드 
		window.location.href = 'sendMail'; 
	} 
	
	
	
	function toggleCommentForm(index) {
		alert("toggleCommentForm Start...")
		var commentForm = document.getElementById("commentForm"+index);
		if (commentForm) {
			commentForm.classList.toggle("show");
		}
	}
	
	
	
	// 댓글 공백 체크
	function commentInsertchk(form) {
		form.conts.value = form.conts.value.trim();
		
		// 댓글 미입력시 체크
		if(form.conts.value.length == 0) {
			alert("댓글을 입력해주세요");
			form.conts.focus();
			return false;
		}
		// 댓글 입력시 실행
		return true;
	}
	
	
	
</script> 
</head>
<body>
	<input type="button" value="목록" onclick="location.href='/thChgList'" > 
    <!-- BREADCRUMB -->
    <nav class="py-5">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Breadcrumb -->
            <ol class="breadcrumb mb-0 fs-xs text-gray-400">
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="index.html">챌린지</a>
              </li>
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="shop.html">${chg.ctn }</a>
              </li>
              <li class="breadcrumb-item active">${chg.title }
                	
              </li>
            </ol>

          </div>
        </div>
      </div>
    </nav>

<!-- PRODUCT -->
    <section>
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="row">
              <div class="col-12 col-md-6">

                <!-- Card -->
                <div class="card">

                  <!-- Badge -->
                  <div class="badge bg-primary card-badge text-uppercase">
                                    인기
                                    <!-- 찜수  -->
                  </div>

                  <!-- Slider -->
                  <div class="mb-4" data-flickity='{"draggable": false, "fade": true}' id="productSlider">


                    <!-- Item -->
           		    <c:choose>
					    <c:when test="${empty reviewContent.img}">
							<img src="assets/img/chgDfaultImg.png" alt="이미지가 없습니다" class="card-img-top" >
					    </c:when>
					    <c:otherwise>
							 <img src="${pageContext.request.contextPath}/upload/${chg.thumb}" class="card-img-top" alt="이미지 업로드에 실패했습니다." >
					    </c:otherwise>
					</c:choose>
             <!--썸네일 처리 해야 함 파일 위치랑 null일 때 뜨게 할 것  -->
                  </div>
                </div>


              </div>
              <div class="col-12 col-md-6 ps-lg-10">

                <!-- Heading -->
                <h3 class="mb-2">${chg.title }</h3>
                
                
                <div class="col-12 col-md-6">


                  <ul class="list-group list-group-horizontal-sm">
                    <li class="list-group-item">개설자</li>
                    <li class="list-group-item">${chg.nick }</li>
                  </ul>
                  <ul class="list-group list-group-horizontal-sm">
                      <li class="list-group-item">참여 인원</li>
                    <li class="list-group-item">${chgrParti } / ${chg.chg_capacity }</li>
                  </ul>
                  <ul class="list-group list-group-horizontal-sm">
                    <li class="list-group-item">진행 기간</li>
                    <li class="list-group-item"><fmt:formatDate value="${chg.create_date }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${chg.end_date }" pattern="yyyy-MM-dd"/> </li>
                  </ul>
                  <ul class="list-group list-group-horizontal-sm">
                    <li class="list-group-item">진행 상태</li>
                    <li class="list-group-item">${chg.stateCtn }</li>
                  </ul>
                  <ul class="list-group list-group-horizontal-sm">
                    <li class="list-group-item">인증 빈도</li>
                    <li class="list-group-item">${chg.freq }</li>
                  </ul>
                  <ul class="list-group list-group-horizontal-sm">
                    <li class="list-group-item">챌린지 찜</li>
                    <li class="list-group-item">${chg.pick_cnt }</li>
                  </ul> 
               
               
					<div class="form-group">
						<div class="row gx-5 mb-7">
							<!-- 참여하기 -->
							<!-- YR 작성 -->
							<div class="col-12 col-lg-auto">
								<c:choose>
									<c:when test="${chg.stateCtn == '진행중'}">
							
										<c:choose>
							
											<c:when test="${sessionScope.user_num != null}">
												<!-- 로그인 한 상태 -->
												<button type="button" class="btn btn-danger mb-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
													참여하기
												</button>
							
												<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog">
							
														<c:choose>
							
															<c:when test="${chg.chg_capacity == chgrParti }">
																<!-- 참여 정원 = 참가 인원 -->
																<div class="modal-content">
																	<div class="modal-body">
																		<p>참여인원이 마감되었습니다</p>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
																			aria-label="Close">취소하기</button>
																	</div>
																</div>
							
															</c:when>
							
							
															<c:otherwise>
							
																<c:choose>
							
																	<c:when test="${chgrYN == 1 }">
																		<!-- 이미 챌린지 참여함 -->
																		<div class="modal-content">
																			<div class="modal-body">
																				<p>이미 참여한 챌린지입니다</p>
																			</div>
																			<div class="modal-footer">
																				<button type="button" class="btn btn-secondary"
																					data-bs-dismiss="modal" aria-label="Close">취소하기</button>
																			</div>
																		</div>
																	</c:when>
							
							
																	<c:otherwise>
																		<!-- 챌린지 참가 -->
																		<div class="modal-content">
																			<div class="modal-body">
																				<p>현재 참여 인원 : ${chgrParti } / 참여 정원 : ${chg.chg_capacity}</p>
																				<p>${user.nick }님 챌린지에 참여하시겠습니까?</p>
																			</div>
																			<div class="modal-footer">
																				<button type="button" class="btn btn-secondary"
																					data-bs-dismiss="modal" aria-label="Close">취소하기</button>
																				<button type="button" class="btn btn-danger"
																					onclick="cJoin()">참여하기</button>
																				<form id="cJoinForm">
																					<input type="hidden" name="user_num" value="${user.user_num}">
																					<input type="hidden" name="chg_id" value="${chg.chg_id}">
																				</form>
																			</div>
																		</div>
							
																	</c:otherwise>
							
																</c:choose>
							
															</c:otherwise>
							
														</c:choose>
							
													</div>
												</div>
							
											</c:when>
							
											<c:when test="${sessionScope.user_num == null}">
												<!-- 로그인 안 한 상태 -->
												<button type="button" class="btn btn-danger mb-2" onclick="location.href='/loginForm'">
													참여하기
												</button>
											</c:when>
							
										</c:choose>
							
									</c:when>
							
									<c:otherwise>
										<button type="button" class="btn btn-secondary mb-2">
											챌린지 종료
										</button>
									</c:otherwise>
								</c:choose>
								
								<!-- 참여완료 YN -->
								<button type="button" class="btn btn-danger mb-2" id="chgResultModalClick" data-bs-toggle="modal" data-bs-target="#chgResultModal" hidden>
									참여완료
								</button>
								
								<!-- 챌린지 참여 성공 -->
								<div class="modal fade" tabindex="-1" id="chgResultModal" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-body">
												<p>챌린지 참여가 완료되었습니다</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">닫기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							

							<!-- 찜하기 -->
							<!-- YR 작성 -->
							<div class="col-12 col-lg">

								<c:choose>
									<c:when test="${sessionScope.user_num != null}">
										<!-- 로그인 한 상태 -->
										<c:choose>
										
											<c:when test="${chgPickYN == 1}">
												<!-- 찜 기록 있을 때 -->
												<button class="btn btn-dark w-100 mb-2" data-toggle="button" onclick="chgPick(${chg.chg_id})" id="chgPick">
													챌린지 찜 <i class="fe fe-heart ms-2"></i>
												</button>	
											</c:when>

											<c:otherwise>
												<!-- 찜 기록 없을 때 -->
												<button class="btn btn-outline-dark w-100 mb-2" data-toggle="button" onclick="chgPick(${chg.chg_id})" id="chgPick">
													챌린지 찜 <i class="fe fe-heart ms-2"></i>
												</button>
											</c:otherwise>
										</c:choose>

									</c:when>
									
									<c:otherwise>
										<!-- 로그인 안 한 상태 -> 로그인 페이지로 이동 -->
										<button class="btn btn-outline-dark w-100 mb-2" data-toggle="button" onclick="location.href='/loginForm'">
											챌린지 찜 <i class="fe fe-heart ms-2"></i>
										</button>
									</c:otherwise>

								</c:choose>

							</div>
						</div>


						<!-- Share -->
						<p class="mb-0">
						<span class="me-4">Share:</span>
						<a class="btn btn-xxs btn-circle btn-light fs-xxxs text-gray-350" href="#!">
							<i class="fab fa-twitter"></i>
						</a>
						<a class="btn btn-xxs btn-circle btn-light fs-xxxs text-gray-350" href="#!">
							<i class="fab fa-facebook-f"></i>
						</a>
						<a class="btn btn-xxs btn-circle btn-light fs-xxxs text-gray-350" href="#!">
							<i class="fab fa-pinterest-p"></i>
						</a>
						</p>

					</div>

              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
    </section>



 <!-- DESCRIPTION -->
    <section class="pt-11">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Nav -->
            <div class="nav nav-tabs nav-overflow justify-content-start justify-content-md-center border-bottom">
              <a class="nav-link active" id="descriptionNav" data-bs-toggle="tab" href="#descriptionTab">
               	 챌린지 소개
              </a>
              <a class="nav-link" id="certNav" data-bs-toggle="tab" href="#certBoardTab">
                             인증 게시판
              </a>
              <a class="nav-link" id="ssgNav" data-bs-toggle="tab" href="#ssjFriendsTab">
                             소세지들
              </a>
              
              <!-- 일단 기본 활성화 상태로 두었다가 시간 남으면 챌린지 종료되면 활성화 되게 하기  -->
              <a class="nav-link" id="reviewNav" data-bs-toggle="tab" href="#reviewTab">
                             후기 게시판
              </a>
            </div>
			
            <!-- Content -->
            <div class="tab-content">
              <div class="tab-pane fade show active" id="descriptionTab">
                <div class="row justify-content-center py-9">
                  <div class="col-12 col-lg-10 col-xl-8">
                    <div class="row">
                      <div class="col-12">

                        <!-- Text -->
                        <p class="text-gray-500">
                        <!-- 유저닉은 로그인 유지 되는지 확인하기 위한 것 나중에 삭제 예정 -->
                        	${user.nick} <p>
							${chg.chg_conts }<p>
							인증방법 : ${chg.upload }<p>
							<img alt="인증예시" src="${sample_img }">
                        </p>

                      </div>
                      
                    </div>
                  </div>
                </div>
              </div>
              
            

            <!-- BG 인증 게시판 -->
            <div class="tab-pane fade" id="certBoardTab">
	                <div class="row justify-content-center py-9">
	                  <div class="col-12 col-lg-10 col-xl-8">
     			        <!-- Heading -->
			            <h4 class="mb-10 text-center">인증 게시판</h4>
			            
		            	<!-- 인증게시판 C -->
			            <c:choose>
			            	<c:when test="${certTotal == 0 }">
			            	<!-- 1. 인증글이 없을 때 -->
			            		<div class="text-center">
			            			<div class="mb-6 fs-1">🙁</div>
			            			<p>
			            				인증글이 없습니다. 첫 인증글을 올려주세요!
			            			</p>
			            			<c:choose>
					              		<c:when test="${chgrYN == 1 }">
					              			<!-- 참여자일 경우 -->
							              	<!-- Button -->
							                <a class="btn btn-sm btn-dark" data-bs-toggle="collapse" href="#writeForm">
						                		인증하기
						                	</a>
					              		</c:when>
					              		<c:otherwise>
					              			<!-- 로그인 했지만 참여자가 아닌 경우 -->
					              			<!-- Button -->
					              			<a class="btn btn-sm btn-dark" data-bs-toggle="collapse" href="#writeForm">
						                		인증하기
						                	</a>
					              		</c:otherwise>
					              	</c:choose>
			            		</div>
			            		<!-- 새 인증글 -->
					            <div class="collapse" id="writeForm">
					              <!-- Divider -->
					              <hr class="my-8">
					              <!-- 인증 글쓰기 Form -->
					              <form id="certForm">
					                <div class="row">
						              <c:choose>
						              	<c:when test="${chgrYN == 1 }">
						              	<!-- 1. 참여자일 경우 -->
						                  <div class="col-12 col-md-6">
						                    <!-- 유저 닉네임 표시하는 란 Name -->
						                    <div class="form-group">
							                      <p class="mb-2 fs-lg fw-bold">
							                        ${user.nick }
							                      </p>
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 제목 입력란  Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewTitle">CertBrd Title:</label>
						                      <input class="form-control form-control-sm" id="title" type="text" placeholder="제목을 작성해주세요 *" required>
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 인증글 입력란 Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewText">CertBrd:</label>
						                      <textarea class="form-control form-control-sm" id="conts" rows="5" placeholder="인증글을 작성해주세요 *" required></textarea>
						                    </div>
						                  </div>
						                  
						                  <div class="mb-3">
						                  	<!-- 인증샷 -->
										  	<label for="formFile" class="form-label">인증샷을 올려주세요 *</label>
											<input class="form-control" type="file" id="screenshot" name="screenshot">
										  </div>
												                  
						                  <div class="col-12 text-center">
						                    <!-- 등록 Button -->
						                    <button class="btn btn-outline-dark" type="submit" onclick="writeCertBrd()">
						                      	등록
						                    </button>
						                  </div>
						              	</c:when>
						              	
						              	
						              	<c:when test="${user == null }">
						              	<!-- 2. 비로그인 인터셉터 ing -->
											<div class="col-12 col-md-6">
						                    <!-- 유저 닉네임 표시하는 란 Name -->
						                    <div class="form-group">
							                      <p class="mb-2 fs-lg fw-bold">
							                        ${user.nick }
							                      </p>
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 제목 입력란  Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewTitle">CertBrd Title:</label>
						                      <input class="form-control form-control-sm" id="title" type="text" placeholder="제목을 작성해주세요 *" >
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 인증글 입력란 Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewText">CertBrd:</label>
						                      <textarea class="form-control form-control-sm" id="conts" rows="5" placeholder="인증글을 작성해주세요 *" ></textarea>
						                    </div>
						                  </div>
						                  
						                  <div class="mb-3">
						                  	<!-- 인증샷 -->
										  	<label for="formFile" class="form-label">인증샷을 올려주세요 *</label>
											<input class="form-control" type="file" id="screenshot" name="screenshot">
										  </div>
												                  
						                  <div class="col-12 text-center">
						                    <!-- 등록 Button -->
						                    <button class="btn btn-outline-dark" type="submit" onclick="writeCertBrd()">
						                      	등록
						                    </button>
						                  </div>
						              	</c:when>
						              	
						              	<c:otherwise>
						              	<!-- 3. 참여자가 아닌 회원 -->
						              		<div class="col-12 col-md-6">
						                    <!-- 유저 닉네임 표시하는 란 Name -->
						                    <div class="form-group">
							                      <p class="mb-2 fs-lg fw-bold">
							                        ${user.nick }
							                      </p>
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 제목 입력란  Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewTitle">Review Title:</label>
						                      <input class="form-control form-control-sm" id="title" type="text"  placeholder="챌린지 참여자만 글을 쓸 수 있습니다" disabled="disabled">
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 인증글 입력란 Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewText">Review:</label>
						                      <textarea class="form-control form-control-sm" id="conts" rows="5" placeholder="챌린지 참여자만 글을 쓸 수 있습니다" disabled="disabled"></textarea>
						                    </div>
						                  </div>
						                  
						                  <div class="mb-3">
						                  	<!-- 인증샷 -->
										  	<label for="formFile" class="form-label">인증샷을 올려주세요 *</label>
											<input class="form-control" type="file" id="screenshot" name="screenshot">
										  </div>
												                  
						                  <div class="col-12 text-center">
						                    <!-- 등록 Button -->
						                    <button class="btn btn-outline-dark" type="submit" disabled="disabled">
						                      	등록
						                    </button>
						                  </div>
						              	</c:otherwise>
						                  
						              </c:choose>
					                </div>
					              </form>
					
					            </div>
			            	</c:when>
			            	<c:otherwise>
			            	<!-- 2. 인증글이 있을 때 -->
					            <!-- Header -->
					            <div class="row align-items-center">
					              <div class="col-12 col-md-auto">
					
					                <!-- Dropdown -->
					                <div class="dropdown mb-4 mb-md-0">
					
					                  <!-- Toggle -->
					                  <a class="dropdown-toggle text-reset" data-bs-toggle="dropdown" href="#">
					                    <strong>Sort by: Newest</strong>
					                  </a>
					
					                  <!-- Menu -->
					                  <div class="dropdown-menu mt-3">
					                    <a class="dropdown-item" href="#!">Newest</a>
					                    <a class="dropdown-item" href="#!">Oldest</a>
					                  </div>
					
					                </div>
					
					              </div>
					              
					              <div class="col-12 col-md text-md-center">
					                <!-- Count 총 인증 수 -->
					                <strong class="fs-sm ms-2">Total ${certTotal }</strong>
					              </div>
					              
					              
					              <div class="col-12 col-md-auto">
					              	<c:choose>
					              	
					              		<c:when test="${chgrYN == 1 }">
					              			<!-- 참여자일 경우 -->
							              	<!-- Button -->
							                <a class="btn btn-sm btn-dark" data-bs-toggle="collapse" href="#writeForm">
						                		인증하기
						                	</a>
					              		</c:when>
					              		
					              		
					              		
					              		<c:otherwise>
					              			<!-- 로그인 했지만 참여자가 아닌 경우 -->
					              			<!-- Button -->
					              			<a class="btn btn-sm btn-dark" data-bs-toggle="collapse" href="#writeForm">
						                		인증하기
						                	</a>
					              			
					              		</c:otherwise>
					              		
					              	</c:choose>
					              </div>
					              
					              
					            </div>
					            <!-- 새 인증글 -->
					            <div class="collapse" id="writeForm">
					
					              <!-- Divider -->
					              <hr class="my-8">
					
					              <!-- 인증 글쓰기 Form -->
					              <form id="certForm">
					                <div class="row">
					                  
						              <c:choose>
						              	<c:when test="${chgrYN == 1 }">
						              	<!-- 1. 참여자일 경우 -->
						                  <div class="col-12 col-md-6">
						                    <!-- 유저 닉네임 표시하는 란 Name -->
						                    <div class="form-group">
							                      <p class="mb-2 fs-lg fw-bold">
							                        ${user.nick }
							                      </p>
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 제목 입력란  Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewTitle">CertBrd Title:</label>
						                      <input class="form-control form-control-sm" id="title" type="text" placeholder="제목을 작성해주세요 *" required>
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 인증글 입력란 Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewText">CertBrd:</label>
						                      <textarea class="form-control form-control-sm" id="conts" rows="5" placeholder="인증글을 작성해주세요 *" required></textarea>
						                    </div>
						                  </div>
						                  
						                  <div class="mb-3">
						                  	<!-- 인증샷 -->
										  	<label for="formFile" class="form-label">인증샷을 올려주세요 *</label>
											<input class="form-control" type="file" id="screenshot" name="screenshot">
										  </div>
												                  
						                  <div class="col-12 text-center">
						                    <!-- 등록 Button -->
						                    <button class="btn btn-outline-dark" type="submit" onclick="writeCertBrd()">
						                      	등록
						                    </button>
						                  </div>
						              	</c:when>
						              	
						              	
						              	<c:when test="${user == null }">
						              	<!-- 2. 비로그인 인터셉터 ing -->
											<div class="col-12 col-md-6">
						                    <!-- 유저 닉네임 표시하는 란 Name -->
						                    <div class="form-group">
							                      <p class="mb-2 fs-lg fw-bold">
							                        ${user.nick }
							                      </p>
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 제목 입력란  Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewTitle">CertBrd Title:</label>
						                      <input class="form-control form-control-sm" id="title" type="text" placeholder="제목을 작성해주세요 *" >
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 인증글 입력란 Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewText">CertBrd:</label>
						                      <textarea class="form-control form-control-sm" id="conts" rows="5" placeholder="인증글을 작성해주세요 *" ></textarea>
						                    </div>
						                  </div>
						                  
						                  <div class="mb-3">
						                  	<!-- 인증샷 -->
										  	<label for="formFile" class="form-label">인증샷을 올려주세요 *</label>
											<input class="form-control" type="file" id="screenshot" name="screenshot">
										  </div>
												                  
						                  <div class="col-12 text-center">
						                    <!-- 등록 Button -->
						                    <button class="btn btn-outline-dark" type="submit" onclick="writeCertBrd()">
						                      	등록
						                    </button>
						                  </div>
						              	</c:when>
						              	
						              	
						              	<c:otherwise>
						              	<!-- 3. 참여자가 아닌 회원 -->
						              		<div class="col-12 col-md-6">
						                    <!-- 유저 닉네임 표시하는 란 Name -->
						                    <div class="form-group">
							                      <p class="mb-2 fs-lg fw-bold">
							                        ${user.nick }
							                      </p>
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 제목 입력란  Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewTitle">Review Title:</label>
						                      <input class="form-control form-control-sm" id="title" type="text"  placeholder="챌린지 참여자만 글을 쓸 수 있습니다" disabled="disabled">
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 인증글 입력란 Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewText">Review:</label>
						                      <textarea class="form-control form-control-sm" id="conts" rows="5" placeholder="챌린지 참여자만 글을 쓸 수 있습니다" disabled="disabled"></textarea>
						                    </div>
						                  </div>
						                  
						                  <div class="mb-3">
						                  	<!-- 인증샷 -->
										  	<label for="formFile" class="form-label">인증샷을 올려주세요 *</label>
											<input class="form-control" type="file" id="screenshot" name="screenshot">
										  </div>
												                  
						                  <div class="col-12 text-center">
						                    <!-- 등록 Button -->
						                    <button class="btn btn-outline-dark" type="submit" disabled="disabled">
						                      	등록
						                    </button>
						                  </div>
						              	</c:otherwise>
						                  
						              </c:choose>
					                </div>
					              </form>
					
					            </div>
				            </c:otherwise>
			            </c:choose>
			
			
			            <!-- 인증글 게시판 R -->
			            <div class="mt-8">
			
			              <!--  여기부터 첫번째 인증글 -->
							<c:forEach var="certBoard" items="${certBoard }" varStatus="status">
				              	<c:choose>
				              		<c:when test="${certBoard.brd_step == 0 }">
				              		<!-- 1. 원글 -->
						              <div class="review" id="review${status.index}">
						                <div class="review-body">
						                  <div class="row" id="certBoard${status.index}">
						                  	<input type="hidden" id="brd_num${status.index}"	value="${certBoard.brd_num }">
						                  	<input type="hidden" id="nick${status.index}"		value="${certBoard.nick }">
						                  	<input type="hidden" id="reg_date${status.index}"	value="${certBoard.reg_date }">
						                  	<input type="hidden" id="title${status.index}"		value="${certBoard.title }">
						                  	<input type="hidden" id="conts${status.index}"		value="${certBoard.conts }">
						                  	<input type="hidden" id="img${status.index}"		value="${certBoard.img }">
						                  	
						                  	
						                  	<div class="col-5 col-md-3 col-xl-2">
												<!-- 인증샷 Image -->
						                    	<img src="${pageContext.request.contextPath}/upload/${certBoard.img }" alt="인증샷" class="img-fluid">
						                    </div>
						                    
						                    
						                    <div class="col-12 col-md">
						                    
												<!-- Avatar -->
						                    	<div class="avatar avatar-lg">
												  <img src="../assets/img/avatars/avatar-1.jpg" alt="..." class="avatar-img rounded-circle">
												</div>
						                    
						                      <!-- Header -->
						                      <div class="row mb-6">
						                        <div class="col-12">
						                          <!-- Time -->
						                          <span class="fs-xs text-muted">
						                            ${certBoard.nick}, <time datetime="2019-07-25">${certBoard.reg_date }</time>
						                          </span>
						                        </div>
						                      </div>
						                      
						
						                      <!-- Title -->
						                      <p class="mb-2 fs-lg fw-bold">
						                        ${certBoard.title }
						                      </p>
						
						                      <!-- Text -->
						                      <p class="text-gray-500">
						                      	${certBoard.conts }
						                      </p>
						                      
						
						                      <!-- Footer -->
						                      <div class="row align-items-center">
						                      
						                        <div class="col-auto d-none d-lg-block">
							                        <p class="mb-0 fs-sm">좋아요</p>
						                        </div>
						                        
						                        <!-- Text -->
						                        <div class="col-auto me-auto">
						                        
							                        <!-- Rate -->
							                        <div class="rate">
							                          <a class="rate-item" data-toggle="vote" data-count="3" href="#" role="button">
							                            <i class="fe fe-thumbs-up"></i>
							                          </a>
							                          <a class="rate-item" data-toggle="vote" data-count="3" href="#" role="button">
							                            <i class="fe fe-thumbs-up"></i>
							                          </a>
							                        </div>
							                        
						                        </div>
						                        
						                        <div class="col-auto d-none d-lg-block">
						                          <!-- Text -->
						                          <p class="mb-0 fs-sm">Comments (${certBoard.replyCount })</p>
						                        </div>
						                        
						                        <c:choose>
						                        	<c:when test="${user.user_num == certBoard.user_num }">
						                        	<!-- 작성자 본인일 경우 -->
								                        <div class="col-auto">
								                        
								                          <!-- comment 버튼을 수정 삭제 버튼으로 바꿈 Button -->
								                          <a class="btn btn-xs btn-outline-border" 
								                          	 href="#!" 
								                          	 id="showModalButton"
								                          	 onclick="updateModalCall(${status.index})"
								                          >
															수정
								                          </a>
								                          
								                          <a class="btn btn-xs btn-outline-border" href="#!" onclick="deleteCertBrd(${status.index})">
															삭제
								                          </a>
								                          
								                        </div>
						                        	</c:when>
						                        	
						                        	<c:otherwise>
					                        			<div class="col-auto">
															<!-- Button -->	
															<a class="btn btn-xs btn-outline-border" href="#!">
																더보기
															</a>
															<!-- Button -->
															<button class="btn btn-xs btn-outline-border" data-bs-toggle="collapse" data-bs-target="#commentForm${status.index }" aria-expanded="false" aria-controls="commentForm${status.index }">
																댓글
															</button>
														</div>
						                        	</c:otherwise>
						                        </c:choose>
						                        
						                        
						                      </div>
						                    </div>
						                  </div>
						                </div>
						              </div>
					              	</c:when>
				            		<c:otherwise>
				            		<!-- 2. 댓글 Child review -->
										<div class="review">
			            					<div class="review review-child">
							                  <div class="review-body">
								                  <div class="row" id="certBoard${status.index}">
								                  	<input type="hidden" id="brd_num${status.index}"	value="${certBoard.brd_num }">
								                  	<input type="hidden" id="nick${status.index}"		value="${certBoard.nick }">
								                  	<input type="hidden" id="reg_date${status.index}"	value="${certBoard.reg_date }">
								                  	<input type="hidden" id="title${status.index}"		value="${certBoard.title }">
								                  	<input type="hidden" id="conts${status.index}"		value="${certBoard.conts }">
								                  	<input type="hidden" id="img${status.index}"		value="${certBoard.img }">
								                  	
								                  	
													<div class="col-12 col-md-auto">
								                        <!-- Avatar -->
								                        <div class="avatar avatar-xxl mb-6 mb-md-0">
								                          <span class="avatar-title rounded-circle">
								                            <i class="fa fa-user"></i>
								                          </span>
								                        </div>
													</div>
								                    
								                    
								                    
								                    <div class="col-12 col-md">
								                    
								                    
								                      <!-- Header -->
								                      <div class="row mb-6">
								                        <div class="col-12">
								                          <!-- Time -->
								                          <span class="fs-xs text-muted">
								                            ${certBoard.nick}, <time datetime="2019-07-25">${certBoard.reg_date }</time>
								                          </span>
								                        </div>
								                      </div>
								                      
								
								                      <!-- Title -->
								                      <p class="mb-2 fs-lg fw-bold">
								                        ${certBoard.title }
								                      </p>
								
								                      <!-- Text -->
								                      <p class="text-gray-500">
								                      	${certBoard.conts }
								                      </p>
								                      
								
								                      <!-- Footer -->
								                      <div class="row align-items-center">
								                      
								                      	<div class="col-auto me-auto"></div>
								                      
								                        <c:choose>
								                        	<c:when test="${user.user_num == certBoard.user_num }">
								                        	<!-- 작성자 본인일 경우 -->
										                        <div class="col-auto">
										                        
										                          <!-- comment 버튼을 수정 삭제 버튼으로 바꿈 Button -->
										                          <a class="btn btn-xs btn-outline-border" 
										                          	 href="#!" 
										                          	 id="showModalButton"
										                          	 onclick="updateModalCall(${status.index})"
										                          >
																	수정
										                          </a>
										                          
										                          <a class="btn btn-xs btn-outline-border" href="#!" onclick="deleteCertBrd(${status.index})">
																	삭제
										                          </a>
										                          
										                        </div>
								                        	</c:when>
								                        	
								                        </c:choose>
								                        
								                        
								                      </div>
								                    </div>
								                  </div>
								                </div>
											</div>	
										</div>
					                </c:otherwise>
				            	</c:choose>		
							
			              	
				              
				              <!-- 새 댓글 -->
					            <div class="collapse" id="commentForm${status.index }">
					
					              <!-- Divider -->
					              <hr class="my-8">
					
					
					
					              <!-- 인증 댓글 쓰기 Form -->
					              <form id="certCommentForm" action="/commentInsert" method="post" onsubmit="return commentInsertchk(this)">
					                <div class="row">
					                  
						              <c:choose>
						              	<c:when test="${chgrYN == 1 }">
						              	<!-- 1. 참가자일 경우 -->
						                  <div class="col-12 col-md-6">
						                  	<input type="hidden" name="chg_id"		value="${chg.chg_id }">
						                  	<input type="hidden" name="user_num"	value="${user.user_num }">
						                  	<input type="hidden" name="brd_num"		value="${certBoard.brd_num }">
						                    <!-- 유저 닉네임 표시하는 란 Name -->
						                    <div class="form-group">
							                      <p class="mb-2 fs-lg fw-bold">
							                        ${user.nick }
							                      </p>
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 제목 입력란  Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewTitle">CertBrd Title:</label>
						                      <input class="form-control form-control-sm" id="commentTitle" name="title" type="text" placeholder="제목을 작성해주세요 *" >
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 댓글 입력란 Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewText">CertBrd:</label>
						                      <textarea class="form-control form-control-sm" id="commentConts" name="conts" rows="5" placeholder="댓글을 작성해주세요 *" ></textarea>
						                    </div>
						                  </div>
						                  
												                  
						                  <div class="col-12 text-center">
						                    <!-- 등록 Button -->
						                    <button class="btn btn-outline-dark" type="submit" onclick="commentCertBrd()">
						                      	등록
						                    </button>
						                  </div>
						              	</c:when>
						              	
						              	<c:when test="${user == null }">
						              	<!-- 2. 비로그인 -->
						              		<div class="col-12 col-md-6">
						                    <!-- 유저 닉네임 표시하는 란 Name -->
						                    <div class="form-group">
							                      <p class="mb-2 fs-lg fw-bold">
							                        ${user.nick }
							                      </p>
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 제목 입력란  Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewTitle">Review Title:</label>
						                      <input class="form-control form-control-sm" type="text" name="title"  placeholder="로그인 해주세요" disabled="disabled">
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 댓글 입력란 Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewText">Review:</label>
						                      <textarea class="form-control form-control-sm" rows="5" name="conts" placeholder="로그인 해주세요" disabled="disabled"></textarea>
						                    </div>
						                  </div>
						                  
												                  
						                  <div class="col-12 text-center">
						                    <!-- 등록 Button -->
						                    <button class="btn btn-outline-dark" type="submit" onclick="commentCertBrd()">
						                      	등록
						                    </button>
						                  </div>
						              	</c:when>
						              	
						              	<c:otherwise>
						              	<!-- 3. 참여자가 아닌 회원 -->
						              		<div class="col-12 col-md-6">
						                    <!-- 유저 닉네임 표시하는 란 Name -->
						                    <div class="form-group">
							                      <p class="mb-2 fs-lg fw-bold">
							                        ${user.nick }
							                      </p>
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 제목 입력란  Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewTitle">Review Title:</label>
						                      <input class="form-control form-control-sm" type="text" name="title"  placeholder="챌린지 참여자만 글을 쓸 수 있습니다" disabled="disabled">
						                    </div>
						                  </div>
						                  
						                  <div class="col-12">
						                    <!-- 댓글 입력란 Name -->
						                    <div class="form-group">
						                      <label class="visually-hidden" for="reviewText">Review:</label>
						                      <textarea class="form-control form-control-sm" rows="5" name="conts" placeholder="챌린지 참여자만 글을 쓸 수 있습니다" disabled="disabled"></textarea>
						                    </div>
						                  </div>
						                  
												                  
						                  <div class="col-12 text-center">
						                    <!-- 등록 Button -->
						                    <button class="btn btn-outline-dark" type="submit" disabled="disabled">
						                      	등록
						                    </button>
						                  </div>
						              	</c:otherwise>
						                  
						              </c:choose>
					                </div>
					              </form>
					
					            </div>
				            
							</c:forEach>
			            </div>
			            
			            
			            <!-- 인증글 게시판 U: 수정하기 모달 창 Product -->
					    <div class="modal fade" id="modalUpdateCertBrdForm" tabindex="-1" role="dialog" aria-hidden="true"><!--  -->
					      <div class="modal-dialog modal-dialog-centered modal-xl" role="document"><!--  -->
					        <div class="modal-content"><!--  -->
					    
					          <!-- Close -->
					          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
					            <i class="fe fe-x" aria-hidden="true"></i>
					          </button>
					    
					          <!-- Content -->
					          <div class="container-fluid px-xl-0"><!--  -->
					            <div class="row align-items-center mx-xl-0"><!--  -->
					              <div class="col-12 col-lg-6 col-xl-5 py-4 py-xl-0 px-xl-0"><!--  -->
					    
					                <!-- Image 수정 모달창 인증샷 -->
					                <img class="img-fluid" alt="수정 모달창 인증샷" id="modalImage">
					    
					                <!-- Button -->
					                <!-- <a class="btn btn-sm w-100 btn-primary" href="./product.html">
					                  More Product Info <i class="fe fe-info ms-2"></i>
					                </a> -->
					    
					              </div><!-- <div class="col-12 col-lg-6 col-xl-5 py-4 py-xl-0 px-xl-0"> -->
					              <div class="col-12 col-lg-6 col-xl-7 py-9 px-md-9"><!--  -->
					    
		                  
		
					                <!-- 수정 Form -->
						            <form action="updateCertBrd" method="post">
						              <input type="hidden" name="brd_num" id="editBrd_num">
						              <input type="hidden" name="nick" id="editNick">
						                
										<div class="avatar avatar-xl">
										  <img src="../assets/img/avatars/avatar-1.jpg" alt="..." class="avatar-img rounded-circle">
										</div>
					                      
					                      
						                <div class="col-12 col-md-6"><!--  -->
					                    <!-- 유저 닉네임 표시하는 란 Name -->
					                    <div class="form-group"><!--  -->
						                      <p class="mb-2 fs-lg fw-bold" id="displayNick">
						                      </p>
					                    </div>
						                </div>
			                    
				                      <!-- Header -->
					                      <div class="row mb-6"><!--  -->
					                        <div class="col-12"><!--  -->
					                          <!-- Time -->
					                          <span class="fs-xs text-muted">
					                            <time datetime="2019-07-25" id="displayReg_date"></time>
					                          </span>
					                        </div>
					                      </div>
						                
	
			        					<div class="col-12"><!--  -->
						                  <!-- Email -->
						                  <div class="form-group"><!--  -->
						                    <label class="form-label" for="accountEmail">
						                     	 제목 *
						                    </label>
						                      <input class="form-control form-control-sm" id="editTitle" name="title" type="text" placeholder="제목을 작성해주세요 *" required>
						                  </div>
						                </div>
		
						                <div class="col-12">
						                  <!-- Email -->
						                  <div class="form-group">
						                    <label class="form-label" for="accountEmail">
						                     	 인증글 *
						                    </label>
						                      <textarea class="form-control form-control-sm" id="editConts" name="conts" rows="4" placeholder="인증글을 작성해주세요 *" required></textarea>
						                  </div>
						                </div>
						                
						                <div class="row">
						                  <div class="col-12 text-center">
						                  	<div class="form-group mb-7">
						                  		<span id="imgOroot">${pageContext.request.contextPath}/upload/<span id="editImage"></span></span>
						                  		<input type="file" name="file1" style="display:none;" id="fileInput" disabled="disabled">
						                  		<button type="button" onclick="fileUpdate()">파일 변경</button>
											</div>
						                    <!-- 인증 글쓰기에서 가져온 글 수정 Form 등록 Button -->
						                    <!-- onclick(보류) 대신 form으로 작동시킴 --> 
						                    <button class="btn btn-outline-dark" type="submit" onclick="updateCertBoard()">
						                      	수정하기
						                    </button>
						                  </div>
						                </div>
						                
						            </form>
								
								
					    
					              </div><!-- <div class="col-12 col-lg-6 col-xl-7 py-9 px-md-9"> -->
					            </div><!-- <div class="row align-items-center mx-xl-0"> -->
					          </div><!-- <div class="container-fluid px-xl-0"> -->
					    
					        </div><!-- <div class="modal-content"> -->
					      </div><!-- <div class="modal-dialog modal-dialog-centered modal-xl" role="document"> -->
					    </div><!-- <div class="modal fade" id="modalUpdateCertBrdForm" tabindex="-1" role="dialog" aria-hidden="true"> -->
					    
					    
			            <!-- Pagination		임시로 chg_id 넣어둠 -->
			            <nav class="d-flex justify-content-center mt-9">
			              <ul class="pagination pagination-sm text-gray-400">
			              
			              <c:if test="${certBrdPage.startPage > certBrdPage.pageBlock }">
			                <li class="page-item">
			                  <a class="page-link page-link-arrow" href="chgDetail?chg_id=${chg.chg_id}&currentPage=${certBrdPage.startPage-certBrdPage.pageBlock }">
			                    <i class="fa fa-caret-left"></i>
			                  </a>
			                </li>
			              </c:if>
			              
			              <c:forEach var="i" begin="${certBrdPage.startPage }" end="${certBrdPage.endPage }">
			                <li class="page-item active">
			                  <a class="page-link" href="chgDetail?chg_id=${chg.chg_id}&currentPage=${i}">${i}</a>
			                </li>
			              </c:forEach>
			              
			              <c:if test="${certBrdPage.endPage < certBrdPage.totalPage }">
			                <li class="page-item">
			                  <a class="page-link page-link-arrow" href="chgDetail?chg_id=${chg.chg_id}&currentPage=${certBrdPage.startPage+certBrdPage.pageBlock }">
			                    <i class="fa fa-caret-left"></i>
			                  </a>
			                </li>
			              </c:if>
			              </ul>
			            </nav>
			            <!-- Body: Form -->
						<div class="offcanvas-body">
					        <form>
					          <div class="input-group input-group-merge">
					            <input class="form-control" type="search" placeholder="Search">
					            <div class="input-group-append">
					              <button class="btn btn-outline-border" type="submit">
					                <i class="fe fe-search"></i>
					              </button>
					            </div>
					          </div>
					        </form>
						</div>
			            </div>
			            </div>
			            </div>
            
            
			  <!-- 소세지들 -->
			  <!-- 스크롤 내릴 때 내용이 나중에 나타나는 모션? 추가할 예정 -->
              <div class="tab-pane fade" id="ssjFriendsTab">


                <div class="row justify-content-center py-9">
                  <div class="col-12 col-lg-10 col-xl-8">
                    <div class="row">
                      <div class="col-12">

                        <!-- content -->
						<div class="review">
							<!-- Body -->
							<c:forEach var="ssj" items="${listSsj}" varStatus="status">
								<div class="review-body">
									<div class="row" id="ssj${status.index}">
										<input type="hidden" id="ssjImg${status.index}" value="${ssj.img}">
										<input type="hidden" id="ssjNick${status.index}" value="${ssj.nick}">
										<input type="hidden" id="ssjUserNum${status.index}" value="${ssj.user_num}">
										<!-- profile -->
										<div class="col-12 col-md-auto">
											<div class="avatar avatar-xxl mb-6 mb-md-0">
												<span class="avatar-title rounded-circle">
													<img src="${ssj.img}" alt="profile" class="avatar-title rounded-circle">
												</span>
											</div>
										</div>
						
										<!-- nick -->
										<div class="col-12 col-md">
											<div class="row mb-6">
												<div class="col-12">
													<a href="#" data-bs-toggle="modal" onclick="userInfoModal(${status.index})">
														<span>${ssj.nick}</span>
													</a>
													<!-- 글씨 빨간색으로 나옴 -> 검은색으로 나오게 수정해야함 -->
												</div>
											</div>
										</div>
						
										<!-- reg_date & fork -->
										<div class="col-12 col-md">
											<!-- reg_date -->
											<div class="row mb-6">
												<div class="col-12">
						
													<!-- 오늘 날짜 -->
													<jsp:useBean id="javaDate" class="java.util.Date" />
													<fmt:formatDate var="nowDateFd" value="${javaDate }" pattern="yyyy-MM-dd" /><br>
						
													<!-- 마지막 인증 게시판 작성일자 -->
													<fmt:formatDate var="lastRegDateFd" value="${ssj.brd_reg_date }" pattern="yyyy-MM-dd" /><br>
						
													<c:if test="${ssj.brd_reg_date != null }">
						
														<fmt:parseDate var="nowDatePd" value="${nowDateFd }" pattern="yyyy-MM-dd" />
														<fmt:parseDate var="lastRegDatePd" value="${lastRegDateFd }" pattern="yyyy-MM-dd" />
						
														<fmt:parseNumber var="nowDatePn" value="${nowDatePd.time/(1000*60*60*24) }"
															integerOnly="true" />
														<fmt:parseNumber var="lastRegDatePn" value="${lastRegDatePd.time/(1000*60*60*24) }"
															integerOnly="true" />
						
														<c:set var="dDay" value="${nowDatePn - lastRegDatePn}" />
						
														<span>
															${dDay }일 전
														</span>
													</c:if>
						
												</div>
											</div>
						
											<c:choose>
												<c:when test="${sessionScope.user_num != null}">
													<!-- 로그인 한 상태 -->
													<!-- fork -->
													<div class="row align-items-center">
														<div class="col-auto">
															<!-- Button -->
															<a class="btn btn-xs btn-outline-border" 
																href="#!" 
																onclick="forkModalCall(${status.index})">찌르기</a>
														</div>
													</div>
												</c:when>
						
												<c:when test="${sessionScope.user_num == null}">
													<!-- 로그인 안 한 상태 -->
													<!-- loginForm으로 이동 -->
													<div class="row align-items-center">
														<div class="col-auto">
															<!-- Button -->
															<a class="btn btn-xs btn-outline-border" href="/loginForm">찌르기</a>
														</div>
													</div>
												</c:when>
						
											</c:choose>
										</div>
						
									</div>
						
								</div>
						
							</c:forEach>
						
							<!-- nick 클릭 시 나타나는 modal -->
							<!-- Modal -->
							<div class="modal fade" id="userShowModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
											<div class="col-12 col-md-auto">
												<div class="avatar avatar-xxl mb-6 mb-md-0">
													<span class="avatar-title rounded-circle">
														<img src="" alt="profile" class="avatar-title rounded-circle" id="displayUserImg">
														<!-- img 불러와지는지 확인해야함 -->
													</span>
												</div>
											</div>
											<div class="col-12 col-md">
												<div class="row mb-6">
													<div class="col-12">
														<p id="displayUserNick"></p>
													</div>
												</div>
											</div>
										</div>
						
										<div class="modal-footer">
											
											<button type="button" class="btn btn-danger" name="user_num" onclick="following(${status.index})" id="follow">팔로우</button>
											<form id="followingForm">
												<input type="hidden" id="inputUserNum1" name="user_num">
											</form>
											
											<button type="button" class="btn btn-info" onclick="sendMessage(${status.index})">쪽지보내기</button>
											<form id="sendMessageForm">
												<input type="hidden" id="inputUserNum2" name="user_num">
											</form>

										</div>
									</div>
								</div>
							</div>
						

							<!-- BG 찌르기 fork 기능 모달창	 Wait List 를 참고함 -->
							<div class="modal fade" id="modalfork" tabindex="-1" role="dialog" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<input type="hidden" name="ssjUserNum" 			id="ssjUserNum">
										<input type="hidden" name="sendMailUser_num"	id="sendMailUser_num">
						
										<!-- Close -->
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
											<i class="fe fe-x" aria-hidden="true"></i>
										</button>
						
										<!-- Header-->
										<div class="modal-header lh-fixed fs-lg">
											<strong class="mx-auto">찌르기</strong>
										</div>
						
										<!-- Body -->
										<div class="modal-body">
										
											<!-- <div class="row mb-6"> -->
												<!-- <div class="col-12 col-md-3"> -->
													<!-- 아바타 부분 보류 Image -->
													<!-- <a href="./product.html">
														<img class="img-fluid mb-7 mb-md-0" src="./assets/img/products/product-6.jpg" alt="...">
													</a>
												</div> -->
												
												<!-- 보류 칸 <div class="col-12 col-md-9"> -->
													<!-- Label -->
													<!-- <p>
														<a class="fw-bold text-body" href="./product.html">Cotton floral print Dress</a>
													</p>
												</div> -->
											<!-- </div> -->
											
											
											<div class="row">
												<div class="col-12">
													<!-- Text -->
													<p class="fs-sm text-center text-charcol-400">
														인증 활동이 뜸한 참가자들에게 격려 메일을 보내보세요!
													</p>
												</div>
											</div>
											
											
											<div class="row gx-5 mb-2">
												<!-- Form group -->
												<div class="form-group">
													<textarea class="form-control form-control-sm" id="cheerUpMsg" name="conts" rows="4" required></textarea>
												</div>
											</div>
											
											
											<div class="row">
												<div class="col-12 text-center">
													<!-- Button -->
													<button class="btn btn-dark" type="submit" onclick="sendMail()">메일 보내기</button>
												</div>
											</div>
											
										</div>
						
									</div>
						
								</div>
							</div>
						
						</div>

                      </div>
                      
                    </div>
                  </div>
                </div>


              </div>
            
            
            <!-- jh 후기글   -->
            <input type="hidden" name="reviewCurrentPage" id="reviewCurrentPage" value="${tap}">  
            <!-- stateCtn 대신 그냥 공통 코드 103으로 해도 될듯 -->
            <c:choose>
            	<c:when test="${chg.stateCtn == '종료'}">
   	              <div class="tab-pane fade" id="reviewTab">
	                <div class="row justify-content-center py-9">
	                  <div class="col-12 col-lg-10 col-xl-8">
	                  	 <!-- Heading -->
				            <h4 class="mb-10 text-center">후기 게시판</h4>
				            
				            
				              	<c:choose>
					              	<c:when test="${chgrYN == 1 }">
						              	<!-- 참가자인 경우 -->
							            <!-- Header -->
							            <div class="row align-items-center">
							              
							              <div class="col-12 col-md text-md">
							
							                <!-- Count -->
							                <strong class="fs-sm ms-2">총 리뷰수 : ${reviewTotal }</strong>
							
							              </div>
							              
			   				              <div class="col-12 col-md-auto">
							
							                <!-- Button -->
							                <a class="btn btn-sm btn-dark" data-bs-toggle="collapse" href="#reviewForm">
							                  	후기 등록하기
							                </a>
							
							              </div>
							            </div>
						            
	
					              		<!-- New Review -->
							            <div class="collapse" id="reviewForm">
							
							              <!-- Divider -->
							              <hr class="my-8">
							              
							              <div class="col-12 col-md-auto">
							
							                <strong class="fs-sm ms-2">${user.nick }님 후기를 입력해 주세요!</strong><p>
							               		
							              </div>
							
							              <!-- Form -->
							              <form action="/reviewPost" method="post"  enctype="multipart/form-data">
							              	<input type="hidden" 	name="chg_id" 		value="${chg.chg_id}" >
							              	<input type="hidden" 	name="user_num" 	value="${user.user_num}" >
							                <div class="row">
							 
							                  <div class="col-12">
							
							                    <!-- Name -->
							                    <div class="form-group">
							                      <label class="visually-hidden" for="reviewTitle">Review Title:</label>
							                      <input class="form-control form-control-sm" id="reviewTitle" type="text" name="title" placeholder="Review Title *" required>
							                    </div>
							
							                  </div>
							                  <div class="col-12">
							
							                    <!-- Name -->
							                    <div class="form-group">
							                      <label class="visually-hidden" for="reviewText">Review:</label>
							                      <textarea class="form-control form-control-sm" id="reviewText" rows="5" name="conts" placeholder="Review *" required></textarea>
							                    </div>
							
							                  </div>
							                  
							                  <div class="input-group mb-3">
												  <input type="file" class="form-control" name="file" id="inputGroupFile">
												  <label class="input-group-text" for="inputGroupFile">이미지 업로드</label>
											  </div>
							                  
							                  <div class="col-12 text-center">
							
							                    <!-- Button -->
							                    <button class="btn btn-outline-dark" type="submit">
							                      	등록
							                    </button>
							                    <button class="btn btn-outline-secondary" type="reset">
							                      	취소
							                    </button>
							
							                  </div>
							                </div>
							              </form>
							
							            </div>
					              	</c:when>
					              	
					              	<c:when test="${user == null  }">
						              	<!-- 로그인 전인 경우 -->
						              	<!-- Header -->
								            <div class="row align-items-center">
								              
								              <div class="col-12 col-md text-md">
								
								                <!-- Count -->
								                <strong class="fs-sm ms-2">총 리뷰수 : ${reviewTotal }</strong>
								
								              </div>
								              
				   				              <div class="col-12 col-md-auto">
								
								                <!-- Button -->
								                <a class="btn btn-sm btn-dark"  href="/reviewPost">
								                  Write Review
								                </a>
								
								              </div>
								            </div>
					              	
					              	</c:when>
					              	
					              	<c:otherwise>
						              	<!-- 로그인 했지만 참가자 아닌 경우 -->
						              	<div class="row align-items-center">
						              
							              <div class="col-12 col-md text-md">
							
							                <!-- Count -->
							                <strong class="fs-sm ms-2">총 리뷰수 : ${reviewTotal }</strong>
							
							              </div>
							              
			   				              <div class="col-12 col-md-auto">
							
							                <!-- Button -->
							                <a class="btn btn-sm btn-dark" data-bs-toggle="collapse" href="#reviewForm">
							                  Write Review
							                </a>
							
							              </div>
						            	</div>
					            
	
					              		<!-- New Review -->
							            <div class="collapse" id="reviewForm">
							
							              <!-- Divider -->
							              <hr class="my-8">
							              
							              <div class="col-12 col-md-auto">
							
							                <strong class="fs-sm ms-2">${user.nick }님 챌린지 참가자만 후기를 남길 수 있습니다! 다음엔 꼭 참가해 주세요!</strong><p>
							               		
							              </div>
							
							              <!-- Form -->
							              <form action="/reviewInsert">
							              	<input type="hidden" 	name="chg_id" 		value="${chg.chg_id}" >
							              	<input type="hidden" 	name="user_num" 	value="${user.user_num}" >
							                <div class="row">
							 
							                  <div class="col-12">
							
							                    <!-- Name -->
							                    <div class="form-group">
							                      <label class="visually-hidden" for="reviewTitle">Review Title:</label>
							                      <input class="form-control form-control-sm" id="reviewTitle" type="text" name="title" placeholder="챌린지 참가자만 후기를 남길 수 있습니다!" disabled>
							                    </div>
							
							                  </div>
							                  <div class="col-12">
							
							                    <!-- Name -->
							                    <div class="form-group">
							                      <label class="visually-hidden" for="reviewText">Review:</label>
							                      <textarea class="form-control form-control-sm" id="reviewText" rows="5" name="conts" placeholder="챌린지 참가자만 후기를 남길 수 있습니다!" disabled></textarea>
							                    </div>
							
							                  </div>
							                  
							                  <div class="input-group mb-3">
												  <input type="file" class="form-control" name="file" id="inputGroupFile02" disabled>
												  <label class="input-group-text" for="inputGroupFile02">Upload</label>
											  </div>
							                  
							                  <div class="col-12 text-center">
							
							                    <!-- Button -->
							                    <button class="btn btn-outline-dark" type="submit" disabled>
							                      Post Review
							                    </button>
							
							                  </div>
							                </div>
							              </form>
							
							            </div>
					              	</c:otherwise>
					              </c:choose>
	                  	
			                    <!-- Table -->
			                    <div class="table-responsive">     
	                    			<c:set var="num" value="${reviewPage.total-reviewPage.start+1 }"></c:set>
									<table class="table table-bordered table-sm table-hover" id="reviewTable" border="1">
									       <thead>
									         <tr>
									           <th>글번호</th>
									           <th>제목</th>
									           <th>작성자</th>
									           <th>조회수</th>
									           <th>작성일</th>
									         </tr>
									       </thead>
									       <tbody>
									         <c:forEach var="review" items="${chgReviewList}">
									          <tr>
									            <td>${num }</td>
									            <td><a href="/reviewContent?brd_num=${review.brd_num}&chg_id=${chg.chg_id}">${review.title } [${review.replyCount }]</a></td>
									            <td>${review.nick }</td>
									            <td>${review.view_cnt }</td>
									            <td><fmt:formatDate value="${review.reg_date }" pattern="yyyy-MM-dd"/></td>
									          </tr>
				          					<c:set var="num" value="${num -1 }"></c:set>
									        </c:forEach>
									       </tbody>
								     </table>
		                    	</div>
		                    	
	   		            		<!-- Pagination -->
								<nav class="d-flex justify-content-center mt-9">
								  <ul class="pagination pagination-sm text-gray-400">
								  <c:if test="${reviewPage.startPage > reviewPage.pageBlock}">
								    <li class="page-item">
								      <a class="page-link page-link-arrow" href="chgDetail?currentPage=${reviewPage.startPage-reviewPage.pageBlock }&chg_id=${chg.chg_id}&tap=3">
								        <i class="fa fa-caret-left"></i>
								      </a>
					              </c:if>
								    </li>
						          <c:forEach var="i" begin="${reviewPage.startPage }" end="${reviewPage.endPage }">
								    <li class="page-item active">
								      <a class="page-link" href="chgDetail?currentPage=${i}&chg_id=${chg.chg_id}&tap=3">${i}</a>
								    </li>
						          </c:forEach>
						          <c:if test="${reviewPage.endPage < reviewPage.totalPage }">
								    <li class="page-item">
								      <a class="page-link page-link-arrow" href="chgDetail?currentPage=${reviewPage.startPage+reviewPage.pageBlock }&chg_id=${chg.chg_id}&tap=3">
								        <i class="fa fa-caret-right"></i>
								      </a>
								    </li>
						          </c:if>
								  </ul>
								</nav>

                  			</div>
               			</div>
              		</div>
           		</c:when>
            
            	<c:otherwise>
            	<div class="tab-pane fade" id="reviewTab">
	                <div class="row justify-content-center py-9" >
	                  <div class="col-12 col-lg-10 col-xl-8">
            			<h5>챌린지가 종료된 후 후기를 써주세요</h5>
            		  </div>
            		</div>
            	</div>
            	</c:otherwise>
            </c:choose>
            
					
            </div>

          </div>
        </div>
      </div>
    </section>

</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>