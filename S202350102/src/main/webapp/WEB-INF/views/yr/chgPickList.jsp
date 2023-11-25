<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach var="pickList" items="${chgPickList }">

	<div class="col px-4" style="max-width: 250px;">
		<div class="card">
		
			<!-- Image -->
			<a class="text-body" href="chgDetail?chg_id=${pickList.chg_id }">
			
				<c:if test="${pickList.thumb != null}">
					<img class="card-img-top" src="${pageContext.request.contextPath}/upload/${pickList.thumb}" alt="thumb" style="width: 100%; height: 250px; border-radius: 10px;" >
				</c:if>
				
				<c:if test="${pickList.thumb == null}">
					<img class="card-img-top" src="./assets/img/chgDfaultImg.png" alt="chgDfault" style="width: 100%; height: 250px; border-radius: 10px;">
				</c:if>
			</a>
		
			<!-- Body -->
			<div class="card-body py-4 px-0 text-start">
			
			    <a class="text-body fw-bolder fs-6" href="chgDetail?chg_id=${pickList.chg_id }">${pickList.title }</a>
			
				<div> 
				    <fmt:formatDate value="${pickList.create_date }" pattern="yyyy-MM-dd"></fmt:formatDate>
				~ 
					<fmt:formatDate value="${pickList.end_date }" pattern="yyyy-MM-dd"></fmt:formatDate>
		        </div>
		
		    </div>
		
		</div>
	</div>

</c:forEach>