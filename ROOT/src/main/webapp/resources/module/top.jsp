<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
	<div class="container-fluid" id="topMenu">
		<div class="navbar-header">
			<!-- 화면 축소시 화면리스트 버튼 생성 -->
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#topNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      	</button>
			<a class="navbar-brand" id="time"></a>
		</div>
		<div class="collapse navbar-collapse" id="topNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Auction 설명서</a></li>
				<li><a href="${pageContext.request.contextPath}/user/userLogin">로그인</a></li>
				<li><a href="${pageContext.request.contextPath}/user/userJoin">회원가입 </a></li>
				<li><a href="#">마이페이지</a></li>
			</ul>
		</div>
	</div>
</nav>
<nav class="navbar navbar-inverse" id="mainMenu">
	<div class="container-fluid">
		<div class="navbar-header">
			<!-- 화면 축소시 화면리스트 버튼 생성 -->
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      	</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/main">Auction</a>
		</div>
		<div class="collapse navbar-collapse" id="mainNavbar">
			<ul class="nav navMenu navbar-nav navbar-left">
				<li><a href="ss">온라인 경매</a></li>
				<li><a href="dd">물품등록</a></li>
				<li><a href="aa">고객센터</a></li>
			</ul>
		</div>
	</div>
</nav>