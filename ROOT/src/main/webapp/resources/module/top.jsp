<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/moment.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ko.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.ko.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.min.css"/>

</head>
<body>
<nav class="navbar navbar-inverse" id="topMenuNavar">
	<div class="container-fluid" id="topMenu">
		<div class="navbar-header">
			<!-- 화면 축소시 화면리스트 버튼 생성 -->
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#topNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      	</button>    
	      	<span class="glyphicon glyphicon-time navbar-brand" style="color: #ffffff;"></span>
	      	<a class="navbar-brand" id="time"></a>
		</div>
		<div class="collapse navbar-collapse" id="topNavbar">
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${userLoginInfo.userLevel eq null}">
					<li><a href="#">Auction 설명서</a></li>
					<li><a href="${pageContext.request.contextPath}/user/userLogin">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/user/userJoin">회원가입 </a></li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/adminLogin" style="color: #2F9D27">
						<button class="btn btn-danger btn-xs">관리자 로그인페이지 </button>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/">
						<button class="btn btn-danger btn-xs">프로젝트 소개페이지</button>
						</a>
					</li>
				</c:if>
			
				<c:if test="${userLoginInfo.userLevel ne null}">
					<li><a href="#">Auction 설명서</a></li>
					<li><a href="logout">로그아웃</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/mypageMain">마이페이지</a></li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/adminLogin" style="color: #2F9D27">
						<button class="btn btn-danger btn-xs">관리자 로그인페이지 </button>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/">
						<button class="btn btn-danger btn-xs">프로젝트 소개페이지</button>
						</a>
					</li>
				</c:if>
							 
			</ul>
		</div>
	</div>
</nav>
<nav class="navbar navbar-inverse" id="mainMenuNabar">
	<div class="container-fluid" id="mainMenu">
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
			<ul class="nav navMenu navbar-nav navbar-left " >
				<li class="dropdown dropdown:hover ">
				<a class="dropdown-toggle" data-toggle="dropdown/button" href="${pageContext.request.contextPath}/auctiongoods/auctiongoodslist">온라인 경매</a>
				<c:if test="${userLoginInfo.userLevel eq '판매자'}"> 
				<li><a href="${pageContext.request.contextPath}/auctiongoods/auctiongoodsinsert">물품등록</a></li>
				<li><a onclick="window.open('/auction/auctiongoods/goodslist','win2','scrollbars=yes width=650, height=700');return false">품목리스트</a>			
				</c:if>
				<li><a href="aa">고객센터</a></li>
				<c:if test="${userLoginInfo.userLevel ne null}">
			 </c:if>					 
			</ul>
			<div class="pull-right" style="margin-top: 12px;">
				<c:if test="${userLoginInfo.userName ne null}">
					<span class="glyphicon glyphicon-user">
						<strong>${userLoginInfo.userName}</strong>님이<strong>${userLoginInfo.userLevel}</strong>권한으로로그인하셨습니다.
					</span>
				</c:if>
			</div>
		</div>			
	</div>
</nav>