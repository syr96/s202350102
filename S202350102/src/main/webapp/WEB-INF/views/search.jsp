<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header4.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function hisList(data){
		var str = "";
		for(i=0; i< data.length; i++){
			str += "<td><a href=searching?srch_word="+data[i].srch_word + ">" + data[i].srch_word + "</a></td>"
				+  "<td><a href=searching?srch_word="+data[i].srch_word + ">삭제</a><td>"	
					
		}
		
		return str;
	}
	
	
	function sh(){
		if($("#shList").css("display") == "none" || $("#shList").css("display") == ""){
		    $("#shList").show();
		} else {
		    $("#shList").hide();
		    
		}
	}
	
	$(function(){
		$.ajax(
			{
				type:"GET",
				url: "srch_history",
				dataType:"json",
				success:function(data){
					var str = hisList(data);
					$("#listCont").html(str);
				}
			}		
		);
	})
</script>
</head>
<body>
<h1>검색</h1>

	<div id="searchVar" class="mb-3">
		<form action="searching">
			<label for="srch_word">검색</label>
			<input type="text" name="srch_word" id="srch_word" list="wordList" class="form-control form-control-sm">
			<c:if test="${user_num != 0 }">
				<table id="wordList">
					<tr id="listCont">
						<td>test</td>
						<td>test</td>
						<td>test</td>
					</tr>
				</table>
			</c:if>
			<button type="submit">검색</button>				
		</form>
	</div>
	
	<hr>
	
	<div id="popchg">
		<h3>인기 챌린지</h3>
		<table>
			<tr>
				<td>제목</td><td>신청자</td><td>신청일</td><td>시작일</td>
			</tr>
			<c:forEach var="popchg" items="${popchgList }">
				<tr>
					<td><a href="chg?chg_id=${popchg.chg_id }">${popchg.title }</a></td>
					<td>${popchg.user_num }</td>
					<td><fmt:formatDate value="${popchg.reg_date }" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${popchg.start_date }" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<hr>
	<div id="popcommu">
		<h4>인기 쉐어링</h4>
		<table>
			<tr>
				<td>제목</td><td>작성자</td><td>좋아요</td><td>등록일</td>
			</tr>
			<c:forEach var="popShare" items="${popShareList }">
				<tr>
					<td><a href="detailCommunity?user_num=${popShare.user_num }&brd_num=${popShare.brd_num }">${popShare.title }</a></td>
					<td>${popShare.nick }</td>
					<td>${popShare.like_cnt }</td>
					<td><fmt:formatDate value="${popShare.reg_date }" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<hr>
	
	<div id="popcommu">
		<h4>인기자유글</h4>
		<table>
			<tr>
				<td>제목</td><td>작성자</td><td>좋아요</td><td>등록일</td>
			</tr>
			<c:forEach var="popBoard" items="${popBoardList }">
				<tr>
					<td><a href="commu?brd_num=${popBoard.brd_num }">${popBoard.title }</a></td>
					<td>${popBoard.nick }</td>
					<td>${popBoard.like_cnt }</td>
					<td><fmt:formatDate value="${popBoard.reg_date }" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
<%@ include file="footer.jsp" %>
</body>
</html>