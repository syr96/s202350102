<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--제목, 회원 닉네임 띄우기, 내용, 첨부파일 -->
 	<h3>게시글 작성</h3>
 <form action=""  method="post" name="">
 	   <table>
		    <tr>
		    	<td><input type="hidden"  name="user_num" required="required" value="${board.brd_num}"></td>
		    </tr>
		    <tr>
		    <th>작성일자</th>
		    	<td><input type="date" name="reg_date" value="SYSDATE"></td>
		    </tr>
			<tr>
			<th>작성자</th>
				<td><input type="text"    name="nick" 		value="${board.nick}" readonly="readonly"> </td>
			</tr>
			<tr><th>내용</th>
				<td> <textarea  name="conts" rows="20"></textarea></td></tr>
			<tr><th>첨부파일</th><td><input type="file"  name="file" 	></td></tr>
	   </table>       
 </form>
 	
 	
</body>
</html>