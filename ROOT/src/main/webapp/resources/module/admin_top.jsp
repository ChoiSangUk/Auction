<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/admin/adminMain">Admin</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리</a></li>
				<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">경매물품관리</a></li>
				<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">광고관리
					<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/ad/adminAdManagement">광고단가 리스트</a></li>
						<li><a href="${pageContext.request.contextPath}/ad/adminAdApplySearch">광고신청 리스트</a></li>
						<li><a href="${pageContext.request.contextPath}/ad/adminAdRefundApplySearch">광고환불신청 리스트</a></li>
						<li><a href="${pageContext.request.contextPath}/ad/adminAdRefundPaymentSearch">광고환불결제 리스트</a></li>
					</ul>
				</li>
				<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">매입매출 관리
					<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/saleslog/adminSalesLogList">매입/매출 리스트</a></li>
						<li><a href="${pageContext.request.contextPath}#">매입/매출 검색</a></li>
						<li><a href="${pageContext.request.contextPath}#">매입/매출 월별통계</a></li>
					</ul>
				<li><a href="${pageContext.request.contextPath}/main">경매사이트 바로가기</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/admin/logout"><span class="glyphicon glyphicon-log-in"></span>
						Logout</a></li>
			</ul>
		</div>
	</div>
</nav>