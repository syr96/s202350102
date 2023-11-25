<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독관리</title>
<%@ include file="/WEB-INF/views/header4.jsp" %>
</head>
<body>

	 <div class="container">
         <div class="row profile">
			<!-- 마이페이지 사이드바  -->         
            <div class="col-md-3">
                <%@ include file="../mypageMenu.jsp" %>
            </div>
            
            <!-- 마이페이지 본문 -->
<!--             <div class="row"> -->
             <div class="col-md-9 profile-form">
             	<div class="row">
					<div class="col-md-12 my-3"><b>멤버쉽</b></div>
					
					<div class="col-md-9">
					<table class="table table-bordered table-sm">
					  <thead>
					    <tr>
					      <th scope="row" colspan="3"> <img alt="premiumLogo.png" src="images/th/premiumLogo.png" width="100px" height="30px"><br>
					      								개인 멤버쉽: ₩<fmt:formatNumber type="number" maxFractionDigits="3" value="${order1.price }" />원</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr  class="py-5" style="border-bottom: none; border-top: none;">
					      <th  class="py-4" scope="row" colspan="3">${user1.user_name }님 안녕하세요. <br>
					      							  ${order1.mem_name } 상품을 구매 해주셔서 감사합니다.</th>
					    </tr>
					    <tr class="py-3" style="border-bottom: none; border-top: none;">
					      <th class="py-3" scope="row" colspan="3">결제 완료일: <fmt:formatDate value="${order1.suc_date }" pattern="yyyy년 MM월 dd일, HH시 mm분 ss초"></fmt:formatDate></th>
					    </tr>
					    <tr class="py-3" style="border-bottom: none; border-top: none;">
					      <th class="py-3" scope="row" colspan="3">결제 수단: ${order1.pay_type }</th>
					    </tr>
					    <tr style="border-top: none;">
					      <th class="d-flex justify-content-end" ><button type="button" class="btn btn-dark btn-sm">구독취소</button></th>
					    </tr>
					  </tbody>
					</table>
					</div>
					
					<div class="col-md-2"></div>
				</div>
			</div>
		
		</div>
	</div>

</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>