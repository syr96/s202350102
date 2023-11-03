<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$('#apibtn').click(function(){
			$.ajax({
				url: "thKakaoPay",
				dataType: 'json',
				success:function(data){
					var box = data.next_redirect_pc_url;
					window.open(box);
				},
				error:function(error){
					alert("에러발생");
				}
			});
		});
	});
</script>

</head>
<body>
	<h2>카카오페이 플랫폼</h2>
	<input type="button" id="apibtn" value="kakaoPay">
</body>
</html>