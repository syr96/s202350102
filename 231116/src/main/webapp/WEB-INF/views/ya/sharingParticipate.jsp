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



<button type="button" id = "infoModal" class="btn btn-dark btn-sm" data-toggle="modal" data-target="#infoModal">
  참가신청
</button>

<div class="modal" id="infoModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">쉐어링 등록자에게 전달할 정보입니다. 신청하시겠습니까?</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <div class="modal-body">
        <form id="infoForm">
          <div class="form-group">
            <label for="nick">닉네임</label>
            <input type="text" class="form-control" id="nick" name="nick" value="${user1.nick}"readonly >
          </div>
          <div class="form-group">
            <label for="user_name">이름</label>
            <input type="text" class="form-control" id="user_name" name="user_name" value="${{user1.user_name}"readonly >
          </div>
          <div class="form-group">
            <label for="tel">번호</label>
            <input type="text" class="form-control" id="tel" name="tel" type="text" value="${user1.tel}">
          </div>
          <div class="form-group">
            <label for="add">주소</label>
            <input type="text" class="form-control"id="addr" name="addr" value="${user1.addr}" >
          </div>
          <div class="form-group">
            <label for="add">전달할 메세지</label>
            <input type="text" class="form-control"id="addr" name="addr" value="${user1.addr}" >
          </div>
          
        </form>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-dark btn-sm" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-dark btn-sm" onclick="submitInfo()">신청</button>
      </div>
    </div>
  </div>
</div>

<script>
	
	// 모달창열기
	document.addEventListener('DOMContentLoaded', function() {
	  const modalBtn = document.querySelector('[data-target="#infoModal"]');
	  modalBtn.addEventListener('click', function() {
	    // 여기에 사용자 정보를 불러오는 코드 추가:
	    document.getElementById('nick').value = user1.nick;
	    document.getElementById('user_name').value = user1.user_name;
	    document.getElementById('tel').value = user1.tel;
	    document.getElementById('addr').value = user1.addr;
	  });
	});
	
	//모달창에 데이터 불러오기
	 document.addEventListener('DOMContentLoaded', function() {
		  const modalBtn = document.querySelector('[data-target="#infoModal"]');
		  modalBtn.addEventListener('click', function() {
		    // 여기에 사용자 정보를 불러오는 코드 추가:
		    // 서버에서 정보를 가져와야 하므로 fetch로 데이터를 가져오는 예시입니다.
		    fetch('/user-info-endpoint')
		      .then(response => response.json()) // 사용자 정보를 JSON받음
		      .then(userData => {
		        document.getElementById('nick').value = userData.nick;
		        document.getElementById('user_name').value = userData.user_name;
		        document.getElementById('tel').value = userData.tel;
		        document.getElementById('addr').value = userData.addr;
		      })
		      .catch(error => {
		        console.error('Error fetching user data:', error);
		      });
		  });
		});
	
	// 신청 버튼 클릭 시 데이터 저장
	function submitInfo() {
	  const nick = document.getElementById('nick').value;
	  const name = document.getElementById('user_name').value;
	  const tel = document.getElementById('tel').value;
	  const addr = document.getElementById('addr').value;
	  const message = document.getElementById('message').value;
	
	  console.log("닉네임: " + nick);
	  console.log("이름: " + name);
	  console.log("번호: " + tel);
	  console.log("주소: " + addr);
	  console.log("메세지: " + message);
	  // 데이터를 서버에 전송하는 등의 작업이 필요할 수 있습니다.
	  };
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<%@ include file="footer.jsp" %>
</html>
</body>
<%@ include file="../footer.jsp" %>
</html>