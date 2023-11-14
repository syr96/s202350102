<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header4.jsp" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 
<!DOCTYPE html>
<html>
<head>

<style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); 
    			
/* 페이지 전체 스타일 */
section.community {
  padding: 100px 0;
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

/* 검색 박스 스타일 */
#serachBox .search-window .search-wrap {
  position: relative;
  padding-right: 50px;
  margin: 0 auto;
  width: 80%;
  max-width: 564px;
}

#searchBox.search-window {
  padding: 15px 15px;
  background-color: #f9f7f9;
  
}
#searchBox .search-window .search-wrap input {
  height: 50px;
  width: 30%;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
}
#searchBox.search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}
#searchBox.search-window .search-wrap .btn {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 108px;
  padding: 0;
  font-size: 16px;
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
  height: 300px;
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

/*버튼  */
.btn {
  height: 49.5px; 
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
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
                             var str = '<tr>';
                             str += "<td>" + result.brd_num + "</td>";
                             str += "<td><a href='/detailCommunity?user_num=" + result.user_num + "&brd_num=" + result.brd_num + "'>" + result.title + "</a></td>";
                             str += "<td>" + result.nick + "</td>";
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
                     console.log("Ajax 호출 실패: " + error);
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
                      str += "<td>" + result.brd_num + "</td>";
                      str += "<td><a href='/detailCommunity?user_num=" + result.user_num + "&brd_num=" + result.brd_num + "'>" + result.title + "</a></td>";
                      str += "<td>" + result.nick + "</td>";
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
        <div class="page-title">
            <div class="container">
                <h3>자유게시판</h3>
            </div>
        </div>

    <!-- 게시판 검색 (옵션 제목, 작성자)-->
     <div id="searchBox">
     	 <div class="container">
       		<div class="search-window">

                  <div class="search-wrap">       			
	            	<input type="search" id="keyword" placeholder="제목/작성자 검색" value="${srch_word}">
	            	<button id="searchButton" class="btn btn-dark">검색</button>
	              </div>
 	
      	 	</div> 
      	 </div>   
     </div>
     
        <div id="searchResults">
            
        </div>

    <!-- select 조회/ 게시글작성 버튼  -->
        <div id="options">
            <form action="writeFormCommunity" method="post">
                <select id="sortOption" name="sortOption">
                     <option value="view_cnt">조회수 높은순</option>
            	     <option value="reg_date">최근 등록일 순</option>
                </select>         
                <input type="submit" value="글작성">
            </form>
        </div>

        <!-- 게시판리스트  -->
        <div id="board-list">
            <div class="container">
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
                                <td>${board.nick}</td>
                                <td><fmt:formatDate value="${board.reg_date}" pattern="yy-MM-dd"/></td>
                                <td>${board.view_cnt}</td>
				         		<td>${board.replyCount}</td>
				         		<c:set var="num" value="${num-1}"></c:set> 			       
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
				   <div class="page">
				    <c:if test="${boardPage.startPage >boardPage.pageBlock}">
				        <a href="listCommunity?currentPage=${boardPage.startPage-boardPage.pageBlock}">[이전]</a>
				    </c:if>
				    <c:forEach var="i" begin="${boardPage.startPage}" end="${boardPage.endPage}">
				        <a href="listCommunity?currentPage=${i}">[${i}]</a>
				    </c:forEach>
				    <c:if test="${boardPage.endPage < boardPage.totalPage}">
				        <a href="listCommunity?currentPage=${boardPage.startPage+boardPage.pageBlock}">[다음]</a>
				    </c:if>
				</div>
            </div>
        </div>
    </section>
</body>
<%@ include file="footer.jsp" %>
</html>