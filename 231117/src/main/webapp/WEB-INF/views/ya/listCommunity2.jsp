<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header4.jsp" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 
<!DOCTYPE html>
<html>
<head>
<!--  CSS  -->
<link rel="shortcut icon" href="./assets/favicon/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./assets/css/libs.bundle.css" />
<link rel="stylesheet" href="./assets/css/theme.bundle.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<!--css  -->
<style type="text/css">
/* 페이지 전체 스타일 */

body {
    font-family: Arial, sans-serif;
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
    background-color: #fff;
    color: #353535;
    padding: 10px;
    text-align: center;
    margin-bottom: 20px;
}

/* 검색 박스 스타일 */
#searchBox {
    text-align: center; /* 수평 가운데 정렬 */
    margin: 0 auto;    /* 수평 가운데 정렬을 위한 가운데 마진 설정 */
    width: 30%;        /* 화면 폭의 절반만 사용 */
}
#keyword {
    padding: 10px;
    width: 80%;         /* 검색창 너비 확장 */
    border: 1px solid #ccc;
    border-radius: 5px;
  }
}

#searchButton {
    padding: 10px 20px;
    background-color: #fff;
   	color: #1f1f1f;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

#searchButton:hover {
    background-color: #fff;
}

/* 검색 결과 스타일 */
#searchResults {
    margin-top: 50px;
}

/* Select 조회와 글작성 부분 스타일 */
#options {
    float: right; /* 오른쪽 정렬 */
    margin-top: -50px; /* 표 바로 위에 위치 */
    margin-right: 20px;
    position: absolute;
 
}

#options select {
    background-color: #fff; 
    border: none;
    border-radius: 5px;
}

#options input[type="submit"] {
    background-color: #fff; 
    color: #000;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

#options input[type="submit"]:hover {
    background-color: #999; /* 이동 시 조금 어두운 그레이톤 색상 */
}


/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
}

table th {
    background-color: #FFDDDD;
    color: #353535;
    text-align: center;
}

table th, table td {
    padding: 10px;
    border: 1px solid #ccc;
}

/* 게시판 리스트 스타일 */
#board-list {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    margin-top: 20px;
}

/* 게시판 테이블 스타일 */
#boardtable {
    width: 100%;
}
</style>

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
                             str += "<td>" + result.reg_date + "</td>";
                             str += "<td>" + result.view_cnt + "</td>";
                             str += "<td></td>"; // 댓글 수 넣어야 함
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
                      str += "<td>" + result.reg_date + "</td>";
                      str += "<td>" + result.view_cnt + "</td>";
                      str += "<td></td>"; // 댓글 수 넣어야 함
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

        <!-- 게시판 검색 (옵션 제목, 작성자), 글작성 -->
    
        <div id="searchBox">
            <input type="text" id="keyword" placeholder="검색어 입력" value="${srch_word }">
            <button id="searchButton">검색</button>
        </div>

        <div id="searchResults">
            <!-- 검색 결과가 여기에 추가 -->
        </div>

        <!-- select 조회 게시글작성  -->
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
                <table id="boardtable">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>조회수</th>
                            <th >댓글수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="board" items="${listCommunity}">
                            <tr>
                                <td>${board.brd_num}</td>
                                <td><a href="detailCommunity?user_num=${board.user_num}&brd_num=${board.brd_num}">${board.title}</a></td>
                                <td>${board.nick}</td>
                                <td>${board.reg_date}</td>
                                <td>${board.view_cnt}</td>
                                <td></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</body>
<%@ include file="footer.jsp" %>
</html>