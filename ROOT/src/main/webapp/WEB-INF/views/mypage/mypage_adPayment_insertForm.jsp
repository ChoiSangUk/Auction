<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8"/>

<div class="container-fluid text-left">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="row title" style="margin-top: 30px;">
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			<a href="${pageContext.request.contextPath}/main">홈</a>
			<span>></span>
			<a href="${pageContext.request.contextPath}/mypage/mypageAdInfo">광고소개</a>
			<span>></span>
			<a href="${pageContext.request.contextPath}/mypage/adApplyList">나의 광고신청 리스트</a>
			<span>></span>
			<span style="color: #1266FF">광고 결제</span>
			<h2>광고 결제</h2>
		</div>			
		<div class="row content">
			<!-- 물품광고결제 폼 -->			
			<form class="form-horizontal" id="paymentForm" action="${pageContext.request.contextPath}/mypage/adPaymentInsertForm" method="post">
				<input type="hidden" name="adApplyCode" value="${adPaymentList.adApplyVo.adApplyCode}">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="form-group">
							<label class="col-sm-1 control-label">광고명</label>
							<div class="col-sm-2">
								<input class="form-control" type="text" name="adUnitPriceName" value="${adPaymentList.adUnitPriceVo.adUnitPriceName}" readonly="readonly">
							</div>
							<label class="col-sm-2 control-label">광고 시작일</label>
							<div class="col-sm-2">
								<input class="form-control" type="text" name="adApplyStartDate" value="${adPaymentList.adApplyVo.adApplyStartDate}" readonly="readonly">
							</div>
							<label class="col-sm-2 control-label">광고 종료일</label>
							<div class="col-sm-2">
								<input class="form-control" type="text" name="adApplyEndDate" value="${adPaymentList.adApplyVo.adApplyEndDate}" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-1 control-label">물품명</label>
							<div class="col-sm-2">
								<input class="form-control" type="text" name="auctionGoodsName" value="${adPaymentList.auctionGoodsVo.auctionGoodsName}" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="col-sm-1 control-label">결제금액</label>
							<div class="col-sm-2">
								<input class="form-control" type="number" name="adPaymentPrice" id="adPaymentPrice" value="${adPaymentList.adUnitPriceVo.adUnitPricePrice}" readonly="readonly">
							</div>
							<label class="col-sm-2 control-label">사용 가능한 캐쉬금액 </label>
							<div class="col-sm-2">
								<input class="form-control" type="number" name="userTotalcash" id="userTotalcash" value="${userDetailList.userTotalcash}" readonly="readonly">										
							</div>
							<div class="col-sm-5">
								<a class="btn btn-success" href="${pageContext.request.contextPath}/mypage/myinfo/Cash">캐쉬 충전</a>
							</div>
						</div>
						<div class="text-center">
							<span id="cashCheck" style="color: red;" class="text-center"></span>
						</div>
					</div>					
				</div>
				<div class="form-group submit text-center">
						<input class="btn btn-info" type="button" id="paymentConfirmButton" value="결제"
						data-toggle="modal">
						<a class="btn btn-default" href="">뒤로가기</a>
				</div>
			</form>
		</div>
	</div>
	<!-- 결제확인 모달 -->
	<div class="modal fade" id="myModal" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel"><strong>결제 확인</strong></h4>
				</div>
				<div class="modal-body">
					<span>결제금액은 <strong>${adPaymentList.adUnitPriceVo.adUnitPricePrice} 원</strong> 입니다.
					</span><br>
					<span>결제 후 잔여금액은
					<strong>
					<span id="residual">
					</span>
					</strong>
					입니다.
					</span><br>
					<span>
					결제하시려면 결제버튼을 눌러주세요.
					</span>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary" id="paymentButton" value="결제">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="결제 취소">
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>

<script>
$(document).ready(function() {
	var adPaymentPrice = parseInt($('#adPaymentPrice').val());
	var userTotalcash = parseInt($('#userTotalcash').val());
	// 결제 후 금액
	var residual = userTotalcash-adPaymentPrice;
	$('#residual').text(residual+" 원");
	// 보유금액이 결제금액보다 작으면 span태그에 알려준다.
	// 보유금액이 결제금액보다 크면 폼을 전송한다.
	$('#paymentConfirmButton').click(function() {
		if(adPaymentPrice > userTotalcash) {
			 console.log('잔액부족');
			$('#cashCheck').text("잔액이 부족합니다! 캐쉬충전버튼을 누르시면 충전페이지로 이동합니다.");			
		}else {
			$('#myModal').modal('show');
			console.log('결제창');
			$('#paymentButton').click(function() {
				$('#paymentForm').submit();
			});
		}
	});
});
</script>


<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8"/>