<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header4.jsp" %>
<%@ include file="/WEB-INF/views/topBar.jsp" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); 
    			
/* 페이지 전체 스타일 */
section.community {
  padding: 0;
}


body {
   font-family: 'Noto Sans KR', sans-serif;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
   
}

/* 타이틀 스타일 */
.page-title {
  	margin-bottom: 30px;
}

.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}



#searchButton:hover {
  background-color: #fff;
}

/* 검색 결과 스타일 */
#searchResults {
    margin-top: 50px;
}


/* Select 조회와 글작성 부분 스타일--------------------------------------- */
#options {
    float: right; /* 오른쪽 정렬 */
    right: 0;
    margin-right: 500px;
    position: inherit;
 
}

#options select {

    border: none;
    border-radius: 5px;
}

#options input[type="submit"] {
  color: #fff; /* 글자색을 흰색(#fff)으로 설정 */
  background-color: #000; /* 배경색을 검정색(#000)으로 설정 */
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

#options input[type="submit"]:hover {
    background-color: #999; /* 이동 시 조금 어두운 그레이톤 색상 */
}


/* 테이블 스타일 */
#boardtable {
  font-size: 15px;
  height: 500px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

#boardtable a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
#boardtable a:hover {
  text-decoration: underline;
}
#boardtable th {
  text-align: center;
}

#boardtable .th-num {
  width: 100px;
  text-align: center;
}

#boardtable .th-date {
  width: 200px;
}

#boardtable .th-view_cnt {
  width: 200px;
}

#boardtable .th-replyCount{
  width: 200px;
}

#boardtable th, .board-table td {
  padding: 14px 0;
}

#boardtable tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

#boardtable tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

#boardtable tbody th p{
  display: none;
}

</style>
<meta charset="UTF-8">
<title>커뮤니티 게시판</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
    $("#searchButton").click(function () {
        var keyword = $("#keyword").val();
         if (keyword !== "") { 
         
        	 //  검색 아작스 요청
        	$.ajax({
            	type: "GET",
            	url: "listBoardSearch?keyword=" + keyword,
                dataType: "json",
                async: false,
                success: function (data) { 
                	  console.log("응답 데이터: ",data);
                	// 테이블 초기화
                    $('#boardtable > tbody').empty();

                    if (data && data.length > 0) { // 결과가 비어있지 않은 경우에만 처리
                    	 for (var i = 0; i < data.length; i++) {
                             var result = data[i];
                             console.log(result);
                             var img = "<img title='Lv."+result.user_level+" | exp."+result.user_exp+"("+result.percentage+"%)', src='/images/level/"+result.icon+".gif' >";
                             var str = '<tr>';
                             str += "<td>" + result.brd_num + "</td>";
                             str += "<td><a href='/detailCommunity?user_num=" + result.user_num + "&brd_num=" + result.brd_num + "'>" + result.title + "</a></td>";
                             str += "<td>" + img + result.nick + "</td>";
                             // 날짜 형식 변환
                             var formattedDate = new Date(result.reg_date);
                             var day = formattedDate.getDate();
                             var month = formattedDate.getMonth() + 1;
                             var year = formattedDate.getFullYear() % 100;
                             day = (day < 10) ? '0' + day : day;
                             month = (month < 10) ? '0' + month : month;
                             str += "<td>" + year + "-" + month + "-" + day + "</td>";
                             
                             str += "<td>" + result.view_cnt + "</td>";
                             str += "<td>" + result.replyCount +"</td>"; 
                             str += "</tr>";
                             $('#boardtable').append(str);
                         }
                     } else {
                         // 검색 결과가 없을 경우 처리
                         $('#boardtable > tbody').append('<tr><td colspan="6">검색 결과가 없습니다.</td></tr>');
                       
                     }
                 },
                 error: function (xhr, status, error) {
                     console.log('Ajax 호출 실패: ', error);
                 }
             });
         } else {
             // 검색어가 비어 있을 때는 페이지 리로드
             location.reload();
         }        
     });
    
    
    // 정렬 아작스 요청
    $("#sortOption").change(function() {
        var sortOption = $("#sortOption").val();

        $.ajax({
            type: "GET",
            url: "listBoardSort?sort=" + sortOption,
            dataType: "json",
            async: false,
            success: function (data) { 
          	console.log("응답 데이터: ",data);
          	// 테이블 초기화
            $('#boardtable > tbody').empty();

            if (data && data.length > 0) { // 결과가 비어있지 않은 경우에만 처리
               for (var i = 0; i < data.length; i++) {
                      var result = data[i];
                      var str = '<tr>';
                      var img = "<img title='Lv."+result.user_level+" | exp."+result.user_exp+"("+result.percentage+"%)', src='/images/level/"+result.icon+".gif' >"; // 한빛
                      str += "<td>" + result.brd_num + "</td>"; 
                      str += "<td><a href='/detailCommunity?user_num=" + result.user_num + "&brd_num=" + result.brd_num + "'>" + result.title + "</a></td>";
                      str += "<td>" + img + result.nick + "</td>"; // 한빛 
                      // 날짜 형식 변환
                      var formattedDate = new Date(result.reg_date);
                      var day = formattedDate.getDate();
                      var month = formattedDate.getMonth() + 1;
                      var year = formattedDate.getFullYear() % 100;
                      day = (day < 10) ? '0' + day : day;
                      month = (month < 10) ? '0' + month : month;
                      str += "<td>" + year + "-" + month + "-" + day + "</td>";
                      
                      str += "<td>" + result.view_cnt + "</td>";
                      str += "<td>" + result.replyCount +"</td>";
                      str += "</tr>";
                      $('#boardtable').append(str);
                  }
              } else {
                   // 검색 결과가 없을 경우 처리
                  $('#boardtable > tbody').append('<tr><td colspan="6">검색 결과가 없습니다.</td></tr>');
                 
               }
           },         error: function (xhr, status, error) {
                console.log("정렬 아작스 호출 실패: " + error);
            }
        });
    });
});  
    

