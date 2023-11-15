<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header4.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  /* 테이블을 가운데 정렬하고 화면 너비의 80%를 차지하도록 설정합니다. */
  .card {
    margin: 0 auto;
    width: 80%;
  }
  

</style>
<script type="text/javascript">
	function replyUpdate(${reply.brd_num}){
		/* 아작스 하는 중 함수형태랑 파라미터 이게 맞는지 확인하고 시작하기 */
		
	}
	
	/* 댓글 공백만 있는 경우 체크 */
	function replyInsertChk(form){
		form.conts.value = form.conts.value.trim();
		
		/* 댓글 미입력시 체크 */
		if(form.conts.value.length == 0 ){
			alert('댓글을 입력해 주세요!');
			form.conts.focus();
			return false;
		} 
		/* 댓글 입력시 인서트 실행 */
		return true;
	} 
	
	/* 댓글 삭제전 삭제여부 체크 */
	function replyDelete(ori_brd_num, rep_brd_num, chg_id) {
        var confirmMessage = "댓글을 삭제하시겠습니까?";
        if (confirm(confirmMessage)) {
            location.href = '/replyDelete?ori_brd_num=' + ori_brd_num + '&rep_brd_num=' + rep_brd_num + '&chg_id=' + chg_id;
   		}
	}
	
/*     
 * 왜 이것만 있으면 댓글쓰기에 대한 자바스크립트가 실행이 안되지?*/
 	/* $(document).ready(function() {
        var delResult = ${delResult};
          if (delResult != 1) {
              // 댓글이 삭제되었다는 alert 메시지
              alert('댓글이 삭제되었습니다.');
          }
      });  */
      
    /* 이건 왜 안됨? 제이쿼리 떄문에 버튼 안먹힘*/
     	$(document).ready(function() {
	        var flag = $("#updateFlag").val();
	        if (flag == 'flag') {
					var targetElement = $('#reviewReplyUpdate');
					if(targetElement.length > 0) {
						 $('html, body').animate({
			                    scrollTop: targetElement.offset().top -400
			                }, 1000);
					}
	        }
	        
	        var result = $("#result").val();
	        if (result != 0){
	        	alert('댓글 변경이 완료되었습니다.');
	        }
      }); 
	
      
      function updateModal(){
    	  
    	  $('#updateFormModal').modal('show')
    	  
    	  
      }
</script>
</head>
<body>

 <!-- MODALS -->
    <!-- Newsletter: Horizontal -->
    <div class="modal fade" id="updateFormModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
    
          <!-- Close -->
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            <i class="fe fe-x" aria-hidden="true"></i>
          </button>
    
          <!-- Content -->
          <div class="row gx-0">
            
            <div class="col-12 col-lg-10 d-flex flex-column px-md-8 mx-auto " >
    
              <!-- Body -->
              <div class="modal-body my-auto py-10">
    
    			<h4>${user.nick}</h4>
                <!-- Form -->
                <form action="reviewUpdate">
                  <div class="row gx-5">
                    <div class="col">
						<input type="hidden" 	name="user_num" 	value="${user.user_num}" >
						<input type="hidden" 	name="brd_num" 		value="${reviewContent.brd_num}" >
    	
						<!-- Input -->
						<div class="col-12">
							<input class="form-control form-control-sm" id="reviewTitle" type="text" name="title" value="${reviewContent.title }" required><p>
						</div>
						
						<div class="form-group">
							<label class="visually-hidden" for="reviewText">Review:</label>
							<textarea class="form-control form-control-sm" id="reviewText" rows="5" name="conts"  required>${reviewContent.conts}</textarea>
						</div>
						
						<div class="input-group mb-3">
							<input type="file" class="form-control" name="file" id="inputGroupFile02">
							<label class="input-group-text" for="inputGroupFile02">이미지 업로드</label>
						</div>
                    </div>
                  </div>
 					<div class="col-12 text-center">
    
         
				       <button class="btn btn-outline-dark" type="submit">수정</button>
	                   <button class="btn btn-outline-secondary" type="reset">취소</button>
                    </div>
                </form>
    
              </div>
    
            </div>
          </div>
    
        </div>
    
      </div>
    </div>
    

















