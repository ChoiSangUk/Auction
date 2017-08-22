<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<style>
.table {
	width: 80%;
	margin: auto;
	margin-bottom: 50px;
}
</style>

<div class="container-fluid">
	<div class="row title">
		<h1>나의 광고신청 리스트</h1>
		<!-- 광고신청 리스트 테이블 -->
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>광고명</th>
					<th>물품명</th>
					<th>광고신청상태</th>
					<th>수정</th>
					<th>결제</th>
				</tr>
			</thead>		
			<tbody>
			<c:forEach var="ad" items="${myApplyList}">
				<tr>
					<td>${ad.adUnitPriceVo.adUnitPriceName}</td>
					<td>${ad.auctionGoodsVo.auctionGoodsName}</td>
					<td>${ad.adApplyVo.adApplyState}</td>
					<td>수정</td>
					<td>결제</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />