<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>쉐어링</h1>
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
                <c:forEach var="board" items="${Sharing}">
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