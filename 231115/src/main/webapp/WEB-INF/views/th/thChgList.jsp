<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="./assets/favicon/favicon.ico" type="image/x-icon" />
    
    <!-- Libs CSS -->
    <link rel="stylesheet" href="./assets/css/libs.bundle.css" />
    
    <!-- Theme CSS -->
    <link rel="stylesheet" href="./assets/css/theme.bundle.css" />
<title>챌린지 리스트</title>
<script type="text/javascript">
	function fn_sortOpt(){
		var sortOpt = $('#sortOpt').val()
 		var state_md 	= 	${chg.state_md}
 		var chg_lg 		= 	${chg.chg_lg}
 		var chg_md 		= 	${chg.chg_md}

		location.href= 'thChgList?state_md='+state_md
								+'&chg_lg='+chg_lg
								+'&chg_md='+chg_md
								+'&sortOpt='+sortOpt;
	}
</script>
</head>

<body>
<%-- <h4>챌린지 목록 전체 챌린지개수 : ${totalChg } , ${pageContext.request.contextPath}</h4> --%>
    <section class="py-11">
      <div class="container">
        <div class="row">
        
        
        
          <div class="col-12 col-md-4 col-lg-3">

            <!-- Filters -->
            <form class="mb-10 mb-md-0">
              <ul class="nav nav-vertical" id="filterNav">
                <li class="nav-item">

                  <!-- Toggle -->
                  <a class="nav-link dropdown-toggle fs-lg text-reset border-bottom mb-6" data-bs-toggle="collapse" href="#ingChallenge" id="ingDropDown">
                    	진행중 챌린지
                  </a>

                  <!-- Collapse -->
                  <div class="collapse" id="ingChallenge">
                    <div class="form-group">
                      <ul class="list-styled mb-0" id="chgCtNav">
                        <li class="list-styled-item">
                          <a class="list-styled-link" href="/thChgList?state_md=102">
                            	전체
                          </a>
                        </li>
                        <c:forEach var="comm" items="${chgCategoryList }">
	                        <li class="list-styled-item" >
	                          <a class="list-styled-link" href="/thChgList?state_md=102&chg_lg=${comm.lg }&chg_md=${comm.md}">${comm.ctn }</a>
	                        </li>
                        </c:forEach>
                      </ul>
                    </div>
    			  </div>
    			  
    			</li>
    
    
    
     			<li class="nav-item">

                  <!-- Toggle -->
                  <a class="nav-link dropdown-toggle fs-lg text-reset border-bottom mb-6" data-bs-toggle="collapse" href="#endChallenge">
                    	종료된 챌린지
                  </a>

                  <!-- Collapse -->
                  <div class="collapse" id="endChallenge">
                    <div class="form-group">
                      <ul class="list-styled mb-0" id="productsNav">
                        <li class="list-styled-item">
                          <a class="list-styled-link" href="/thChgList?state_md=103">전체</a>
                        </li>
                        <c:forEach var="comm" items="${chgCategoryList }">
	                        <li class="list-styled-item">
	                          <a class="list-styled-link" href="/thChgList?state_md=103&chg_lg=${comm.lg }&chg_md=${comm.md}">${comm.ctn }</a>
	                        </li>
                        </c:forEach>
                      </ul>
                    </div>
                  </div>
			<li>	
				<div style="text-align: center;">
	               <button class="btn btn-primary mb-1" onclick="location.href='/chgApplicationForm'">
	            		  챌린지 신청하기 <i class="fe fe-arrow-right ms-2"></i>
	            	</button>
	         	</div>
            </li>
                
              </ul>
            </form>
          </div>
         
		  <div class="col-12 col-md-8 col-lg-9">
			<!-- Header -->
            <div class="row align-items-center mb-7">
              <div class="col-12 col-md">

                <!-- Heading -->
                <h3 class="mb-1">챌린지</h3>

              </div>
              <div class="col-12 col-md-auto">

                <!-- 필터 조회 -->
                <select class="form-select form-select-xs" id="sortOpt" onchange="fn_sortOpt()"> 
                  <option value="create_date" 	<c:if test="${sortOpt eq 'create_date' }">	selected="selected"</c:if>>최신등록순</option>
                  <option value="pick_cnt" 		<c:if test="${sortOpt eq 'pick_cnt' }">		selected="selected"</c:if>>찜순</option>
                  <option value="participants" 	<c:if test="${sortOpt eq 'participants' }">	selected="selected"</c:if>>참여자순</option>
                </select>

              </div>
            </div> 
             
            <!-- 챌린지 리스트 조회  -->
            <div class="row">
	            <c:set var="num" value="${page.total-page.start+1 }"></c:set>
	            	<c:forEach var="chg" items="${listChg }">
			            <div class="col-6 col-md-4">
						
			               <!-- Card -->
			              <div class="card mb-7">
			
			                <!-- Image -->
			                <div class="card-img">
			
			                  <!-- Action -->
			                  <button class="btn btn-xs btn-circle btn-white-primary card-action card-action-end" data-toggle="button">
			                  <i class="fe fe-heart"></i>
			                  </button>
			
			                  <!-- Button -->
			                  <button class="btn btn-xs w-100 btn-dark card-btn">
			                    <i class="fe me-2 mb-1"></i>챌린지에 도전하세요!
			                  </button>
			
			                  <!-- Image -->
			                  <a class="text-body" href="chgDetail?chg_id=${chg.chg_id }">
			                  <c:if test="${chg.thumb != null}">
			                  <img class="card-img-top" src="${pageContext.request.contextPath}/upload/${chg.thumb}" alt="thumb" style="width: 100%; height: 250;" >
			                  </c:if>
			                  <c:if test="${chg.thumb == null}">
			                  <img class="card-img-top" src="assets/img/chgDfaultImg.png" alt="logo01" style="width: 100%; height: 250;">
			                  </c:if>
							  </a>
			              </div>
			
			              <!-- Body -->
			              <div class="card-body fw-bold text-center">
			                <a class="text-body" href="chgDetail?chg_id=${chg.chg_id }">${chg.title }</a>
			                <div class="text-muted">참여기간<br> 
			                 <fmt:formatDate value="${chg.create_date }" pattern="yyyy-MM-dd"></fmt:formatDate>
			                  ~ 
			                 <fmt:formatDate value="${chg.end_date }" pattern="yyyy-MM-dd"></fmt:formatDate>
			                 </div>
			              </div>
							<fmt:formatDate value="${noticeConts.reg_date }" pattern="yy-MM-dd"/>
			            </div>
					  </div>
					  <c:set var="num" value="${num -1 }"></c:set>
				</c:forEach>
				
				<!-- 페이지네이션  -->
				 <nav class="d-flex justify-content-center justify-content-md-center">
      	   		 <ul class="pagination pagination-sm text-gray-400">
				  	<c:if test="${page.startPage > page.pageBlock }">
				  		<li class="page-item">
							<a class="page-link page-link-arrow" href="thChgList?currentPage=${page.startPage-page.pageBlock }">
							<i class="fa fa-caret-left">이전</i></a>
						</li>
					</c:if>
					
				    <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
						<li class="page-item">
								<a class="page-link" href="thChgList?currentPage=${i }">${i}</a>
						</li>
					</c:forEach>
				    <c:if test="${page.endPage < page.totalPage }">
				    	<li class="page-item">
							<a class="page-link page-link-arrow" href="thChgList?currentPage=${page.startPage + page.pageBlock }">
							<i class="fa fa-caret-right">다음</i></a>
						</li>
					</c:if>
				 </ul>
		  		</nav>
			</div>
		
      </div>
      	  
    </div>
  </div>
</section>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>