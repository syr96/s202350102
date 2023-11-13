<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery.js"></script>

<body>
<c:import url="/WEB-INF/views/header4.jsp"/>
	<h2>문의게시판 디테일</h2>
	<div id="qboard_title">
		<p>${board.title }
			<a href="qBoardUpdateForm?brd_num=${board.brd_num }">수정</a>
			<a href="qBoardDelete?brd_num=${board.brd_num }">삭제</a>
			<a href="qBoardList?board=${board }">목록</a></p>
	</div>
	<hr width="100%">
	<div id="qboard_content">
		<p>${board.conts }</p>
	</div>
	<hr width="100%">
	<div class="rp">
		<div class="rp_write">
			<form  name="boardTrans"   id="boardTrans">
			    <input type="hidden"  id="brd_num"  name="brd_num" value="${board.brd_num }">
			    <input type="hidden"  id="brd_md" 	 name="brd_md" value="${board.brd_md }">
			    <input type="hidden"  id="brd_group"  name="brd_group" value="${board.brd_num }">
			    <textarea rows="7" cols="100" name="conts" id="conts" required="required"></textarea><p>
				<input type="button" value="입력" onclick="commentWriteBtn()">
			</form>
		</div>
		<div class="rp_list">
			<ul class="rp_group" id="qBoardCommentList">
			</ul>
		</div>

	</div>

<c:import url="/WEB-INF/views/footer.jsp"/>
<script type="text/javascript">
	$(document).ready(function(){
		qBoardCommentList();
	})
	
	function qBoardCommentList(){
		var brd_group = ${board.brd_group};
		$.ajax({
			url: "qBoardCommentList",
			type : "GET",
			data : {
				brd_group: brd_group
			},
			dataType: "json",
			success: function(data){
				console.log(data);
				for (var i = 0; i < data.length; i++){
					var commentList = data[i];
					var str = "<li class='comment_item' id=comment"+i+">";
					str += "<p>"+commentList.conts
					str += "<div class='comment_info'>"
					str += "<img title='Lv."+commentList.user_level+" | exp."+commentList.user_exp+"("+commentList.percentage+"%)' src='/images/level/"+commentList.icon+".gif'>"+commentList.nick
					str += "</div>"
					str += "</li>";
					$('#qBoardCommentList').append(str);
					// append 했고 write에서 성공시 qBoardCommentList()를 했는데 왜 바로 업뎃안돼?
				}
			}
		})
	}
// 댓글작성
	function commentWriteBtn() {
		var sendData =  $('#boardTrans').serialize();
		$.ajax({
			url: 'qBoardCommentWrite',
			type: 'POST',
			data: sendData,
			dataType: 'json',
			success: function(response) {
				if( response.result > 0) {
					console.log("response: ", response);
					qBoardCommentList();
				}
			}
			
		})		
	}

</script>
</body>

</html>