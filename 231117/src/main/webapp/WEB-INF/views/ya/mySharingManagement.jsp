<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 필수!! -->
 <div class="container">
         <div class="row profile">
            <div class="col-md-3">
                <%@ include file="../mypageMenu.jsp" %>
            </div>
             <div class="col-md-9 profile-form">
<!-- 필수!! -->
    <section class="myUploadSharing">
        <div class="page-title">
            <div class="container">
                <h6>내가 올린 쉐어링 </h6>
            </div>
        </div>
      <!-- 게시판리스트  -->
        <div id="board-list">
            <div class="container">
                <table class="table table-sm"  style="font-size: 0.75rem;">
                     <thead class="table-dark">
                        <tr>
                            <th scope="col" class="th-num">번호</th>
                            <th scope="col" class="th-title">제목</th>
                            <th scope="col" class="th-applicants">모집인원</th>
                            <th scope="col" class="th-bank_duedate">입금기한</th>
                            <th scope="col" class="th-check">참가자</th>
                        </tr>
                    </thead>                 
                    <tbody>
                        <c:forEach var="board" items="${myUploadSharingList}">
                            <tr>
                                <td>${board.brd_num}</td>
                                <td>${board.title}</td>
                                <td>${board.applicants}</td>                  
                                <td>${board.bank_duedate}</td>
				         		<td><button type="button" class="btn btn-dark btn-sm" id="openModalButton" data-toggle="modal" data-target="#joinInfoModal" 
				         					data-brd_num="${board.brd_num}"> 조회</button></td>       
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>  
             </div>          
        </div>
    </section>


<!--모달창 띄우기---------------------------------------------------------------------------------------->
<div class="modal  fade" id="joinInfoModal">
    <div class="modal-dialog  modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title">쉐어링 참가자 조회</h6>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
            	<input type="hidden" name="brd_num" value="${board.brd_num}"> 
            	<h6>총 참가자 수 : ${board.participants}</h6>
            	<table class="table table-hover" id="joinInfoForm" >		
                    <thead class="table-light" >
                        <tr>
                            <th scope="col" class="th-nick">닉네임</th>
                            <th scope="col" class="th-name">이름</th>
                            <th scope="col" class="th-message">메시지</th>
                            <th scope="col" class="th-tel">연락처</th>
                            <th scope="col" class="th-reg_date">신청일자</th>
                            <th scope="col" class="th-check">승인처리</th>
                        </tr>
                    </thead>                 
                    <tbody>
                        <c:forEach var="sharingList" items="${sharingParticipantsInfo}">
                            <tr>
                                <td id="nick">${sharingList.nick}</td>
                                <td id="user_name">${sharingList.user_name}</td>
                                <td id="message">${sharingList.message}</td>                  
                                <td id="tel">${sharingList.tel}</td>
                                <td id="reg_date">${sharingList.reg_date}</td>                              
				         		<td><div class="btn-group" role="group" aria-label="Basic example">
				         			<button type="button" class="btn btn-dark btn-sm" id="confirmModalButton">승인</button>
				         		    <button type="button" class="btn btn-dark btn-sm" id="rejectModalButton">반려</button>
				         		</div></td>       
                            </tr>
                        </c:forEach>
                    </tbody>                            
                </table>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-dark btn-sm" id="closeModalButton" data-bs-dismiss="modal" >닫기</button>
     	  	 </div>
        </div>	  	 
    </div>
</div>
</div>
</div>
<!-------------------------------- 참가자 조회 모달창 자바스크립트 ------------------------------------------------------------------------>
<script type="text/javascript">
//모달 창을 열 때의 스크립트 부분
	$('#openModalButton').on('click', function () {
	    // 버튼의 데이터 속성에서 게시글 번호
	    var brd_num = $(this).data('brd_num');

	    // 모달 내부의 숨겨진 입력란에 값 설정
	    $('#joinInfoModal input[name="brd_num"]').val(brd_num);

	    // 서버에 데이터를 요청
	    fetch('/sharingParticipantsInfo?brd_num=' + brd_num)
	        .then(response => {
	           
	            if (!response.ok) {
	                throw new Error('Network response was not ok');
	            }
	     
	            return response.json();
	        })
	        .then(data => {
	        	 console.log('Received JSON data:', data);
	            // 가져온 데이터를 사용하여 모달 내용을 업데이트
	            var tbody = $('#joinInfoForm tbody');
	            tbody.empty();
	         
	            if (Array.isArray(data) && data.length > 0) {
	                data.forEach(sharingList => {
		                  var regDate = new Date(sharingList.reg_date);
		                  var options = { year: '2-digit', month: '2-digit', day: '2-digit' };
		                  var formattedRegDate = regDate.toLocaleDateString('en-US', options);
	                    var row = '<tr>' +
	                        '<td>' + sharingList.nick + '</td>' +
	                        '<td>' + sharingList.user_name + '</td>' +
	                        '<td>' + sharingList.message + '</td>' +
	                        '<td>' + sharingList.tel + '</td>' +
	                 
	                        '<td>' + formattedRegDate + '</td>' +
	                        '<td>' + '<div class="btn-group" role="group" aria-label="Basic example">'+
	                        '<button type="button" class="btn btn-dark btn-sm" id="confirmModalButton">승인</button>' +
	                        '<button type="button" class="btn btn-dark btn-sm" id="rejectModalButton">반려</button>' +
	                        '</td>' + '</div>'
	                        '</tr>';

	                    tbody.append(row);
	                });
	            } else {
	                console.error('Received JSON data is not in the expected format:', data);
	            }

	            // 모달을 표시합니다.
	            $('#joinInfoModal').modal('show');
	        })
	        .catch(error => {
	            console.error('Error fetching sharingList information:', error);
	        });
	});

	$(document).ready(function () {
	    // 모달을 닫기 위한 버튼 클릭 이벤트 핸들러
	    $('#closeModalButton').on('click', function () {
	        $('#joinInfoModal').modal('close');

	    });
	});
   
    document.querySelector('.modal-footer button[data-dismiss="modal"]').addEventListener('click', function() {
        $('#deleteModal').modal('hide');
    });
</script>

<%@ include file="../footer.jsp" %>
</html>