<input type="hidden" name="updateFlag" id="updateFlag" value="${flag }">
<input type="hidden" name="result" id="result" value="${result }">
<!-- 글쓴이일 경우 수정, 삭제 버튼 활성화 -->

<!-- 버튼 위치 조정하기 -->
<div class="col-auto">
	<c:if test="${user.user_num == reviewContent.user_num }">
		<button  class="btn btn-xs btn-outline-border btn-danger" type="button" id="showUpdateModalBtn" onclick="updateModal()" >수정</button>
<%-- 		<button  class="btn btn-xs btn-outline-border btn-danger" type="button"  onclick="location.href='reviewUpdateForm?brd_num=${reviewContent.brd_num}'" >수정</button> --%>
		<button  class="btn btn-xs btn-outline-border btn-dark" type="button"  onclick="location.href='reviewDelete?brd_num=${reviewContent.brd_num}'" >삭제</button>
	</c:if>
	<button  class="btn btn-xs btn-outline-border" type="button"  onclick="location.href='chgDetail?chg_id=${chg_id}&tap=3'" >목록</button>
</div>

<div class="card mb-3">
  	
  	
	<!-- 후기 글 내용 -->
	<div class="card-body">

	  <h3 class="card-title">${reviewContent.title }</h3>
	  <h6 class="card-subtitle mb-2 text-muted">${reviewContent.nick }${result }</h6>
		 <c:choose>
		    <c:when test="${empty reviewContent.img}">
				<img src="assets/img/chgDfaultImg.png" alt="이미지가 없습니다" style="max-width: 700px; max-height: 600px; width: auto; height: auto;">
		    </c:when>
		    <c:otherwise>
				 <img src="${pageContext.request.contextPath}/upload/${reviewContent.img}" class="card-img-top" alt="이미지 업로드에 실패했습니다." style="max-width: 700px; max-height: 600px; width: auto; height: auto;">
		    </c:otherwise>
		</c:choose>


	  <p class="card-text">${reviewContent.conts }</p>
	  <p class="card-text"><small class="text-muted"><fmt:formatDate value="${reviewContent.reg_date }" pattern="yyyy-MM-dd"/></small></p>
	  <p class="card-text"><small class="text-muted">조회수 : ${reviewContent.view_cnt }</small>
	  <p class="card-text"><small class="text-muted">댓글수 : ${reviewContent.replyCount } </small>
	 </div>
	
     <!-- 댓글 쓰기 -->
     <div class="modal-body py-9">
       <!-- Form -->
       <form action="/replyInsert" method="post" onsubmit="return replyInsertChk(this)">
         <div class="row gx-5">
         	<c:choose>
         	  <c:when test="${chgrYN == 1 }">
	            <!-- 참여자일 경우 -->
	   			<div class="col">
	   				<input type="hidden" name="chg_id" value="${chg_id}">
	   				<input type="hidden" name="brd_num" value="${reviewContent.brd_num}">
	   				<input type="hidden" name="user_num" value="${user.user_num}">
	   				<input class="form-control form-control-sm" id="reviewReply" name="conts" type="text"  maxlength="100" placeholder="${user.nick }님 댓글을 남겨주세요!">
	   				
	   				
	 			</div>
	 			
	            <div class="col-auto">
					<!-- Button -->
					<button class="btn btn-sm btn-dark" type="submit" id="replyInsertBtn" >
					  	댓글 쓰기
					</button>
	            </div>
	            
         	   </c:when>
         	   <c:when test="${user == null  }">
	            <!-- 로그인 전일 경우 -->
	   			<div class="col">
	   				<input type="hidden" name="chg_id" value="${chg_id}">
	   				<input type="hidden" name="brd_num" value="${reviewContent.brd_num}">
	   				<input class="form-control form-control-sm" id="reviewReply" name="conts" type="text" placeholder="로그인을 해주세요!">
	 			</div>
	            <div class="col-auto">
					<!-- Button -->
					<button class="btn btn-sm btn-dark" type="submit" id="replyInsertBtn" >
					  	댓글 쓰기
					</button>
	            </div>
         	   </c:when>
         	
         	   <c:otherwise>
         	   <!-- 로그인 했지만 참가자 아닌 경우  -->
	   			<div class="col">
	   				<input class="form-control form-control-sm" id="reviewReply" type="text"  placeholder="챌린지 참가자만 댓글을 남길 수 있습니다!" disabled="disabled">
	 			</div>
	            <div class="col-auto">
					<!-- Button -->
					<button class="btn btn-sm btn-dark" type="submit" id="replyInsertBtn" disabled="disabled">
					  	댓글 쓰기
					</button>
	            </div>
         	   </c:otherwise>
         	</c:choose>
         </div>
       </form>

     </div>
     
     <!-- 후기 댓글 리스트 -->
     <c:forEach var="reply" items="${reviewReply }" varStatus="status">
    	
	     <div class="review">
		
		  <!-- 댓글 Body -->
		  <div class="review-body">
		    <div class="row">

		     	 <!-- 댓글 수정 버튼 눌렀을 때 -->
					<div class="col-12 col-md-auto">
				    	
			        <!-- 프로필 사진 -->
			        <div class="avatar avatar-xxl mb-6 mb-md-0">
			          <span class="avatar-title rounded-circle">
			            <i class="fa fa-user"></i>
			          </span>
			        </div>
			
			    </div>
			    <div class="col-12 col-md">
			      
			        <!-- 닉네임 -->
			        <p class="mb-2 fs-lg fw-bold">
					  ${reply.nick }
			        </p>
	               <form action="/replyUpdate?ori_brd_num=${reviewContent.brd_num }&chg_id=${chg_id}" method="post" onsubmit="return replyInsertChk(this)">
				        <!-- 댓글 쓴 날짜 및 시간 sysdate로 update할 것-->
						<input type="hidden" name="brd_num" value="${reply.brd_num }">
				        <!-- 댓글 내용 -->
				        <p id="input${status.index}" class="text-gray-500 fade" >
				        <input class="form-control form-control-sm" id="reviewReplyUpdate" name="conts" type="text"  maxlength="100" value="${reply.conts }">
				        </p>
				
						<!-- 댓글 내용 -->
				        <p id="text${status.index}" class="text-gray-500">
							${reply.conts }
				        </p>
				
				        <c:if test="${user.user_num == reply.user_num }">
					        <div class="col-auto">
							<button class="btn btn-xs btn-outline-border btn-dark" type="submit" id="replyUpdateBtn">저장</button>
							<button  class="btn btn-xs btn-outline-border" type="button"  onclick="location.href='/showReplyUpdate?rep_brd_num=${reply.brd_num}&ori_brd_num=${reviewContent.brd_num }&chg_id=${chg_id}&currentPage=${replyPage.currentPage }'">수정</button>
							<button class="btn btn-xs btn-outline-border" type="button" id="resetBtn" onclick="window.history.back();" >취소</button>
							<button  class="btn btn-xs btn-outline-border" type="button"  onclick="replyDelete('${reviewContent.brd_num}', '${reply.brd_num}', '${chg_id}')" >삭제</button>
					        </div>
					   </c:if>
						
	     			</form>
	     		</div>

		    </div>
		  </div>
		</div>
     </c:forEach>
