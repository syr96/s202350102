<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />

	<!-- Title -->
	<title>소세지들</title>
</head>
<body>
<!-- 
나중에 챌린지 상세페이지에 import로 넣을 수 있을지도?!
시도해보기
 -->
	<!-- header -->
	<c:import url="/WEB-INF/views/header4.jsp"/>
	
	<!-- content -->
	<div class="review">
		<!-- Body -->
		<c:forEach var="ssj" items="${listSsj}">
			<div class="review-body">
				<div class="row">
					<!-- profile -->
					<div class="col-12 col-md-auto">	
						<div class="avatar avatar-xxl mb-6 mb-md-0">
							<span class="avatar-title rounded-circle">
								<img src="${ssj.img}" alt="profile" class="avatar-title rounded-circle">
							</span>
						</div>
					</div>

					<!-- nick -->
					<div class="col-12 col-md">
						<div class="row mb-6">
							<div class="col-12">
								<a href="#" data-bs-toggle="modal" data-bs-target="#userModal"><span>${ssj.nick}</span></a>
								<!-- 색깔 빨간색으로 나옴. 나중에 색 변경해야함 -->
							</div>
						</div>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-body">
									<div class="col-12 col-md-auto">	
										<div class="avatar avatar-xxl mb-6 mb-md-0">
											<span class="avatar-title rounded-circle">
												<img src="${ssj.img}" alt="profile" class="avatar-title rounded-circle">
											</span>
										</div>
									</div>
									<div class="col-12 col-md">
										<div class="row mb-6">
											<div class="col-12">
												<span>${ssj.nick}</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-primary" onclick="follow()">팔로우</button>
									<button type="button" class="btn btn-outline-success" onclick="sendMessage()">쪽지보내기</button>
								</div>
							</div>
						</div>
					</div>




					<!-- reg_date & fork -->
					<div class="col-12 col-md">
	
						<!-- reg_date -->
						<div class="row mb-6">
							<div class="col-12">
								<span>${ssj.brd_reg_date}</span>
							</div>
						</div>
						<c:choose>
							<c:when test="${sessionScope.user_num != null}">
								<!-- 로그인 한 상태 -->
								<!-- fork -->
								<div class="row align-items-center">
									<div class="col-auto">
										<!-- Button -->
										<a class="btn btn-xs btn-outline-border" href="user_num=${ssj.user_num}">FORK</a>
									</div>
								</div>
							</c:when>

							<c:when test="${sessionScope.user_num == null}">
								<!-- 로그인 안 한 상태 -->
								<!-- loginForm으로 이동 -->
								<div class="row align-items-center">
									<div class="col-auto">
										<!-- Button -->
										<a class="btn btn-xs btn-outline-border" href="/loginForm">FORK</a>
									</div>
								</div>
							</c:when>
						</c:choose>
					</div>

				</div>
				
			</div>

		</c:forEach>
	  
	</div>
	
	<!-- footer -->
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>