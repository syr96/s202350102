<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="js/jquery.js"></script>
	<link rel="stylesheet" href="/css/qBoardList.css">
</head>
<body>
	
	<c:import url="/WEB-INF/views/header4.jsp"/>
	<div class="mainBody">
	  <div class="qe_body">
	    <div class="qe_box">
	      <div class="qe_text_box">
	        <span>문의게시판</span>
	      </div>
	      <div class="qe_write_box">
	        <c:if test="${user1.user_id != null }">
				<a href="qBoardWriteForm"><span>글쓰기</span></a>
			</c:if>
	      </div>
	      <div class="tb_body">
	      <c:set var="num" value="${page.total-page.start+1 }"></c:set>
	        <table class="tb_main">
	          <thead class="tb_thead">
	              <tr>
	                <td>번호</td>
	                <td>제목</td>
	                <td>작성자</td>
	                <td>작성일</td>
	                <td>조회수</td>
	              </tr>
	          </thead>
	          <tbody id="search-list">
				<c:forEach var="board" items="${qBoardList}">
					<c:if test="${board.user_num == user1.user_num || user1.status_md == 102 }">	
						<tr>
							<td>${num}</td>
							<td><a href="qBoardDetail?brd_num=${board.brd_num}">${board.title}</a></td>
							<td>
								<img title="Lv.${board.user_level } | exp.${board.user_exp}(${board.percentage }%)" src="/images/level/${board.icon}.gif">${board.nick}
							</td>
							<td><fmt:formatDate value="${board.reg_date }" pattern="yy-MM-dd"/></td>
							<td>${board.view_cnt}</td>
							<c:set var="num" value="${num-1 }"></c:set>
						</tr>
					</c:if>
				</c:forEach>
	          </tbody>
	        </table>
	        <div class="page" id="page">
	        	<c:if test="${page.startPage > page.pageBlock }">
					<a href="qBoardList?currentPage=${page.startPage-page.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<a href="qBoardList?currentPage=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${page.endPage < page.totalPage }">
					<a href="qBoardList?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
				</c:if>
			</div>
			<c:if test="${user1.status_md == 102 }">
			<div class="search">
				<div>
					<select id="search-select">
						<option value="title">제목</option>
						<option value="conts">내용</option>
						<option value="nick">작성자</option>
					</select>
					<input class="search-box" id="searchValue" type="text" size="20">
				</div>
				<div class="search-btn">
					<button class="search-btn-form" type="button">검색</button>
				</div>
			</div>
			</c:if>	
	      </div>
	    </div>
	  </div>
	</div>
	<c:import url="/WEB-INF/views/footer.jsp"/>
	
</body>
	<script type="text/javascript">
		$(function(){
			
			
			
			$(document).off('click', '.search-btn-form');
			$(document).on('click', '.search-btn-form', function () {
//			$('.search-btn-form').click(function(){
				var searchType =  $('#search-select').val();
				var keyword = $('.search-box').val();
				
				$.ajax({
					url: "qboardListSearch",
					type: "GET",
					data: {
						keyword: keyword,
						searchType: searchType
					},
					dataType: "json",
					success: function (data){
						$('#page').hide();
						console.log(data);
						$('#search-list').empty();
						if(data && data.length > 0){
							for (var i = 0; i < data.length; i++){
								var result = data[i];
								var str = '<tr>';
								str += "<td>"+ result.brd_num + "</td>";
								str += "<td><a href='qBoardDetail?brd_num="+result.brd_num+"'>"+ result.title + "</a></td>";
	                            str += "<td>" + result.nick + "</td>";
								var formatDate = new Date(result.reg_date);
								var day = formatDate.getDate();
								var month = formatDate.getMonth()+1;
								var year = formatDate.getFullYear() % 100;
								day = (day < 10) ? '0'+day : day;
								month = (month<10) ? '0'+month : month;
								year = (year<10) ? '0'+year : year;
	                            str += "<td>" + year+'-'+month+'-'+day + "</td>";
	                            str += "<td>" + result.view_cnt + "</td>";
	                            str += "</tr>";
	                            $('#search-list').append(str);
							}
						} else {
							$('#search-list').append('<tr><td colspan="6">검색 결과가 없습니다.</td></tr>')
						}
					},
					error : function (error){
						console.log("에러발생: "+error);
					}
				});
				
/* 				$.ajax({
					url: 'qboardListSearchPaging',
					type: 'GET',
					data: {
						keyword: keyword,
						searchType: searchType
					},
					dataType: 'json',
					success: function(response) {
						alert(response.page.totalPage);
						
					}
					
				}) */
				
				
			});
		});

	</script>
</html>