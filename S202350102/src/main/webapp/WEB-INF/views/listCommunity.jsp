<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header4.jsp" %>
<link rel="stylesheet" type="text/css" href="yaCss/Community.css">
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 
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
                <form action="listBoardSearch" method="get">
                    <div class="search-wrap">
                        <label for="search" class="blind">게시글 검색</label>
                        <input id="search" type="search" name="keyword" placeholder="제목/작성자 검색">
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


 <!-- select 조회  -->
 <div class="styled-select ">
	  <form action=" ">
	    <select  name="">
		<option value="">조회수 높은순</option>
		<option value="">최근 등록일 순</option>
	    </select> 
	    <span class="fa fa-sort-desc"></span>
	  </form>
  </div>
  
 <!--게시글 작성-->
 <div class="board-write">
 	<form action="writeFormCommunity" method="post" >
 		<input type="submit" value="글작성">
 	</form>
 </div>	
		

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
                <c:forEach var="board" items="${listCommunity}">
	    		<tr>
                    <td>${board.brd_num}</td>
                    <th><a href="detailCommunity?user_num=${board.user_num}&brd_num=${board.brd_num }">${board.title}</a></th>
                    <td>${board.nick}</td> <!--회원닉네임-->
                    <td>${board.reg_date}</td>
                    <td>${board.view_cnt}</td>
                    <td><!-- 댓글수 넣어야함 --></td>
                </tr>
                </c:forEach>
                </tbody>
                
            </table>
        </div>
    </div>

</section>



</body>
</html>