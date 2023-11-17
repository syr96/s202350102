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
	        <span>문의게시판${keyword }</span>
	      </div>
	      <div class="qe_extra_box">
	      	<div class="qe_select_box">
	      		<c:if test="${user1.status_md == 102 }">
			      	<select name="brd_md" id="brd_md">
			      		<option value="all" selected="selected">전체</option>
			      		<option value="user">회원관련</option>
			      		<option value="buggy">버그</option>
			      		<option value="challenge">챌린지</option>
			      		<option value="sharing">쉐어링</option>
			      		<option value="follow">팔로워</option>
			      		<option value="suggest">기타/건의</option>
			      	</select>
		      	</c:if>
	      	</div>
	      	<div class="qe_write_box">
		        <c:if test="${user1.user_id != null }">
					<a href="qBoardWriteForm"><span>글쓰기</span></a>
				</c:if>	      	
	      	</div>

	      </div>
	      <div class="tb_body">
	      <c:set var="num" value="${page.total-page.start+1 }"></c:set>
	        <table class="tb_main">
	          <thead class="tb_thead">
	              <tr>
	                <td>번호</td>
	                <td>제목</td>
	                <td>작성자</td>
	                <td>카테고리</td>
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
							<td>${board.category }</td>
							<td><fmt:formatDate value="${board.reg_date }" pattern="yy-MM-dd"/></td>
							<td>${board.view_cnt}</td>
							<c:set var="num" value="${num-1 }"></c:set>
						</tr>
					</c:if>
				</c:forEach>
	          </tbody>
	        </table>
	        <c:if test="${searchInfo.keyword == null }">
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
			</c:if>
			<c:if test="${searchInfo.keyword != null }">
		        <div class="page" id="page">
		        	<c:if test="${page.startPage > page.pageBlock }">
						<a href="qBoardList?currentPage=${page.startPage-page.pageBlock}&keyword=${searchInfo.keyword }&searchType=${searchInfo.searchType}&category=${searchInfo.category}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
						<a href="qBoardList?currentPage=${i}&keyword=${searchInfo.keyword }&searchType=${searchInfo.searchType}&category=${searchInfo.category}">[${i}]</a>
					</c:forEach>
					<c:if test="${page.endPage < page.totalPage }">
						<a href="qBoardList?currentPage=${page.startPage+page.pageBlock}&keyword=${searchInfo.keyword }&searchType=${searchInfo.searchType}&category=${searchInfo.category}">[다음]</a>
					</c:if>
				</div>
			</c:if>
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
    $(function() {
        // 검색 버튼 클릭 이벤트 핸들러
        function search() {
            var searchType = $('#search-select').val();
            var category = $('#brd_md').val();
            var keyword = $('.search-box').val();
/*             if (keyword == "") {
                window.location.href = "/qBoardList";
                return;
            }
 */
            $.ajax({
                url: "qboardListSearch",
                type: "GET",
                data: {
                    keyword: keyword,
                    searchType: searchType,
                    category: category
                },
                dataType: "json",
                success: function(data) {
                    $('#page').empty();
                    $('#search-list').empty();
                    var list = data.list;
                    var page = data.page;

                    if (list && list.length > 0) {
                        for (var i = 0; i < list.length; i++) {
                            var result = list[i];
                            var str = '<tr>';
                            console.log(result);
                            var img = "<img title='Lv."+result.user_level+" | exp."+result.user_exp+"("+result.percentage+"%)', src='/images/level/"+result.icon+".gif' >";
                            
                            str += "<td>" + (page.total - i) + "</td>";
                            str += "<td><a href='qBoardDetail?brd_num=" + result.brd_num + "'>" + result.title + "</a></td>";
                            str += "<td>" +img+result.nick + "</td>";
                            str += "<td>"+result.category+"</td>";
                            var formatDate = new Date(result.reg_date);
                            var day = formatDate.getDate();
                            var month = formatDate.getMonth() + 1;
                            var year = formatDate.getFullYear() % 100;
                            day = (day < 10) ? '0' + day : day;
                            month = (month < 10) ? '0' + month : month;
                            year = (year < 10) ? '0' + year : year;
                            str += "<td>" + year + '-' + month + '-' + day + "</td>";
                            str += "<td>" + result.view_cnt + "</td>";
                            str += "</tr>";
                            $('#search-list').append(str);
                        }

                        // 페이지 링크 추가
                        if (page.startPage > page.pageBlock) {
                            var prevPage = page.startPage - page.pageBlock;
                            $('#page').append('<a href="#" id="page-link" data-page="' + prevPage + '">[이전]</a>');
                        }

                        for (var i = page.startPage; i <= page.endPage; i++) {
                            $('#page').append('<a href="#" id="page-link" data-page="' + i + '">[' + i + ']</a>');
                        }

                        if (page.endPage < page.totalPage) {
                            var nextPage = page.startPage + page.pageBlock;
                            $('#page').append('<a href="#" id="page-link" data-page="' + nextPage + '" >[다음]</a>');
                        }
                    } else {
                        $('#search-list').append('<tr><td colspan="30">검색 결과가 없습니다.</td></tr>');
                    }
                },
                error: function(error) {
                    console.log("에러발생: " + error);
                }
            });
        }

        // 검색 버튼 클릭 이벤트 핸들러 등록
        $(document).off('click', '.search-btn-form');
        $(document).on('click', '.search-btn-form', search);

        // Enter 키 눌렀을 때 검색 실행
        $('.search-box').off('keypress')
        $('.search-box').on('keypress', function(event) {
            if (event.keyCode == 13) {
                search();
            }
        });

        // 페이지 링크를 클릭했을 때의 이벤트 처리
        $(document).off('click', '#page-link');
        $(document).on('click', '#page-link', function searchPage() {
            var searchType = $('#search-select').val();
            var keyword = $('.search-box').val();
            var category = $('#brd_md').val();

            // 클릭한 페이지의 번호를 가져와서 해당 페이지로 이동
            var targetPage = $(this).data('page');
            window.location.href = 'qBoardList?currentPage=' + targetPage + '&keyword=' + keyword+'&searchType='+searchType+'&category='+category;
        });
    });
</script>
</html>