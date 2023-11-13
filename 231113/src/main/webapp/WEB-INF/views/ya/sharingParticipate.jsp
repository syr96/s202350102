<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>   
<!DOCTYPE html>
<html>
 <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<head>
<meta charset="UTF-8">
<title>쉐어링 참가신청</title>
</head>
<body>
쉐어링 참가신청 절차
1.로그인
2.쉐어링 상세페이지 로 들어가기 
3. 참가버튼 클릭  - (user 정보가 기본적으로 보여짐)
4. 모집인원 마감시 "모집인원이 마감되었습니다" 후 쉐어링 상세페이지 이동
           가능시 쉐어링 참가 입력폼 or 모달 이동

5. 쉐어링 참가 입력 폼에 로그인 세션에 user_num 과 brd_num값을 가져감 (hidden)
    쉐어링 참가자  user1_nick, user1_addr, user_Tel, user_name
                        reg_date, message  작성
    

     동의하시겠습니까?  확인 /취소 


6.확인 버튼을 누르면 "참가가 완료되었습니다"  , 이름,
                               쉐어링 전체페이지 이동
    취소 버튼을 누르면 쉐어링 상세페이지 이동


<!--jk detailSharing 모달창 내용 분리   -->
<!--쉐어링 참가버튼을 누른 사람 (session의 usernum 정보 brd_num을 담는다.) -->
  <button id="openModalButton" class="btn btn-dark w-100" data-toggle="button" data-bs-target="#participateModal">
         <i class="fe fe-mail me-2"></i> 구매신청
  </button>    
  
  
<!--Ya test (참가신청) -------------------------------------------------------------------------->
<div class="modal" id="participateModal">
	<div class="modal-dialog">
				 <div class="modal-content">
						<!-- 모달 내용 -->
				<div id="remoteModalContent"></div>
				</div>
	</div>
</div>                
<div id="modalContainer"></div>

<script>
document.getElementById('openModalButton').addEventListener('click', function() {
		fetch(`/sharingParticipate?brd_num=${brd_num}`)// controller requestmapping
		.then(response => response.text())
		.then(data => {
		document.getElementById('remoteModalContent').innerHTML = data;
		var myModal = new bootstrap.Modal(document.getElementById('participateModal'));
		myModal.show();
		 });
	});
</script>
 <!---------------------------------------------------------------------------------------------->



<!-- 모달 -->
<div class="modal" id="purchaseModal">
<input type="hidden" name="brd_num" value="${board.brd_num}"> 
<input type="hidden" name="user_num" value="${user1.user_num}">
<div>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">쉐어링 등록자에게 전달할 정보입니다. 동의 후 신청하시겠습니까?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 모달 내용 -->
                <label class="form-label" for="nick">닉네임 *</label>
				<input class="form-control form-control-sm" id="nick" name="nick" type="text" value="${user1.nick}"readonly style="width: 103px; ">
				<label class="form-label" for="name">이름 *</label>
				<input class="form-control form-control-sm" id="user_name" name="user_name" type="text" value="${user1.user_name}"readonly style="width: 115px; "><p>
				<label class="form-label" for="tel">번호 *</label>
				<input class="form-control form-control-sm" id="tel" name="tel" type="text" value="${user1.tel}"readonly style="width: 96px; "><p>
				<label class="form-label" for="addr">주소 *</label>
				<input class="form-control form-control-sm" id="addr" name="addr" type="text" value="${user1.addr}" readonly style="width: 131px; ">
				</p>
				<!--입력받을 값-->
				<label class="form-label" for="conts">전달할 메시지 </label><div class="d-flex align-items-start" style="margin-top: 10px;">
				<textarea class="form-control form-control-sm" id="conts" name="conts" rows="8" style="width: 424px; height: 130px; "></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary">신청</button>
            </div>
        	</div>
    	</div>
	</div>
</div>
</div>
</body>
<%@ include file="../footer.jsp" %>
</html>