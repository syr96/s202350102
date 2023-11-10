<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row" id="list2">
    <c:forEach var="board" items="${sharing}">
  
        <div class="col-6 col-md-4">
            <div class="card mb-7">
                <div class="card-img">
                    <button class="btn btn-xs btn-circle btn-white-primary card-action card-action-end" onclick="likePost(${board.brd_num})">
                        <i class="fe fe-heart"></i>
                    </button>
                   <button class="btn btn-xs w-100 btn-dark card-btn" onclick="location.href='detailSharing?user_num=${board.user_num}&brd_num=${board.brd_num}'">
				    <i class="fe fe-eye me-2 mb-1"></i> 자세히 보기
					</button>

                  <img class="card-img-top" src="${pageContext.request.contextPath}/upload/${board.img}" alt="..." style="width: 100%; height: 250;">
					 </div>
                <div class="card-body fw-bold text-center">
                    <a class="text-body" href="detailSharing?user_num=${board.user_num}&brd_num=${board.brd_num}">
                        ${board.title}
                    </a><p>
                    <a class="text-primary" href="detailSharing?user_num=${board.user_num}&brd_num=${board.brd_num}">
                        ${board.price}원</a><p>
                    <a class="text-primary"><i class="fas fa-heart me-1"></i> ${board.like_cnt}</a>
                    						<i class="fe fe-eye me-1 mb-1" style="margin-left: 30px;"></i> ${board.view_cnt}
                    				
				</div>
				 
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>