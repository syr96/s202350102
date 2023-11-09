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
	function chk(){
		if(${chgrYN == 1 }){
			return true;
		} else{
			alert("챌린지 참가자만 댓글을 남길 수 있습니다!")
			return false;
		}
		
	}
</script>
</head>
<body>


<!-- 글쓴이일 경우 수정, 삭제 버튼 활성화 -->
<c:if test="${user.nick == reviewContent.nick }">
	<input type="button" class="btn btn-xs btn-outline-border" onclick="location.href='reviewUpdate?brd_num${reviewContent.brd_num}'" value="수정">
	<input type="button" class="btn btn-xs btn-outline-border" onclick="location.href='reviewDelete?brd_num${reviewContent.brd_num}'" value="삭제">
</c:if>
<input type="button" value="목록" onclick="window.history.back()" >  
<div class="card mb-3">

	<!-- 후기 글 내용 -->
	<c:if test="${reviewContent.img != null} ">
  		<img src="${reviewContent.img}" class="card-img-top" alt="">
  	</c:if>
	<div class="card-body">
	  <h3 class="card-title">${reviewContent.title }</h3>
	  <h6 class="card-subtitle mb-2 text-muted">${reviewContent.nick }</h6>
	  <p class="card-text">${reviewContent.conts }</p>
	  <p class="card-text"><small class="text-muted"><fmt:formatDate value="${reviewContent.reg_date }" pattern="yyyy-MM-dd"/></small></p>
	  <p class="card-text"><small class="text-muted">조회수 : ${reviewContent.view_cnt }</small><p class="card-text"><small class="text-muted">댓글수 : ${reviewContent.view_cnt }</small>
	 </div>
	
     <!-- 댓글 쓰기 -->
     <div class="modal-body py-9">

       <!-- Form -->
       <form action="/replyInsert" method="post">
         <div class="row gx-5">
         	<c:choose>
         	<c:when test="${chgrYN == 1 }">
	            <!-- 참여자일 경우 -->
	   			<div class="col">
	   				<input type="hidden" name="chg_id" value="${chg_id}">
	   				<input type="hidden" name="brd_num" value="${reviewContent.brd_num}">
	   				<input class="form-control form-control-sm" id="reviewReply" name="conts" type="text" placeholder="댓글을 남겨주세요!">
	 			</div>
	            <div class="col-auto">
					<!-- Button -->
					<button class="btn btn-sm btn-dark" type="submit" id="replyInsertBtn" onclick="return chk()">
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
	   				<input class="form-control form-control-sm" id="reviewReply" type="text"  maxlength="100" placeholder="챌린지 참가자만 댓글을 남길 수 있습니다!" disabled="disabled">
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
			  <c:if test="${user.nick == reply.nick }">
				<input type="button" class="btn btn-xs btn-outline-border" onclick="location.href='replyUpdate?brd_num${reply.brd_num}'" value="수정">
				<input type="button" class="btn btn-xs btn-outline-border" onclick="location.href='replyDelete?brd_num${reply.brd_num}'" value="삭제">
			  </c:if>
			  
	          </div>
	        </div>
	
	      </div>
	    </div>
	  </div>
     </c:forEach>
</div>



</body>
</html>