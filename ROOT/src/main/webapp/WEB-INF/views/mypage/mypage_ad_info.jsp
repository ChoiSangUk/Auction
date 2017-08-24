<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<style>
.table {
	width: 20%;
}
</style>
<div class="container-fluid">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="row title">
			<div class="col-sm-12">
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			<a href="${pageContext.request.contextPath}/main">홈</a>
			<span>></span>
			<span>광고 소개</span>
			</div><br>
			<h1>Auction 광고 소개 페이지</h1>
		</div>
		<div class="row content">		
			<!-- 광고단가 소개 -->
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>광고명</th>
						<th>광고단가</th>
					</tr>
				</thead>		
				<tbody>
				<c:forEach var="ad" items="${adUnitPriceList}">
					<tr>
						<td>${ad.adUnitPriceName}</td>
						<td>${ad.adUnitPricePrice}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 광고설명 -->
		<div class="row content">
			<h3>광고 신청 접수방법</h3>
			<p>하단의 광고신청을 하시고.....</p>
			<h3>메인배너 소개</h3>
			<p>진품이 보증된 물품....
			<h3>실시간경매배너 소개</h3>
			<p>실시간으로....						
		</div>
		<div class="row content">
		<!-- 광고관리 링크 -->
			<a href="${pageContext.request.contextPath}/mypage/adApplyInsertForm">광고신청하러가기</a><br>
			<a href="${pageContext.request.contextPath}/mypage/adApplyList">신청한광고리스트 보러가기</a>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />