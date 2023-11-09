<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>     
<!DOCTYPE html>
<html>
 <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!--제목, 회원 닉네임 띄우기, 내용, 작성일자, 첨부파일 -->
 	<h3>게시글 작성</h3>
 	 <c:if test="${msg!=null}">${msg}</c:if>
 <form action="/writeCommunity"  method="post" enctype="multipart/form-data" name="writeCommunity">
 	 	
	       <input type="hidden" name="brd_lg" id="brd_lg" value="700" readonly>
	       <input type="hidden" name="brd_md" id="brd_md" value="103" readonly>
    	
 	 	 <div>
            <label for="title">제목</label>
            <input type="text" name="title" id="title" required>
        </div>
        <div>
            <label for="conts">내용</label>
            <textarea name="conts" id="conts" rows="10" required></textarea>
        </div>
        <div>
            <label for="file">첨부 파일</label>
            <input type="file" name="file" id="file">
        </div>
	   <input type="submit" value="작성">	      
 </form>
	
</body>
</html>