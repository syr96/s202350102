<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ya/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="community">
  <div class="page-title">
        <div class="container">
            <h3>자유게시판</h3>
        </div>
    </div>

    <!-- 게시판 검색-->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action=" ">
                    <div class="search-wrap">
                        <label for="search" class="blind">게시글 검색</label>
                        <input id="search" type="search" name="" placeholder="제목/작성자를 검색해주세요" value="">
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

 <!-- select 검색 -->
  <form action=" ">
    <select name="">
	<option value="">조회수 높은순</option>
	<option value="">최근 등록일 순</option>
    </select> 
  </form>

  <!-- 게시판리스트 -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">

                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                  <th scope="col" class="th-name">작성자</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-cnt">조회수</th>
                    <th scope="col" class="th-re_cnt">댓글수</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="board" items="${listBoard}">
	    		<tr>
                    <td>${brd_Num}</td>
                    <th><a href="detailBoard?user_num=${user_num }">${title}</a></th>
                    <td>${user1.nick}</td> <!--회원닉네임-->
                    <td>${reg_date}</td>
                    <td>${view_cnt}</td>
                    <td></td>
                </tr>
                </c:forEach>
                </tbody>
                
            </table>
        </div>
    </div>

</section>
	
</body>
</html>