</script>

</head>
<body>
<section class="community">
<div class="container text-center" style="padding-bottom: 0px; padding-top: 0px;">
    <h3 style="margin-bottom: 5px;">자유게시판</h3>
</div>


    <!-- 게시판 검색 (옵션 제목, 작성자)-->
<div class="container d-flex justify-content-center" style="padding-bottom: 0px;">
    <div class="d-flex justify-content-center">
        <div class="input-group input-group-merge">
            <input class="form-control form-control-xs" id="keyword" type="search" placeholder="제목/작성자 검색" value="${srch_word}">
			<div class="input-group-append">
			    <button class="btn btn-outline-border btn-search" id="searchButton" style="height: 40px;">
			        <i class="fe fe-search"></i>
			    </button>
			</div>

        </div>
    </div>
</div>

<div id="searchResults" style=" margin-top: 20px;"></div>

	
        <!-- 게시판리스트  -->
        <div id="board-list">
            <div class="container" style="padding-top: 0px;">
                <!-- select 조회/ 게시글작성 버튼  -->
            <div class="d-flex justify-content-end mb-3">
			<select class="form-select form-select-xxs w-auto" id ="sortOption"name="sortOption">
			    <option value="reg_date">최근 게시물</option>
			    <option value="view_cnt">조회수 높은 순</option>
			</select>
			</div>
			  <div class="d-flex mb-3" style="justify-content: flex-start;">
			<form id="options" action="writeFormCommunity" method="post" class="text-end">
			    <button class="btn btn-secondary btn-xs" type="submit" style="background-color: #E56D90;">글 작성 <i class="fe fe-arrow-right ms-2"></i></button>
			</form>
			</div>	
             <c:set var="num" value="${boardPage.total - boardPage.start+1 }"></c:set> 
                <table id="boardtable">
                    <thead>
                        <tr>
                            <th scope="col" class="th-num">번호</th>
                            <th scope="col" class="th-title">제목</th>
                            <th scope="col" class="th-nick">작성자</th>
                            <th scope="col" class="th-date">등록일</th>
                            <th scope="col" class="th-view_cnt">조회수</th>
                            <th  scope="col" class="th-replyCount">댓글수</th>
                        </tr>
                    </thead>                 
                    <tbody>
                        <c:forEach var="board" items="${listCommunity}">
                            <tr>
                                <td>${num}</td>
                                <td><a href="detailCommunity?user_num=${board.user_num}&brd_num=${board.brd_num}">${board.title}</a></td>
                                <td><img title="Lv.${board.user_level } | exp.${board.user_exp}(${board.percentage }%)" src="/images/level/${board.icon}.gif">${board.nick}</td>
                                <td><fmt:formatDate value="${board.reg_date}" pattern="yy-MM-dd"/></td>
                                <td>${board.view_cnt}</td>
				         		<td>${board.replyCount}</td>
				         		<c:set var="num" value="${num-1}"></c:set> 			       
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

			<div class="container text-center">
			     <ul class="pagination pagination-sm justify-content-center">
			        <c:if test="${boardPage.startPage > boardPage.pageBlock}">
			            <li class="page-item">
			                <a class="page-link page-link-arrow" href="listCommunity?currentPage=${boardPage.startPage-boardPage.pageBlock}">
			                    <i class="fa fa-caret-left"></i>
			                </a>
			            </li>
			        </c:if>
			
			        <c:forEach var="i" begin="${boardPage.startPage}" end="${boardPage.endPage}">
			            <li class="page-item <c:if test='${boardPage.currentPage == i}'>active</c:if>">
			                <a class="page-link" href="listCommunity?currentPage=${i}">${i}</a>
			            </li>
			        </c:forEach>
			
			        <c:if test="${boardPage.endPage < boardPage.totalPage}">
			            <li class="page-item">
			                <a class="page-link page-link-arrow" href="listCommunity?currentPage=${boardPage.startPage+boardPage.pageBlock}">
			                    <i class="fa fa-caret-right"></i>
			                </a>
			            </li>
			        </c:if>
			    </ul>
			</div>
            </div>
        </div>
 </section>
</body>


<!--비로그인 자가 글작성 시도시 알람창 띄우면서 로그인 페이지로 넘겨버리기  ---------->
<script>
    document.addEventListener('DOMContentLoaded', function () {
    	  const form = document.getElementById('options');
          form.addEventListener('submit', function (event) {
            // 세션의 user_num 값 확인
            const userNum = <%= session.getAttribute("user_num") %>;

            // user_num이 null인 경우 알림창 띄우고 로그인 페이지로 이동
            if (userNum === null) {
                alert('로그인 후 이용해주세요!');
                event.preventDefault(); // 폼 전송을 막음
                window.location.href = '/loginForm'; // 로그인 페이지로 이동
            }
        });
    });
</script>


<%@ include file="footer.jsp" %>
</html>