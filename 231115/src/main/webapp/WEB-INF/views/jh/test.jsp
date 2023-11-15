<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .list-group-horizontal-sm .list-group-item {
        border: none; /* 테두리 없애기 */
    }
</style>
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	// yr 작성
	function cJoinTest() {
		
//	function cJoinTest(p_num, p_id) {
	
		var sendData = $('#cJoinForm').serialize();	// user_num=?&chg_id=?
		location.href="chgJoinPro?" + sendData;
		
		alert("신청완료");
		/* if(${result} > 0) {
			alert("이게 되나?");
		} */

/*   $.ajax(
      {
    	alert("아작스가 아작이 나쓰");
    	
        url: "/chgJoinPro",
        data: {user_num : p_num, chg_id : p_id},
        dataType: 'text',
        success: function (data) {
          alert('chgJoinPro data -> ' + data);
          if (data == '1') {
            alert('신청 완료');
            location.href = "jhChgDetail?chg_id=" + chg_id;
            $('#o_status').load(location.href + ' #o_status');
          }
        }
      }
    ) 
	} */
	}
	
	
	
	
	// 자동 스크롤 이동
	$(document).ready(function(){
		const offset = $("#reviewTab").offset();
		$('html, body').animate({scrollTop: offset.top}, 0);
	});
</script> 
</head>
<body>
<h1>테스트</h1>
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
                      <img src="assets/img/chgDfaultImg.png" alt="${chg.title }" class="card-img-top" onerror="assets/img/chgDfaultImg.png">
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
                    <li class="list-group-item"><fmt:formatDate value="${chg.start_date }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${chg.end_date }" pattern="yyyy-MM-dd"/> </li>
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
                      <div class="col-12 col-lg">
                        <!-- 참여하기 -->
                        <!-- YR 작업 중 -->
                        <c:choose>
                        
                          <c:when test="${sessionScope.user_num != null}">
                            <!-- 로그인 한 상태 -->
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                              참여하기
                            </button>
                        
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                              <div class="modal-dialog">
                        
                                <c:choose>
                        
                                  <c:when test="${chg.chg_capacity == chgrParti }">
                                    <!-- 참여 정원 = 참가 인원 -->
                                    <div class="modal-content">
                                      <div class="modal-body">
                                        <p>참여인원이 마감되었습니다</p>
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">취소하기</button>
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
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">취소하기</button>
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
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">취소하기</button>
									<%--    <button type="button" class="btn btn-danger" onclick="cJoinTest(${user.user_num}, ${chg.chg_id})">참여하기</button> --%>
                                            <button type="button" class="btn btn-danger" onclick="cJoinTest()">참여하기</button>
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
                            <button type="button" class="btn btn-danger" onclick="location.href='/loginForm'">
                              참여하기
                            </button>
                          </c:when>
                        
                        </c:choose>
                        
                        
                        
                        
                        
                        

                      </div>




                      <!-- 찜하기 -->
                      <div class="col-12 col-lg-auto">

                        <!-- Wishlist -->
                        <button class="btn btn-outline-dark w-100 mb-2" data-toggle="button">
                          	챌린지 찜 <i class="fe fe-heart ms-2"></i>
                        </button>

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
                </form>

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
              <a class="nav-link" data-bs-toggle="tab" href="#descriptionTab">
               	 챌린지 소개
              </a>
              <a class="nav-link" data-bs-toggle="tab" href="/certBoard?chg_id="+"${chg.chg_id }">
                             인증 게시판
              </a>
              <a class="nav-link" data-bs-toggle="tab" href="/ssjFriends?chg_id="+"${chg.chg_id }">
                             소세지들
              </a>
              
              <!-- 일단 기본 활성화 상태로 두었다가 시간 남으면 챌린지 종료되면 활성화 되게 하기  -->
              <a class="nav-link active" data-bs-toggle="tab"onclick="location.href='/reviewTab?chg_id=${chg.chg_id }'">
                             후기 게시판
              </a>
            </div>
            
              <div class="tab-pane fade" id="reviewTab">
                <div class="row justify-content-center py-9">
                  <div class="col-12 col-lg-10 col-xl-8">

                    <!-- Table -->
                    <div class="table-responsive">            
						<!-- 글번호인 ROWNUM rn을 역순으로 출력하고 싶은데 어떻게? -->
						<table class="table table-bordered table-sm table-hover" border="1">
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
						            <td>${review.rn }</td>
						            <td>${review.title }</td>
						            <td>${review.nick }</td>
						            <td>${review.view_cnt }</td>
						            <td><fmt:formatDate value="${review.reg_date }" pattern="yyyy-MM-dd"/></td>
						          </tr>
						         </c:forEach>
						       </tbody>
						     </table>
</body>
</html>