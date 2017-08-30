<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8"/>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- 메인배너 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<!-- 메인배너 링크,이미지 -->
	<div class="carousel-inner" role="listbox">
		<div class="item active mainBanner">
			<a href="${pageContext.request.contextPath}/mypage/mypageAdInfo">
			<img src="${pageContext.request.contextPath}/resources/files/mainBanner.jpg" 
			style="width: 80%; height: 400px;" alt="Image" align="middle">
			</a>
		</div>
		<c:forEach var="ad" items="${adPaymentSuccessList}">
		<div class="item mainBanner">
			<a href="#">
			<img src="${pageContext.request.contextPath}/resources/files/${ad.adImageVo.adImageName}" 
			style="width: 80%; height: 400px;" alt="Image" align="middle">
			</a>
		</div>
		</c:forEach>
	</div>

	<!-- 메인배너 선택기 -->
	<a class="left carousel-control" href="#myCarousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next"> <span
		class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>

<div class="container text-center">
	<h3>실시간 경매배너 자리 ${user}</h3>
	<br>
	<div class="row">
		<div class="col-sm-4">
			<img src="https://placehold.it/150x80?text=IMAGE"
				class="img-responsive" style="width: 100%" alt="Image">
			<p>실시간경매1</p>
		</div>
		<div class="col-sm-4">
			<img src="https://placehold.it/150x80?text=IMAGE"
				class="img-responsive" style="width: 100%" alt="Image">
			<p>실시간경매2</p>
		</div>
		<div class="col-sm-4">
			<img src="https://placehold.it/150x80?text=IMAGE"
				class="img-responsive" style="width: 100%" alt="Image">
			<p>실시간경매3</p>
		</div>
		<div class="col-sm-4">
			<img src="https://placehold.it/150x80?text=IMAGE"
				class="img-responsive" style="width: 100%" alt="Image">
			<p>실시간경매4</p>
		</div>
		<div class="col-sm-4">
			<img src="https://placehold.it/150x80?text=IMAGE"
				class="img-responsive" style="width: 100%" alt="Image">
			<p>실시간경매5</p>
		</div>
		<div class="col-sm-4">
			<img src="https://placehold.it/150x80?text=IMAGE"
				class="img-responsive" style="width: 100%" alt="Image">
			<p>실시간경매6</p>
		</div>

	</div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8"/>