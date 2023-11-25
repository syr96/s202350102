<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 삭제 버튼 -->
<div class="button-container">
  
<button type="button" class="btn btn-deleteAsk btn-danger" data-toggle="modal" data-target="#deleteConfirmationModal">글 삭제</button>
				
<!-- 수정 버튼 -->
<a href="update.board?bno=${bno }">
<button type="button" class="btn btn-warning">글 수정</button>
</a>
</div>
		<!-- 모달창: 삭제 확인 -->
	<div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="deleteConfirmationModalLabel">삭제 확인</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                <p>정말 삭제하시겠습니까? </p>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
	                <a href="delete.board?bno=${bno}" class="btn btn-danger">네</a>
	            </div>
	        </div>
	    </div>
	</div>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

		<!-- 모달창 자바스크립트: 삭제 확인 -->
		<script>
		    $(document).ready(function () {
		        // 삭제 버튼 클릭 시 모달 창 표시
		        $("btn-deleteAsk").click(function () {
		            $("#deleteConfirmationModal").modal("show");
		        });
		    });
		</script>

</body>
</html>