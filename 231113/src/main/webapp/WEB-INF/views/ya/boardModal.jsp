<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- ���� ��ư -->
<div class="button-container">
  
<button type="button" class="btn btn-deleteAsk btn-danger" data-toggle="modal" data-target="#deleteConfirmationModal">�� ����</button>
				
<!-- ���� ��ư -->
<a href="update.board?bno=${bno }">
<button type="button" class="btn btn-warning">�� ����</button>
</a>
</div>
		<!-- ���â: ���� Ȯ�� -->
	<div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="deleteConfirmationModalLabel">���� Ȯ��</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                <p>���� �����Ͻðڽ��ϱ�? </p>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">�ƴϿ�</button>
	                <a href="delete.board?bno=${bno}" class="btn btn-danger">��</a>
	            </div>
	        </div>
	    </div>
	</div>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

		<!-- ���â �ڹٽ�ũ��Ʈ: ���� Ȯ�� -->
		<script>
		    $(document).ready(function () {
		        // ���� ��ư Ŭ�� �� ��� â ǥ��
		        $("btn-deleteAsk").click(function () {
		            $("#deleteConfirmationModal").modal("show");
		        });
		    });
		</script>

</body>
</html>