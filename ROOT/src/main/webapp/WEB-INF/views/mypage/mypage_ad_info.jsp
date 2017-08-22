<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<style>
.table {
	width: 20%;
}
</style>

<div class="container-fluid text-left">
	<div class="row title">
		<h1>Auction 광고 소개 페이지</h1>
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
		<p>광고설명글 .......</p>
		<!-- 광고관리 링크 -->
		<a href="${pageContext.request.contextPath}/mypage/adApplyInsertForm">광고신청하러가기</a><br>
		<a href="${pageContext.request.contextPath}/mypage/adApplyList">신청한광고리스트 보러가기</a>
	</div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />