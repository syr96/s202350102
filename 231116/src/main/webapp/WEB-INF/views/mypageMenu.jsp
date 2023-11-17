<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="./assets/favicon/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./assets/css/libs.bundle.css" />
    <link rel="stylesheet" href="./assets/css/theme.bundle.css" />
    <title>Insert title here</title>
</head>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
body{
    font-family: 'Noto Sans KR', sans-serif;
}
</style>
<style>
.profile {
  margin: 20px 0;
}

/* Profile sidebar */
.profile-sidebar {
  padding: 20px 0 10px 0;
  background: #fff;
}

.profile-userpic {
  text-align: center;
}

.profile-userpic img {
  float: none;
  margin: 0 auto;
  width: 100px;
  height: 100px;
  -webkit-border-radius: 50% !important;
  -moz-border-radius: 50% !important;
  border-radius: 50% !important;
}

.profile-usertitle {
  text-align: center;
  margin-top: 20px;
}

.profile-usertitle-name {
  color: #5a7391;
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 7px;
}

.profile-usertitle-job {
  text-transform: uppercase;
  color: #5b9bd1;
  font-size: 12px;
  font-weight: 600;
  margin-bottom: 15px;
}

/* Profile Content */
.profile-content {
  padding: 20px;
  background: #fff;
  min-height: 460px;
}

a, button, code, div, img, input, label, li, p, pre, select, span, svg, table, td, textarea, th, ul {
    -webkit-border-radius: 0!important;
    -moz-border-radius: 0!important;
    border-radius: 0!important;
}

.dashboard-stat, .portlet {
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -ms-border-radius: 4px;
    -o-border-radius: 4px;
}

.portlet {
    margin-top: 0;
    margin-bottom: 25px;
    padding: 0;
    border-radius: 4px;
}

.portlet.bordered {
    border-left: 2px solid #e6e9ec!important;
}

.portlet.light {
    padding: 12px 20px 15px;
    background-color: #fff;
}

.portlet.light.bordered {
    border: 1px solid #e7ecf1!important;
}

.list-separated {
    margin-top: 10px;
    margin-bottom: 15px;
}

.profile-stat {
    padding-bottom: 20px;
    border-bottom: 1px solid #f0f4f7;
}

.profile-stat-title {
    color: #7f90a4;
    font-size: 25px;
    text-align: center;
}

.uppercase {
    text-transform: uppercase!important;
}

.profile-stat-text {
    color: #5b9bd1;
    font-size: 10px;
    font-weight: 600;
    text-align: center;
}

.profile-desc-title {
    color: #7f90a4;
    font-size: 17px;
    font-weight: 600;
}

.profile-desc-text {
    color: #7e8c9e;
    font-size: 14px;
}

.margin-top-20 {
    margin-top: 20px!important;
}

[class*=" fa-"]:not(.fa-stack), [class*=" glyphicon-"], [class*=" icon-"], [class^=fa-]:not(.fa-stack), [class^=glyphicon-], [class^=icon-] {
    display: inline-block;
    line-height: 14px;
    -webkit-font-smoothing: antialiased;
}

.profile-desc-link i {
    width: 22px;
    font-size: 19px;
    color: #abb6c4;
    margin-right: 5px;
}

</style>
<body>


			<div class="profile-sidebar">
				<!-- SIDEBAR USERPIC -->
				<div class="profile-userpic">
					<img src="upload/프로필기본.png">
				</div>
				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						${sessionScope.user_num }
					</div>
					<div class="profile-usertitle-job">
						level 1
					</div>
				</div>
				<!-- END SIDEBAR USER TITLE -->
           <div class="portlet light bordered">
               <!-- STAT -->
               <div class="row list-separated profile-stat">
                   <div class="col-md-4 col-sm-4 col-xs-6">
                       <div class="uppercase profile-stat-title"> 37 </div>
                       <div class="uppercase profile-stat-text"> 팔로우 </div>
                   </div>
                   <div class="col-md-4 col-sm-4 col-xs-6">
                       <div class="uppercase profile-stat-title"> 51 </div>
                       <div class="uppercase profile-stat-text"> 팔로잉 </div>
                   </div>
                   <div class="col-md-4 col-sm-4 col-xs-6">
                       <div class="uppercase profile-stat-title"> 61 </div>
                       <div class="uppercase profile-stat-text"> 내가 쓴 글</div>
                   </div>
               </div>
               <div class="col-12 col-md-16">
                   <!-- Nav -->
                   <nav class="mb-10 mb-md-0" >
                       <div class="list-group list-group-sm list-group-strong list-group-flush-x">
                           <a class="list-group-item list-group-item-action dropend-toggle " href="/challengeManagement">
                               활동정보
                           </a>
                           <a class="list-group-item list-group-item-action dropend-toggle " href="/challengeManagement">
                               챌린지 관리
                           </a>
                           <a class="list-group-item list-group-item-action dropend-toggle " href="/followList">
                               팔로우 관리
                           </a>
                           <a class="list-group-item list-group-item-action dropend-toggle " href="/subscriptionManagement">
                               구독 관리
                           </a>
                           <a class="list-group-item list-group-item-action dropend-toggle " href="/sharingManagement">
                               쉐어링 관리
                           </a>
                           <a class="btn w-100 btn-dark mb-2" href="/userDetail" style=" margin-top: 50px;">
                               회원정보수정
                           </a>
                       </div>
                   </nav>
                   <!-- Nav End -->
               </div>
               <!-- END STAT -->
           </div>
       </div>


</body>
</html>
