<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ include file="/WEB-INF/views/header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/qBoardDetail.css">
<style>
  .custom-hr {
    border: 1px solid #000; /* 기본 테두리 스타일 */
    border-width: 0 0 2px 0; /* 아래쪽 테두리만 두껍게 설정 */
  }
  
  #test{  
    min-height: 200px; /* 최소 높이를 200px로 설정 */
    
  }
</style>

</head>
<body>	
	<div id="qbd-main" class="qbd-main" style="height: auto;">
		<div class="qbd-mainbody" style="height: auto;">
			<div id="qbd-title" class="qbd-title">
				<div class="qbd-title-content">
					<span class="title-text">${noticeConts.title }</span>
				</div>
				<div class="qbd-object">
					<form action="noticeUpdateForm" onsubmit="return chk()">
						<input type="hidden" value="${noticeConts.brd_num  }" name="brd_num">
						<input type="hidden" value="${noticeConts.user_num  }" name="user_num">					
						<c:if test="${status_md==102 }">
							<input type="submit" value="수정" class="btn-danger btn-xxs">
							<input type="button" value="삭제" onclick="location.href='deleteNoticeForm?brd_num=${noticeConts.brd_num}'" class="btn-danger btn-xxs">
						</c:if>
						<input type="button" value="목록" onclick="location.href='notice?brd_md=${noticeConts.brd_md}'" class="btn-danger btn-xxs">
					</form>
				</div>	
			</div>
			<div class="qbd-line">
				<div class="qbd-line-box">
					<span class="qbd-line-box-text">작성자: ${noticeConts.nick }</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="qbd-line-box-text">작성일: <fmt:formatDate value="${noticeConts.reg_date }" pattern="yyyy-MM-dd"/></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="qbd-line-box-text">카테고리: ${noticeConts.category }</span>
				</div>
				<!-- <div class="qbd-line-li"></div> -->
			</div>
			<hr class="custom-hr">
			<div class="container">
    			<div class="row border">
    				<div class="col-8 p-4 mt-4" >
						<div class="qbd-content">
						<div class="qbd-content text"  id="test">
							<c:if test="${not empty noticeConts.img }"><img alt="UpLoad Image" src="${pageContext.request.contextPath}/upload/${noticeConts.img}"><p></c:if>				
							<span>${noticeConts.conts }</span>
						</div>
						
						</div>
					</div>   			
				</div>
			</div>
			<hr class="custom-hr">				
		</div>
	</div>
	
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>