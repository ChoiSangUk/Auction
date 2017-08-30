<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<style>
.table {
	margin: auto;
}
</style>

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
			<div class="row title">
				<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
				<a href="${pageContext.request.contextPath}/main">홈</a>
				<span>></span>
				<a href="${pageContext.request.contextPath}/mypage/mypageAdInfo">광고소개</a>
				<span>></span>
				<span style="color: #1266FF">광고신청리스트</span>
				<h2>나의 광고신청 리스트</h2>
			</div>
			<div class="row content">				
				<!-- 광고신청 리스트 테이블 -->
				<table class="table table-hover">
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
							<c:set var="adApplyState" value="${ad.adApplyVo.adApplyState}" />
							<c:choose>
							<c:when test="${adApplyState eq '승인대기'}">
							<td>
							<a href="${pageContext.request.contextPath}
							/mypage/adApplyUpdateForm?adApplyCode=${ad.adApplyVo.adApplyCode}&adImageCode=${ad.adImageVo.adImageCode}">
							<button>수정</button>
							</a>
							</td>
							</c:when>
							<c:otherwise>
							<td></td>
							</c:otherwise>
							</c:choose>
							<c:set var="adApplyState" value="${ad.adApplyVo.adApplyState}"/>
							<c:set var="adPayment" value="${ad.adPaymentVo.adPaymentState}"/>
							<c:choose>
							<c:when test="${adApplyState eq '승인완료' and adPayment eq null}">
							<td>
							<a href="${pageContext.request.contextPath}/mypage/adPaymentInsertForm?adApplyCode=${ad.adApplyVo.adApplyCode}">
							<button>결제</button>
							</a>
							</td>
							</c:when>
							<c:when test="${adPayment ne null}">
							<td>${adPayment}</td>
							</c:when>
							<c:otherwise>
							<td></td>
							</c:otherwise>
							</c:choose>				
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>			
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />