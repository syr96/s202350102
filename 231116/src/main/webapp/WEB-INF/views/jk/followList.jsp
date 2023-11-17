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
  // yr 작성
  // following 버튼
  function following(p_index) {
    var sendData = $('#followingForm').serialize();	// user_num=?

    $.ajax({
      url: "/followingPro",
      type: "POST",
      data: sendData,
      dataType: 'json',
      success: function (followResult) {

        if (followResult.following > 0) {
          $("#following" + p_index).removeClass("btn-danger");
          $("#following" + p_index).addClass("btn-light");
          $("#following" + p_index).text("팔로잉");
        } else {
          $("#following" + p_index).removeClass("btn-light");
          $("#following" + p_index).addClass("btn-danger");
          $("#following" + p_index).text("팔로우");
        }
      },
      error: function () {
        alert("팔로우 오류");
      }

    });

  }

  // followerMatpal 버튼
  function followerMatpal(p_index) {
    var sendData = $('#followerForm').serialize();	// user_num=?

    $.ajax({
      url: "/followingPro",
      type: "POST",
      data: sendData,
      dataType: 'json',
      success: function (followResult) {

        if (followResult.following > 0) {
          $("#followerMatpal" + p_index).removeClass("btn-danger");
          $("#followerMatpal" + p_index).addClass("btn-light");
          $("#followerMatpal" + p_index).text("팔로잉");
        } else {
          $("#followerMatpal" + p_index).removeClass("btn-light");
          $("#followerMatpal" + p_index).addClass("btn-danger");
          $("#followerMatpal" + p_index).text("팔로우");
        }
      },
      error: function () {
        alert("팔로우 오류");
      }

    });

  }

  // follower 버튼
  function follower(p_index) {
    var sendData = $('#followerForm').serialize();	// user_num=?

    $.ajax({
      url: "/followingPro",
      type: "POST",
      data: sendData,
      dataType: 'json',
      success: function (followResult) {
        
        if (followResult.following > 0) {
          $("#follower" + p_index).removeClass("btn-light");
          $("#follower" + p_index).addClass("btn-danger");
          $("#follower" + p_index).text("팔로우");
        } else {
          $("#follower" + p_index).removeClass("btn-danger");
          $("#follower" + p_index).addClass("btn-light");
          $("#follower" + p_index).text("팔로잉");
        }
      },
      error: function () {
        alert("팔로우 오류");
      }

    });

  }

  //쪽지보내기 버튼 - following
  function sendMessageFollowing() {
    var sendData = $('#sendMessageFormFollowing').serialize();	// user_num=?
    // alert("sendDate -> " + sendData);
  }

</script>
</head>
<body>

  <!-- Nav -->
  <div class="nav nav-tabs nav-overflow justify-content-start justify-content-md-center border-bottom">
    <a class="nav-link active" data-bs-toggle="tab" href="#followingList">
      팔로잉
    </a>
    <a class="nav-link" data-bs-toggle="tab" href="#followerList">
      팔로워
    </a>
  </div>

  <div class="tab-content">
    <!-- followingList -->
    <div class="tab-pane fade show active" id="followingList">
      <div class="row justify-content-center py-9">
        <div class="col-12 col-lg-10 col-xl-8">
          <div class="row">
            <div class="col-12">
  
              <!-- content -->
              <div class="review">
                <!-- Body -->
                <c:forEach var="following" items="${followingList }" varStatus="status">
                  <div class="review-body">
                    <div class="row">
                      <!-- img -->
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
                            <span>${following.nick}</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-12 col-md">
  
                        <!-- following & sendMessage -->
                        <div class="row mb-6">
                          <div class="col-12">
                            <div class="row align-items-center">
                              <div class="col-auto">
                                
                                <!-- following -->
                                <button type="button" class="btn btn-light" onclick="following(${status.index})" id="following${status.index}">팔로잉</button>
                                <form id="followingForm">
                                  <input type="hidden" value="${following.following_id}" name="user_num">
                                </form>

                                <!-- sendMessage -->
                                <button type="button" class="btn btn-info" onclick="sendMessageFollowing()">쪽지보내기</button>
                                <form id="sendMessageFormFollowing">
                                  <input type="hidden" value="${following.following_id}" name="user_num">
                                </form>
  
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:forEach>
              </div>
  
            </div>
          </div>
        </div>
      </div>
    </div>



    <!-- followerList -->
    <div class="tab-pane fade" id="followerList">
      <div class="row justify-content-center py-9">
        <div class="col-12 col-lg-10 col-xl-8">
          <div class="row">
            <div class="col-12">
    
              <!-- content -->
              <div class="review">
                <!-- Body -->
                <c:forEach var="follower" items="${followerList }" varStatus="status">
                  <div class="review-body">
                    <div class="row">
                      <!-- img -->
                      <div class="col-12 col-md-auto">
                        <div class="avatar avatar-xxl mb-6 mb-md-0">
                          <span class="avatar-title rounded-circle">
                            <img src="${follower.img}" alt="profile" class="avatar-title rounded-circle">
                          </span>
                        </div>
                      </div>
    
                      <!-- nick -->
                      <div class="col-12 col-md">
                        <div class="row mb-6">
                          <div class="col-12">
                            <span>${follower.nick}</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-12 col-md">
    
                        <!-- follower & sendMessage -->
                        <div class="row mb-6">
                          <div class="col-12">
                            <div class="row align-items-center">
                              <div class="col-auto">
                                <!-- follower -->
                                <c:choose>
                                  <c:when test="${follower.matpal == 1 }">
                                    <!-- 맞팔인 경우 -->
                                    <button type="button" class="btn btn-light" onclick="followerMatpal(${status.index})" id="followerMatpal${status.index}">팔로잉</button>
                                  </c:when>
                        
                                  <c:otherwise>
                                    <!-- 맞팔이 아닌 경우 -->
                                    <button type="button" class="btn btn-danger" onclick="follower(${status.index})" id="follower${status.index}">팔로우</button>
                                  </c:otherwise>
                                </c:choose>
                                
                                <form id="followerForm">
                                  <input type="hidden" value="${follower.user_num}" name="user_num">
                                </form>

                                <!-- sendMessage -->
                                <button type="button" class="btn btn-info" onclick="sendMessageFollower()">쪽지보내기</button>
                                <form id="sendMessageFormFollower">
                                  <input type="hidden" value="${follower.user_num}" name="user_num">
                                </form>
                        
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:forEach>
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