<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#myPage">Auction</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#projectInfo">프로젝트 소개</a></li>
				<li><a href="#teamMemberInfo">팀원소개</a></li>
				<li><a href="${pageContext.request.contextPath}/main">프로젝트 시작하기</a></li>
			</ul>
		</div>
	</div>
</nav>

<!-- 프로젝트 소개 -->
<div id="projectInfo" class="container-fluid">
	<div class="row">
		<div class="col-sm-12 text-center">
			<h1>경매시스템</h1>
			<br>
			<p>경매를 통하여 모든 물품을 판매해주고 거래의 신뢰성을 높이기 위해<br>
			보증금을 두어 판매와 구매의 신뢰성을 높이는 목적으로 진행된 프로젝트입니다.</p>
			<br>
			<h1>개발환경</h1>
			<h3>OS</h3>
			<p>- window7</p>
			<h3>웹브라우저</h3>
			<p>- Chrome</p>
			<h3>WAS</h3>
			<p>- Apache-tomcat 8.0</p>
			<h3>사용언어</h3>
			<p>- Java(JDK1.8.0)</p>
			<h3>DBMS</h3>
			<p>- Mysql 5.1.42 </p>	
			<h3>FrameWork</h3>
			<p>- Spring 4.3.9, Mybatis 3.4.4, bootstrap, ......</p>
			<h3>개발 툴</h3>
			<p>- Spring Tool Suite 3.8.4, HeidiSQL, Maven 2.5.1, log4j 1.2.15 </p>
			<br>
			<h2><a href="${pageContext.request.contextPath}/resources/img/logicalErd.png" target="_blank">
			논리 ERD&nbsp;&nbsp;</a>
			<a href="${pageContext.request.contextPath}/resources/img/physicalErd.png" target="_blank">
			물리 ERD</a></h2>
		</div>
	</div>
</div>

<!-- 팀원소개 -->
<div id="teamMemberInfo" class="container-fluid bg-grey">
	<div class="text-center">
		<h1>팀원 소개</h1>
	</div>
	<div class="row slideanim">
		<div class="col-sm-6 col-xs-12">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h1>강민수</h1>
				</div>
				<div class="panel-body">
					<h2>담당 업무</h2>
					<p>요구사항 분석, DB설계, ERD작성<br>
					경매물품 카테고리 관리, 경매물품 등록 관리, 경매물품 문의관리</p>
				</div>
				<div class="panel-footer">
					<p>
						<strong>github 주소 : </strong>
						<a href="https://github.com/kang6047" target="_blank">https://github.com/kang6047</a>
					</p>
					<p>
						<strong>블로그 주소 : </strong>
						<a href="#">https://blog</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-xs-12">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h1>박주호</h1>
				</div>
				<div class="panel-body">
					<h2>담당 업무</h2>
					<p>요구사항 분석, DB설계, ERD작성<br>
					광고 관리, 광고환불 관리, 게시판 관리, 회사 매입/매출 관리</p>
				</div>
				<div class="panel-footer">
					<p>
						<strong>github 주소 : </strong>
						<a href="https://github.com/pjh3752" target="_blank">https://github.com/pjh3752</a>
					</p>
					<p>
						<strong>블로그 주소 : </strong>
						<a href="#">https://blog</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-xs-12">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h1>송강산</h1>
				</div>
				<div class="panel-body">
					<h2>담당 업무</h2>
					<p>요구사항 분석, DB설계, ERD작성<br>
					입찰 관리, 낙찰 관리, 결제 관리</p>
				</div>
				<div class="panel-footer">
					<p>
						<strong>github 주소 : </strong>
						<a href="https://github.com/sks4321" target="_blank">https://github.com/sks4321</a>
					</p>
					<p>
						<strong>블로그 주소 : </strong>
						<a href="#">https://blog</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-xs-12">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h1>이어진</h1>
				</div>
				<div class="panel-body">
					<h2>담당 업무</h2>
					<p>요구사항 분석, DB설계, ERD작성<br>
					회원 관리, 로그인 관리, 계좌 관리, 캐쉬 관리, 배송지 정보 관리, 반품 관리, 구매 관리</p>
				</div>
				<div class="panel-footer">
					<p>
						<strong>github 주소 : </strong>
						<a href="https://github.com/wndtls2" target="_blank">https://github.com/wndtls2</a>
					</p>
					<p>
						<strong>블로그 주소 : </strong>
						<a href="#">https://blog</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<footer class="container-fluid text-center">
	<a href="#myPage" title="To Top"> <span
		class="glyphicon glyphicon-chevron-up"></span>
	</a>
	<p>
		<a href="#">www.kpsl.com</a>
	</p>
</footer>

<script>
$(document).ready(
	function() {
		// Add smooth scrolling to all links in navbar + footer link
		$(".navbar a, footer a[href='#myPage']").on('click',
				function(event) {
					// Make sure this.hash has a value before overriding default behavior
					if (this.hash !== "") {
						// Prevent default anchor click behavior
						event.preventDefault();

						// Store hash
						var hash = this.hash;

						// Using jQuery's animate() method to add smooth page scroll
						// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
						$('html, body').animate({
							scrollTop : $(hash).offset().top
						}, 900, function() {

							// Add hash (#) to URL when done scrolling (default click behavior)
							window.location.hash = hash;
						});
					} // End if
				});

		$(window).scroll(function() {
			$(".slideanim").each(function() {
				var pos = $(this).offset().top;

				var winTop = $(window).scrollTop();
				if (pos < winTop + 600) {
					$(this).addClass("slide");
				}
			});
		});
	})
</script>
</html>