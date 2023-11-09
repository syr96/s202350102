<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>

<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<head>
<style type="text/css">
* 게시글 상세내용 페이지 스타일 */

/* 제목 스타일 */
h3 {
    text-align: center;
    font-size: 24px;
    color: #0099cc;
    margin-bottom: 20px;
}

/* 테이블 스타일 */
table {
    border-collapse: collapse;
    width: 80%;
    margin: 0 auto;
}

table, th, td {
    border: 1px solid #ccc;
}

th, td {
    padding: 10px;
    text-align: left;
}

/* 버튼 스타일 (수정, 삭제 버튼) */
.btn {
    display: inline-block;
    padding: 10px 20px;
    background-color: #0099cc;
    color: #fff;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    margin-right: 10px;
}

.btn-danger {
    background-color: #ff0000;
}

.btn:hover {
    background-color: #0077a8;
}

/* 버튼 컨테이너 스타일 */
.button-container {
    text-align: center;
    margin-top: 20px;
}

/* 내용 스타일 */
#board-content {
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* 댓글 수정 폼 기본적으로 숨김 */
.comment-edit-form {
    display: none;
}

/* 수정 버튼 클릭 시 댓글 수정 폼 표시 */
.comment-update-btn-clicked + .comment-edit-form {
    display: block;
}

</style>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<h3>게시글 상세내용 확인</h3>

<input type="hidden" name="brd_num" value="${board.brd_num}"> 

<c:if test="${loggedIn}">
    <c:if test="${board.user_num == sessionScope.user_num}">
        <div class="button-container">
            <a href="updateCommunityForm?brd_num=${board.brd_num}" class="btn btn-primary">수정</a>
            <a href="deleteCommunity?brd_num=${board.brd_num}" class="btn btn-primary">삭제</a>
        </div>
    </c:if>
</c:if>

<!-- 게시글 상세 내용 확인 -->
<input type="hidden" name="brd_step" value="${board.brd_step}"> 
<input type="hidden" name="brd_group" value="${board.brd_group}"> 
<c:choose>
    <c:when test="${board.brd_step == 0}">
        <table>
            <tr>
                <th>제목</th>
                <td>${board.title}</td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>${board.nick}</td>
            </tr>
            <tr>
                <th>조회수</th>
                <td>${board.view_cnt}</td>
            </tr>
            <tr>
                <th>작성일자</th>
                <td>${board.reg_date}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td id="board-content">${board.conts}</td>
            </tr>
        </table>
    </c:when>
</c:choose>


<%@ include file="./commentForm.jsp" %>
</body>
</html>