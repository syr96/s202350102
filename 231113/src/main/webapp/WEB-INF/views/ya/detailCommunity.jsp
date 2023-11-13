<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<head>
<!-- CSS -->
<link rel="shortcut icon" href="./assets/favicon/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./assets/css/libs.bundle.css" />
<link rel="stylesheet" href="./assets/css/theme.bundle.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
    	body{
    	font-family: 'Noto Sans KR', sans-serif;} 
</style>
</head>

<body>
<section class="pt-7 pb-12">
      <div class="container">
       <!-- Heading -->
        <div class="row">
          <div class="col-12 text-center"> 
            <h3 class="mb-10"> 게시글 상세내용 </h3>
          </div>
        </div>
        
	   <!--form  -->
      <div class="col-12 col-md-9 col-lg-8 offset-lg-1">        	
		<input type="hidden" name="brd_step" value="${board.brd_step}"> 
		<input type="hidden" name="brd_group" value="${board.brd_group}"> 
		댓글 총 개수 : ${board.replyCount}
		<c:choose>
    		<c:when test="${board.brd_step == 0}">
  
              <div class="col-12">
                    <!-- 제목 -->
                    <div class="form-group">
                        <label class="form-label" for="title">제목</label>
                        <input class="form-control form-control-sm" id="title" name="title" type="text"  value="${board.title}" readonly>
                    </div>
               </div>      
                     <!-- 작성자 닉네임 -->
                    <div class="form-group mb-7">                       
                           <label class="form-label" for="nick">닉네임</label>
                           <input class="form-control form-control-sm" id="nick" name="nick" type="text" value="${board.nick}" readonly>
          	   	 	</div>
		  		  <!-- 조회수 -->
                    <div class="form-group mb-7">                       
                           <label class="form-label" for="view_cnt">조회수 </label>
                           <input class="form-control form-control-sm" id="view_cnt" name="view_cnt" type="text" value="${board.view_cnt}" readonly>
          	   		</div>
		    		<!-- 작성일자 -->
                    <div class="form-group mb-7">                       
                           <label class="form-label" for="nick">닉네임</label>
                           <input class="form-control form-control-sm" id="view_cnt" name="view_cnt" type="text" value="${board.reg_date}" readonly>
          	   	    </div>
		
					<!-- 상세내용 -->       
					<div class="form-group mb-7">
    					<label class="form-label" for="conts">등록일자</label>
    					<div class="d-flex align-items-start" style="margin-top: 10px;">
      					 	 <textarea class="form-control form-control-sm" id="conts" name="conts" rows="8" ${board.conts} readonly></textarea>
  						</div>
					</div>       
                    <!-- 이미지 업로드 -->	
					<div class="form-group mb-7">
						<label class="form-label" for="file">이미지 *</label>
						<input class="form-control form-control-sm me-3" id="file" name="file" type="file">
						<img id="imgPreview" style="max-width: 200px; margin-top: 10px;" />
					</div>   	
		 	</c:when>
		</c:choose>					


<input type="hidden" name="brd_num" value="${board.brd_num}"> 
<input type="hidden" value="${ sessionScope.user_num} ">
<c:if test="${loggedIn}">
    <c:if test="${board.user_num == sessionScope.user_num}">
        <div class="button-container" >
         <a href="updateCommunityForm?brd_num=${board.brd_num}" class="btn btn-dark btn-sm">수정</a> 
		
		<!--삭제완료버튼 모달창  -->
		<button type="button" class="btn btn-dark btn-sm" id="openModalButton"> 삭제</button>
		<!-- Modal -->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-sm" role="document"> <!-- 모달 사이즈를 조절 -->
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="deleteModalLabel">게시물 삭제</h5>
		            </div>
		            <div class="modal-body">
		                게시물을 삭제하시겠습니까?
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-dark btn-sm" onclick="clickDel(formInfo)">삭제하기</button>
		                <button type="button" class="btn btn-dark btn-sm" data-dismiss="modal">취소하기</button>
		            </div>
		        </div>
		    </div>
		</div>
		<form name="formInfo">
			<input type="hidden" name="brd_num" value="${board.brd_num}">
		</form>	
				
		<script>
		    // 버튼 클릭 시 모달 열기
		    document.getElementById('openModalButton').addEventListener('click', function() {
		        $('#deleteModal').modal('show');
		    });
		    
		    // 삭제 시 수행 후 
		    function clickDel(formInfo) {
		        // 삭제 작업 수행 후 페이지 이동
		    	formInfo.action = "/deleteCommunity?brd_num=${board.brd_num}";
		    	formInfo.method = "GET";
		    	formInfo.submit();
		    }
		</script>		
				
        </div>
    </c:if>
</c:if>

</div>
</div>
</section>

	
<%@ include file="./commentForm.jsp" %>
<%@ include file="../footer.jsp" %>
</body>
</html>