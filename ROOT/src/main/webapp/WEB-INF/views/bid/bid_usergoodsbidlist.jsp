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
						<th>입찰코드</th>
						<th>입찰품목명</th>
						<th>입찰금액</th>
						<th>입찰시간</th>
		
					</tr>
				</thead>
				<c:forEach var="usergoodsbid" items="${usergoodsbidlist}">
				<tbody>
					<tr class="adApplyListTable">
						<td>${usergoodsbid.bidCode}</td>
						<td>${usergoodsbid.auctionGoodsName}</td>
						<td><fmt:formatNumber value="${usergoodsbid.bidPrice}" groupingUsed="true"/>원</td>
						<td>${usergoodsbid.bidDate}</td>
					
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>


<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />