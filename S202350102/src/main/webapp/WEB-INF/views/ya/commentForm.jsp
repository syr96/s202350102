<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 
<!DOCTYPE html>

<html>
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

/*댓글 조회 아작스*/
var brd_num = ${board.brd_num}; 
var sessionUserNum = ${sessionScope.user_num};
var user_num =  ${board.user_num};

console.log("brd_num: " + brd_num);
console.log("user_num: " +  user_num);

$(document).ready(function(){
    listcomment(brd_num);
});

function listcomment() {
    var brd_num =  ${board.brd_num};
    // 본글이 아닌 댓글의 user_num을 
     var user_num =  ${board.user_num};
    var sessionUserNum = ${sessionScope.user_num};
    $.ajax({
        url: "listComment?brd_num="+brd_num,
        type: "GET",
        data: {  user_num: user_num,    //원래는 brd_num: brd_num;
          		  brd_num: brd_num,
        	 	 },
        dataType: "json",
        success: function(result) {
            var commentList = $("#commentList"); 
            commentList.empty();
            console.log("brd_num: " + brd_num);
            console.log(" list comment user_num: " + user_num);
            console.log("sessionUserNum :" + sessionUserNum  )
            $.each(result, function(index, board) {
                var listItem = $("<li class='list-group-item'></li>");
                listItem.append("작성자: " + board.nick + " &nbsp;&nbsp;&nbsp;&nbsp;");
                listItem.append("작성자 회원번호: " + board.user_num);
                listItem.append("댓글 그룹: " + board.brd_group);
                listItem.append("댓글 순서: " + board.brd_step);
                listItem.append("작성날짜: " + board.reg_date);
                listItem.append("<br>댓글 내용: <span>" + board.conts + "</span><br>");         
                listItem.append("<button type='button' class='btn btn-outline-success' id='commentupdateBtn' value='" + board.user_num + "'>댓글 수정</button>"); 
                listItem.append("<button type='button' class='btn btn-outline-success' id='commentdeleteBtn'  dvalue='" + board.user_num + "'>댓글 삭제</button>"); 

                commentList.append(listItem);
            });
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("Ajax 요청 실패: " + errorThrown);
        }
    });
}

/*댓글 작성 아작스 */
    $(document).ready(function () {
        $("#submit-comment").click(function () {
            var user_num = $("#user_num").val();
            var brd_group = $("#brd_group").val();
            var conts = $("#conts").val();
            var brd_step = $("#brd_step").val();
            console.log("brd_num: " + brd_num);
            console.log("brd_group: " + brd_group);
         
            console.log("brd_step: " + brd_step);
            // 댓글 작성을 서버로 전송
            $.ajax({
                url: "commentWrite",
                type: "POST",
                data: {
                    user_num: user_num,
                    brd_num: brd_num,
                    brd_group: brd_group,
                    brd_step: brd_step,
                    conts: conts
                },
                dataType: "json",
                success: function (result) {
                    if (result.result === "success") {
                        // 댓글 작성이 성공한 경우, 댓글 목록 조회 아작스를 호출하여 댓글을 즉시 가져옴
                        listcomment();
                    } else {
                        alert("댓글 작성에 실패했습니다.");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Ajax 요청 실패: " + errorThrown);
                    console.log("서버에서의 오류 메시지: " + jqXHR.responseText);
                }
            });
        });
    });
    
    
    /*댓글 수정 (게시글 본글 댓글 작성자 = 로그인 유저) */
    $(document).ready(function () {
        // 댓글 수정 버튼을 클릭
        $(document).on('click', '#commentupdateBtn', function () {
        	
            // 클릭한 수정 버튼의 부모 엘리먼트 <li>
            var listItem = $(this).closest('li');
            // 댓글 작성자의 user_num 가져오기;
             var user_num = $("#user_num").val();
			var sessionUserNum = ${sessionScope.user_num};
			  console.log("user_num: " +user_num);
			if (user_num == sessionUserNum) {
				// 권한이 있는 경우 수정 버튼 활성화
			  console.log("user_num: " +user_num);
			  console.log("sessionUserNum: " +sessionUserNum );
            // 댓글 내용을 텍스트 필드로 교체
            var originalContent = listItem.find('span').text();
            var inputField = $('<input type="text" class="form-control" value="' + originalContent + '">');
            listItem.find('span').replaceWith(inputField);

           
            
            // 수정 버튼 클릭 시, '저장' 버튼에 data-value를 추가하여 댓글 번호를 저장
            var saveButton = $('<button type="button" class="btn btn-success save-comment-btn">저장</button>');
            listItem.append(saveButton);
            var user_num = $("#user_num").val();
      /*       var user_num = $(this).data("user-num"); */
            // 기존 수정 버튼을 비활성화
            $(this).prop('disabled', true);
        } else {
            alert("게시글의 댓글 작성자와 다른 사용자는 수정할 수 없습니다.");
        }
    });

        // 수정 완료 버튼을 클릭
        $(document).on('click', '.save-comment-btn', function () {
            // 클릭한 저장 버튼의 부모 엘리먼트 <li>
           
           var listItem = $(this).closest('li');

            // 수정된 내용을 가져와서 서버로 전송
            var newContent = listItem.find('input').val();
           /*  var user_num = listItem.find('#commentupdateBtn').data('board.user_num'); //수정함  */
            var user_num = listItem.find('user_num').val();
            console.log("brd_num: " + brd_num);
            console.log("user_num : " + user_num );
            // 댓글 작성자와 로그인 사용자가 같은지 확인
            if (${sessionScope.user_num}  === user_num) {
                $.ajax({
                    url: "commentUpdate",
                    type: "POST",
                    data: {
                        user_num: user_num, // 수정함
                        brd_num: brd_num,
                        conts: newContent
                    },
                    dataType: "json",
                    success: function (result) {
                        if (result.result === "success") {
                            // 수정이 성공하면 댓글 목록을 다시 불러오기
                            listcomment();
                        } else {
                            alert("댓글 수정에 실패했습니다.");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("Ajax 요청 실패: " + errorThrown);
                    }
                });
            } else {
                alert("댓글 작성자와 다른 사용자는 수정할 수 없습니다.");
            }
        });
    });
    </script>

 <!--댓글작성-->
<c:choose>
    <c:when test="${empty sessionScope.user_num}">
        <!-- 로그인되지 않은 사용자에게는 댓글 작성 폼을 표시하지 않음 -->
        <p>댓글을 작성하실 분은 로그인을 해주세요!</p>
    </c:when>
    <c:otherwise>
    <div class="card my-4">
       <h5 class="card-header">댓글 작성</h5>
       <div class="card-body">
           <form name="comment-form" action="/commentWrite" method="post" autocomplete="off">
               <div class="form-group">
                   <input type="hidden" name="user_num"  id="user_num" value="${board.user_num}">
                   <input type="hidden" name="brd_group" id="brd_group" value="${board.brd_group}">
                   <input type="hidden" name="brd_step" id="brd_step" value="${board.brd_step}">
                   <textarea name="conts" id="conts" class="form-control" rows="3" placeholder="댓글을 남겨주세요"></textarea>
               </div>
               <button id="submit-comment" type="button" class="btn btn-primary">댓글 작성</button>
           </form>
       </div>
   </div>
    </c:otherwise>
</c:choose> 

 <!-- 댓글 조회 확인 -->

 
		<div class="container">
		<ul class="list-group list-group-flush" id="commentList">
     	 <c:forEach var="board" items="${listComment}">
        	<li class="list-group-item">
                        댓글 작성자: ${board.nick} &nbsp;&nbsp;&nbsp;&nbsp;
                        댓글 작성자 회원번호 : ${board.user_num}
                        댓글 그룹번호 :${board.brd_group}
                        댓글 step번호: ${board.brd_step}
                        작성날짜 : ${board.reg_date}
                        댓글 내용: <span>${board.conts}</span>
     		  <c:if test="${board.user_num == sessionScope.user_num}">
           		  <button type='button' id='commentupdateBtn' value='${board.user_num}'>댓글 수정</button>
           		  <button type='button' id='commentdeleteBtn' value='${board.user_num}'>댓글 삭제</button>
              </c:if>
             </li>
        </c:forEach>
		</ul>
		</div>

    
</body>
</html>