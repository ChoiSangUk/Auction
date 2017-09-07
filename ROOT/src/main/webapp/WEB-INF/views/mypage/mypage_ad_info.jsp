<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<style>
.table {
	width: 100%;
}
th {
	vertical-align: middle !important;
	text-align: center !important;
}
td {
	vertical-align: middle !important;
	text-align: center !important;
}
.adApply {
	border: 2px solid #3D3D3D;
	border-radius: 8px;
}
.adApplyBtn {
	width: 160px;
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
			<!-- 메인배너 소개 -->
			<div class="col-sm-12 well">
			<div class="col-sm-8">
				<h2>메인배너 소개</h2>
				<p>Auction 메인페이지에서 메인배너로 등록해드립니다.<br>
				<strong>평균 낙찰률 90%</strong> <strong>평균 조회수 1000회</strong> 이상을 기록하는 메인배너!<br>
				지금 바로 경험해보세요!</p>
					
				<h2>실시간경매배너 소개</h2>
				<p>준비중입니다.</p>		
			</div>
			<!-- 광고단가 표 -->
			<div class="col-sm-3">
				<h3>광고단가 표</h3>
				<table class="table table-bordered">
					<thead>
						<tr class="info">
							<th>광고명</th>
							<th>광고단가</th>
						</tr>
					</thead>		
					<tbody>
					<c:forEach var="ad" items="${adUnitPriceList}">
						<tr>
							<td>${ad.adUnitPriceName}</td>
							<td>${ad.adUnitPricePrice} 원</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<!-- 선정 기준 -->
		<div class="row content text-center">	
			<h2>메인배너 선정기준</h2>
			<p>
			<strong>
			1. 신용도가 좋은 회원<br>
			2. 진품이 보증된 물품<br>
			3. 희소성이 높은 물품<br>
			</strong>
			</p>
		</div>					
		<!-- 광고신청방법 -->
		<div class="row content">
			<div class="adApply col-sm-12 text-center">
				<h3>광고 신청 접수방법</h3><br>
				<img alt="" src="${pageContext.request.contextPath}/resources/img/adApplyWay.png"
				style="margin-bottom: 13px; width: 100%; height: 100%;">
			</div>
		</div>
		<!-- 광고관리 링크 -->
		<div class="row content">			
			<div class="text-center">
				<a class="btn btn-info btn-lg adApplyBtn" href="${pageContext.request.contextPath}/mypage/adApplyInsertForm">광고신청</a>
				<a class="btn btn-default btn-lg adApplyBtn" href="${pageContext.request.contextPath}/mypage/adApplyList">광고신청리스트</a>
			</div>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />