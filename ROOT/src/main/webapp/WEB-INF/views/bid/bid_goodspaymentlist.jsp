<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="row title">
			<h1>개인 구매 진행 리스트</h1>
		</div>
		<!-- 광고신청리스트 검색 -->

		<div class="row content text-center">
			<table class="table table-bordered">
				<thead>
					<tr class="active">
						<th>물품명</th>
						<th>결제금액</th>
						<th>결제시간</th>
					</tr>
				</thead>
				<c:forEach var="goodspaymentlis" items="${goodspaymentlis}">
				<tbody>
					<tr class="adApplyListTable">
						<td>${goodspaymentlis.auctionGoodsName}</td>
						<td><fmt:formatNumber value="${goodspaymentlis.goodsPaymentPrice}" groupingUsed="true"/>원</td>
						<td>${goodspaymentlis.goodsPaymentDate}</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />