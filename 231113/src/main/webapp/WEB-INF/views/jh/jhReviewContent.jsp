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
	
</script>
</head>
<body>

<input type="hidden" name="updateFlag" id="updateFlag" value="${flag }">
<input type="hidden" name="result" id="result" value="${result }">
<!-- 글쓴이일 경우 수정, 삭제 버튼 활성화 -->
<c:if test="${user.user_num == reviewContent.user_num }">
	<input type="button" class="btn btn-xs btn-outline-border" onclick="location.href='reviewUpdate?brd_num=${reviewContent.brd_num}'" value="수정">
	<input type="button" class="btn btn-xs btn-outline-border" onclick="location.href='reviewDelete?brd_num=${reviewContent.brd_num}'" value="삭제">
</c:if>

<input type="button" value="목록" onclick="location.href='chgDetail?chg_id=${chg_id}'" >  

<div class="card mb-3">

	<!-- 이미지 null 아닌 경우 출력 -->
	<c:if test="${reviewContent.img != null} ">
  		<img src="${reviewContent.img}" class="card-img-top" alt="">
  	</c:if>
  	
  	
	<!-- 후기 글 내용 -->
	<div class="card-body">
	  <h3 class="card-title">${reviewContent.title }</h3>
	  <h6 class="card-subtitle mb-2 text-muted">${reviewContent.nick }${result }</h6>
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
     
     <!-- 후기 댓글 -->
     <c:forEach var="reply" items="${reviewReply }">
    	
	     <div class="review">
		
		  <!-- 댓글 Body -->
		  <div class="review-body">
		    <div class="row">
		
		     	 <c:choose>
			     	<c:when test="${flag == 'flag' && rep_brd_num == reply.brd_num}">
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
						        <p class="text-gray-500">
						        <input class="form-control form-control-sm" id="reviewReplyUpdate" name="conts" type="text"  maxlength="100" value="${reply.conts }">
						        </p>
						
						        <div class="col-auto">
								<button class="btn btn-xs btn-outline-border btn-dark" type="submit" id="replyUpdateBtn">수정</button>
								<button class="btn btn-xs btn-outline-border" type="button" id="resetBtn" onclick="window.history.back();" >취소</button>
						        </div>
			     			</form>
			     		</div>
			    	</c:when>
			    	<c:otherwise>
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
					        
					        <!-- 댓글 쓴 날짜 및 시간 -->
					        <div class="row mb-6">
					          <div class="col-12">
					            <span class="fs-xs text-muted">
					              <fmt:formatDate value="${reply.reg_date }" pattern="yyyy-MM-dd"/>
					            </span>
					
					          </div>
					        </div>
					
					        <!-- 댓글 내용 -->
					        <p class="text-gray-500">
								${reply.conts }
					        </p>
					
					        <div class="col-auto">
					
			
				             <!-- 글쓴이일 경우 수정, 삭제 버튼 활성화 -->
				             <!-- 삭제 눌렀을 때 자스로 삭제하시겠습니까? 확인하는 alert만들기 -->
							  <c:if test="${user.user_num == reply.user_num }">
									<button  class="btn btn-xs btn-outline-border" type="button"  onclick="location.href='/showReplyUpdate?rep_brd_num=${reply.brd_num}&ori_brd_num=${reviewContent.brd_num }&chg_id=${chg_id}&currentPage=${replyPage.currentPage }'">수정</button>
									<button  class="btn btn-xs btn-outline-border" type="button"  onclick="replyDelete('${reviewContent.brd_num}', '${reply.brd_num}', '${chg_id}')" >삭제</button>
							  </c:if>
							  
					        </div>
					      </div>
					
		
			    	</c:otherwise>
		     	</c:choose>
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