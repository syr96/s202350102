<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로우 리스트</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

  $(document).ready(function () {


    var user_num = $("#followingUserNum" + index).val();

    // DB에 있는지 존재 유무 체크
    $.ajax({
      url: "/followingCheck",
      type: "POST",
      data: { following_id: user_num },
      dataType: 'json',
      success: function (followingCheck) {
        if (followingCheck.fStatus > 0) {
          $("#follow").removeClass("btn-danger");
          $("#follow").addClass("btn-light");
          $("#follow").text("팔로잉");
        } else {
          $("#follow").removeClass("btn-light");
          $("#follow").addClass("btn-danger");
          $("#follow").text("팔로우");
        }
      },
      error: function () {
        alert("팔로우 오류");
      }

    });
  });

	// yr 작성
  // 유저 닉네임 클릭 시 modal 창 띄우기
  function userInfoModal(index) {
    // 모달창에 넘겨줄 값을 저장 
    var user_num = $("#followingUserNum" + index).val();
    var user_nick = $("#followingNick" + index).val();
    var user_img = $("#followingImg" + index).val();

    // DB에 있는지 존재 유무 체크
    $.ajax({
      url: "/followingCheck",
      type: "POST",
      data: { following_id: user_num },
      dataType: 'json',
      success: function (followingCheck) {
        if (followingCheck.fStatus > 0) {
          $("#follow").removeClass("btn-danger");
          $("#follow").addClass("btn-light");
          $("#follow").text("팔로잉");
        } else {
          $("#follow").removeClass("btn-light");
          $("#follow").addClass("btn-danger");
          $("#follow").text("팔로우");
        }
      },
      error: function () {
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
      url: "/followingPro",
      type: "POST",
      data: sendData,
      dataType: 'json',
      success: function (followResult) {

        if (followResult.following > 0) {
          $("#follow").removeClass("btn-danger");
          $("#follow").addClass("btn-light");
          $("#follow").text("팔로잉");
        } else {
          $("#follow").removeClass("btn-light");
          $("#follow").addClass("btn-danger");
          $("#follow").text("팔로우");
        }
      },
      error: function () {
        alert("팔로우 오류");
      }

    });

  }

</script>
</head>
<body>
  
    <div class="row justify-content-center py-9">
      <div class="col-12 col-lg-10 col-xl-8">
        <div class="row">
          <div class="col-12">
  
            <!-- content -->
            <div class="review">
              <!-- Body -->
              <c:forEach var="following" items="${followingList }" varStatus="status">
                <div class="review-body">
                  <div class="row" id="following${status.index}">
                    <input type="hidden" id="followingImg${status.index}" value="${following.img}">
                    <input type="hidden" id="followingNick${status.index}" value="${following.nick}">
                    <input type="hidden" id="followingUserNum${status.index}" value="${following.user_num}">
                    <!-- profile -->
                    <div class="col-12 col-md-auto">
                      <div class="avatar avatar-xxl mb-6 mb-md-0">
                        <span class="avatar-title rounded-circle">
                          <img src="${following.img}" alt="profile" class="avatar-title rounded-circle">
                        </span>
                      </div>
                    </div>
  
                    <!-- nick -->
                    <div class="col-12 col-md">
                      <div class="row mb-6">
                        <div class="col-12">
                          <a href="#" data-bs-toggle="modal" onclick="userInfoModal(${status.index})">
                            <span>${following.nick}</span>
                          </a>
                          <!-- 글씨 빨간색으로 나옴 -> 검은색으로 나오게 수정해야함 -->
                        </div>
                      </div>
                    </div>
                    
                    
                    <div class="col-12 col-md">
                      <!-- follow -->
											<div class="row mb-6">
                        <div class="col-12">
                          <div class="row align-items-center">
                            <div class="col-auto">
                              <button type="button" class="btn btn-danger" onclick="following(${status.index})" value="${following.user_num}">팔로우</button>
                              <!-- <form class="followingForm">
                                <input type="hidden" class="inputUserNum1" name="user_num">
                              </form> -->
                            </div>
                          </div>
                        </div>
                      </div>
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
  
                      <button type="button" class="btn btn-danger" onclick="following(${status.index})" id="follow">팔로우</button>
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
            </div>
            
          </div>
        </div>
      </div>
    </div>
  
    
</body>
<%@ include file="../footer.jsp" %>
</html>