</div>

<!-- Pagination -->
<nav class="d-flex justify-content-center mt-9">
  <ul class="pagination pagination-sm text-gray-400">
  <c:if test="${replyPage.startPage > replyPage.pageBlock}">
    <li class="page-item">
      <a class="page-link page-link-arrow" href="reviewContent?currentPage=${replyPage.startPage-replyPage.pageBlock }&brd_num=${reviewContent.brd_num}&chg_id=${chg_id}">
        <i class="fa fa-caret-left"></i>
      </a>
           </c:if>
    </li>
        <c:forEach var="i" begin="${replyPage.startPage }" end="${replyPage.endPage }">
    <li class="page-item active">
      <a class="page-link" href="reviewContent?currentPage=${i}&brd_num=${reviewContent.brd_num}&chg_id=${chg_id}">${i}</a>
    </li>
        </c:forEach>
        <c:if test="${replyPage.endPage < replyPage.totalPage }">
    <li class="page-item">
      <a class="page-link page-link-arrow" href="reviewContent?currentPage=${replyPage.startPage+replyPage.pageBlock }&brd_num=${reviewContent.brd_num}&chg_id=${chg_id}">
        <i class="fa fa-caret-right"></i>
      </a>
    </li>
        </c:if>
  </ul>
</nav>


</body>
</html>