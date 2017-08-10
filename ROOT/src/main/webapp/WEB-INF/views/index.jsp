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
			<p>기존의 경매시스템에서 신뢰성을 높이기위해.........</p>
			<br>
			<h2>개발환경</h2>
			<h3>OS</h3>
			<p>-window7</p>
			<h3>웹브라우저</h3>
			<p>-Explorer 11, Chrome</p>
			<h3>WAS</h3>
			<p>Apache-tomcat 8.0</p>
			<h3>사용언어</h3>
			<p>JAVA.....</p>
			<h3>FrameWork</h3>
			<p>Spring, bootstrap, ......</p>			
			<br>
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
					<p>회원관리와 ......</p>
				</div>
				<div class="panel-footer">
					<p>
						<strong>github 주소 : </strong>
						<a href="#">https://github.com/</a>
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
					<p>회원관리와 ......</p>
				</div>
				<div class="panel-footer">
					<p>
						<strong>github 주소 : </strong>
						<a href="">https://github.com</a>
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
					<p>회원관리와 ......</p>
				</div>
				<div class="panel-footer">
					<p>
						<strong>github 주소 : </strong>
						<a href="">https://github.com</a>
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
					<p>회원관리와 ......</p>
				</div>
				<div class="panel-footer">
					<p>
						<strong>github 주소 : </strong>
						<a href="">https://github.com</a>
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
		Bootstrap Theme Made By <a href="https://www.w3schools.com"
			title="Visit w3schools">www.w3schools.com</a>
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