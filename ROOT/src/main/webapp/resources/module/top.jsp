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
			<a class="navbar-brand" id="time"></a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Auction 설명서</a></li>
				<li><a>│</a></li>
				<li><a href="#">로그인</a></li>
				<li><a>│</a></li>
				<li><a href="#">회원가입 </a></li>
				<li><a>│</a></li>
				<li><a href="#">마이페이지</a></li>
			</ul>
		</div>
	</div>
</nav>
<nav class="navbar navbar-inverse" id="mainMenu">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Auction</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navMenu navbar-nav navbar-left">
				<li><a data-toggle="tab" href="ss">온라인 경매</a></li>
				<li><a data-toggle="tab" href="dd">물품등록</a></li>
				<li><a data-toggle="tab" href="aa">고객센터</a></li>
			</ul>
		</div>
	</div>
</nav>