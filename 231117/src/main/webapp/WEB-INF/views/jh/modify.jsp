<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




<!-- date오류 -->

<form action="chgApplication">
<input type="hidden" name="user" value="${user}">
<input type="hidden" name="userStatus" value="${userStatus}">
<!-- 각 요소 마다 required넣기 -->
<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">카테고리</span>
	<div class="input-group-text">
	  <input class="form-check-input" type="radio" name="chg_md" id="exercise" value="100"  required="required">
	  <label class="form-check-label" for="exercise">운동</label>
	</div>
	<div class="input-group-text">
	  <input class="form-check-input" type="radio" name="chg_md" id="studying" value="101">
	  <label class="form-check-label" for="studying">공부</label>
	</div>
	<div class="input-group-text">
	  <input class="form-check-input" type="radio" name="chg_md" id="hobby" value="102">
	  <label class="form-check-label" for="hobby">취미</label>
	</div>
	<div class="input-group-text">
	  <input class="form-check-input" type="radio" name="chg_md" id="habit" value="103">
	  <label class="form-check-label" for="habit">습관</label>
	</div><p>
	아작스 추가 예정
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">챌린지명</span>
  <input type="text" class="form-control" name="title"  required="required">
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">참여 기간</span>
  <input type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="create_date">
 
  <input type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="end_date">
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">참여 인원</span>
  <input type="number" class="form-control" name="chg_capacity" max="50" min="1"  required="required">
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">인증 방법</span>
  <input type="text" class="form-control" placeholder="예)하루 만보 걷기 챌린지 : 매일 만보를 걷고 만보가 적힌 만보기 사진을 올려주세요 " name="upload"  required="required">
  <span class="input-group-text" id="inputGroup-sizing-default">인증 예시</span>
  <input type="file" class="form-control" id="inputGroupFile01" name="sample_img">
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroupSelect01">인증 빈도</span>
  <select class="form-select" id="inputGroupSelect01" name="freq" required="required">
    <option selected value="" selected disabled hidden>일주일에 인증할 회수를 선택해 주세요</option>
    <option value="1">1일</option>
    <option value="2">2일</option>
    <option value="3">3일</option>
    <option value="4">4일</option>
    <option value="5">5일</option>
    <option value="6">6일</option>
    <option value="7">매일</option>
  </select>
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">공개 여부</span>
  <%-- 구독회원 여부에 따라 공개설정 표시 달라짐<c:if test=""></c:if> --%>
<div class="form-check">
  <input class="form-check-input" type="radio" name="chg_public" id="public" checked disabled  required="required">
  <label class="form-check-label" for="publicCheckedDisabled">
    공개
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="chg_public" id="private"  disabled>
  <label class="form-check-label" for="privateDisabled">
    비공개
  </label>
</div>
  <span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
    <label for="inputPassword4" class="form-label">Password</label>
    <input type="password" class="form-control" id="inputPassword4" name="priv_pswd"  required="required">
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">챌린지 소개</span>
  <input type="text" class="form-control" placeholder="예)하루 만보 걷기 챌린지 : 건강을 위해 우리 다함께 매일 만보씩 걸어요" name="chg_conts"  required="required" >
  <span class="input-group-text" id="inputGroup-sizing-default">썸네일</span>
  <input type="file" class="form-control" id="inputGroupFile01" name="thumb">
</div>

<input type="submit" value="확인">
<input type="submit" value="취소" onclick="location.href='/listChallenge'">


</form>
</body>
</html>