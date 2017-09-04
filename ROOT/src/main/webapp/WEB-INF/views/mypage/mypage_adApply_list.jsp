<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<style>
th,td {
	vertical-align: middle !important;
	text-align: center !important;
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
			<h3>광고신청시 주의사항</h3>
			<p>광고신청등록 후 수정은 광리자승인 이전까지만 가능하며, 관리자 승인 완료 후 하루 이내에 결제가 가능합니다.......</p>
				<!-- 광고신청 리스트 테이블 -->
				<table class="table table-bordered">
					<thead>
						<tr class="active text-center">
							<th>광고명</th>
							<th>물품명</th>
							<th>광고시작날짜</th>
							<th>광고종료날짜</th>
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
							<td>${ad.adApplyVo.adApplyStartDate}</td>
							<td>${ad.adApplyVo.adApplyEndDate}</td>
							<td>${ad.adApplyVo.adApplyState}</td>
							<c:set var="adApplyState" value="${ad.adApplyVo.adApplyState}" />
							<c:choose>
							<c:when test="${adApplyState eq '승인대기'}">
							<td>
							<a href="${pageContext.request.contextPath}
							/mypage/adApplyUpdateForm?adApplyCode=${ad.adApplyVo.adApplyCode}&adImageCode=${ad.adImageVo.adImageCode}">
							<button class="btn btn-success">수정</button>
							</a>
							</td>
							</c:when>
							<c:otherwise>
							<td></td>
							</c:otherwise>
							</c:choose>
							<c:set var="adApplyState" value="${ad.adApplyVo.adApplyState}"/>
							<c:set var="adPayment" value="${ad.adPaymentVo.adPaymentState}"/>
							<c:set var="adApplyApprovalDate" value="${ad.adApplyVo.adApplyApprovalDate}"/>
							<c:choose>
							<c:when test="${adApplyState eq '승인완료' and adPayment eq null}">
							<td>
							<a href="${pageContext.request.contextPath}/mypage/adPaymentInsertForm?adApplyCode=${ad.adApplyVo.adApplyCode}">
							<button class="btn btn-info paymentBtn" id="paymentBtn" value="${adApplyApprovalDate}">결제</button>
							</a>
							</td>
							</c:when>
							<c:when test="${adPayment ne null}">
							<td>
							<strong style="color: blue;">
							${adPayment}
							</strong>
							</td>
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
<script>
$('.paymentBtn').click(function(){
	console.log($(this).val());
	var adApplyApprovalDate = $(this).val();
	var ExpirationDate = moment(adApplyApprovalDate).add('days',1).format('YYYY-MM-DD hh:mm:ss');
	var toDate = moment().format('YYYY-MM-DD hh:mm:ss');	
	
	if(toDate > ExpirationDate) {
		alert('결제기간이 만료되었습니다!');
		event.preventDefault();
	}	
});
</script>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />