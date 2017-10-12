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

		<!-- 결과값 테이블 -->
		<div class="row content text-center">
			<table class="table table-bordered">
				<thead>
					<tr class="active">
						<th>물품명</th>
						<th>낙찰금액</th>
						<th>낙찰일자</th>
						<th>결제상태</th>
							
					</tr>
				</thead>
				<c:forEach var="usersuccessbidlist" items="${usersuccessbidlist}">
				<c:set var="goodsPaymentState" value="${usersuccessbidlist.goodsPaymentState}"></c:set>
				<tbody>
					<tr class="adApplyListTable">
						<td>${usersuccessbidlist.auctionGoodsName}</td>
						<td><fmt:formatNumber value="${usersuccessbidlist.successfulBidPrice}" groupingUsed="true"/>원</td>
						<td>${usersuccessbidlist.successfulBidDate}</td>
						<c:choose>
						<c:when test="${goodsPaymentState eq null}">
						<td>
						<a href="${pageContext.request.contextPath}/mypage/purchasePaymentInserForm?successfulBidCode=${usersuccessbidlist.successfulBidCode}" 
						class="btn btn-info">결제하기</a>
						</td>
						</c:when>
						<c:when test="${goodsPaymentState ne null}">
						<td style="color: blue;">${goodsPaymentState}</td>
						</c:when>
						</c:choose>
					</tr>
				</tbody>
				</c:forEach>
				
			</table>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />