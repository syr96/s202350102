<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- jQuery 라이브러리를 불러옵니다. -->
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript">
			
			function certBoard() {
				
				var Data = {};
				// alert("certBoard");
				$.ajax(
						{
							type:"POST",
							url:"certBoard",
							data: Data,
							dataType:"json",
							
							success:function(result) {
								// alert("success ajax Data ->" +result);
									
								if(result.status == "OK") {
									
									// 데이터를 화면에 표시할 HTML 요소를 선택
									var table = $('#boardCertTable');
									// alert("success ajax table ->" +table);
									// 결과에서 글 목록을 순회하면서 HTML을 생성
									var html = "";
									result.boardCert.forEach(function (item) {
										html += "<tr><td>" + item.title + "</td><td>" + item.conts + "</td></tr>";
									});
									
									// 생성한 HTML을 테이블에 추가	// text, value, html 세 가지 메소드
									table.html(html);
									
								} else {
									console.log("조회 실패");
								}
							}
						}
						);	
			}
			
			
			function writeCertBoard() {
				
				// 사용자가 입력한 내용 가져오기
				var content = $('#content').val();
				
				// 입력 내용이 비어있지 않은지 확인
				if (content.trim() == "") {
					alert("내용을 입력하세요.");
					return;
				}
				
				// 서버로 데이터 전송
				$.ajax({
					url:"writeCertBoard",
					type:"POST",
					data:{
						content:content
					},
					dataType:"json",
					success:function(response) {
						// 서버 응답을 처리하는 코드
						if (response.status == "OK") {
							// 성공적으로 등록되었을 때 실행할 코드
							alert("글이 등록되었습니다.");
							// 여기에서 추가 작업을 수행할 수 있습니다
						} else {
							// 서버에서 오류 응답을 보낸 경우
							alert("글 등록에 실패했습니다.");
						}
					},
					error: function() {
						// Ajax 요청 자체가 실패한 경우
						alert("글 등록에 실패했습니다.");
					}
				});
			}
		
		</script>
	</head>
	<body>
	<h1>챌린지 상세</h1>
		<div>
			<section data-role="챌린지-상세-게시판">
				<section data-role="챌린지-게시판-글쓰기">
				
				</section>
				<!-- Ajax로 가져온 데이터를 표시할 테이블 -->
				<input type="button" onclick="certBoard()" value="후기 게시판">
				<input type="text" id="content" placeholder="글을 작성해주세요">
				<input type="button" onclick="writeCertBoard()" value="글쓰기 등록">
				<table id="boardCertTable">
					<tr>
						<th>제목</th>
						<th>내용</th>
					</tr>
				</table>
				
			</section>
		</div>
	
	</body>
</html>