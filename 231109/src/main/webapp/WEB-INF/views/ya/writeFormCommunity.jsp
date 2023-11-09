<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>     
<!DOCTYPE html>
<html>
 <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<head>
<!--  CSS  -->
<link rel="shortcut icon" href="./assets/favicon/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./assets/css/libs.bundle.css" />
<link rel="stylesheet" href="./assets/css/theme.bundle.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); 
    	body{
    	font-family: 'Noto Sans KR', sans-serif;} 
			
</style>
</head>
<body>
   <section class="pt-7 pb-12">
      <div class="container">
       <!-- Heading -->
        <div class="row">
          <div class="col-12 text-center"> 
            <h3 class="mb-10"> 게시글 작성</h3>
          </div>
        </div>
        
	   <!--form  -->
      <div class="col-12 col-md-9 col-lg-8 offset-lg-1">        
     	<!--제목, 회원 닉네임 띄우기, 내용, 작성일자, 첨부파일 -->
 	 <c:if test="${msg!=null}">${msg}</c:if>
 		<form action="/writeCommunity"  method="post" enctype="multipart/form-data" name="writeCommunity"> 	 	
	       <input type="hidden" name="brd_lg" id="brd_lg" value="700" readonly>
	       <input type="hidden" name="brd_md" id="brd_md" value="103" readonly>
              <div class="col-12">
                    <!-- 제목 -->
                    <div class="form-group">
                        <label class="form-label" for="title">게시글 제목* </label>
                        <input class="form-control form-control-sm" id="title" name="title" type="text" required>
                    </div>
               </div>      
                     <!-- 작성자 닉네임 및 작성일자 -->
                    <div class="form-group mb-7">                       
                           <label class="form-label" for="nick">닉네임 *</label>
                           <input class="form-control form-control-sm" id="nick" name="nick" type="text" value="${user1.nick}" readonly>
                        
    				 </div>
					<!-- 상세내용 -->       
					<div class="form-group mb-7">
    					<label class="form-label" for="conts">내용 *</label>
    					<div class="d-flex align-items-start" style="margin-top: 10px;">
      					 	 <textarea class="form-control form-control-sm" id="conts" name="conts" rows="8" required></textarea>
  					    </div>
					</div>       
                     <!-- 이미지 업로드 -->
					<div class="form-group mb-7">
						<label class="form-label" for="file">이미지 *</label>
						<input class="form-control form-control-sm me-3" id="file" name="file" type="file">
						<img id="imgPreview" style="max-width: 200px; margin-top: 10px;" />
					</div>
					
					 <!-- Button (input 요소로 submit) -->
					<div class="col-lg-6 mb-2">
					    <button type="submit" class="btn btn-outline-dark w-100">
					        작성완료
					    </button>      
					</div>	        
 			</form>
         </div>
    </section>	
</body>
<%@ include file="../footer.jsp" %>
</html>