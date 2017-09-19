<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<style>
.table-bordered {
    border: 3px solid #ddd;
}
</style>
<div class="container-fluid">
	<!-- 왼쪽 여백 -->
	<div class="col-sm-1"></div>
	<!-- 가운데 메인 -->
	<div class="col-sm-10">
		<!-- 네이게이션 & 페이지 타이틀 -->
		<div class="row title">
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			<a href="${pageContext.request.contextPath}/main">홈</a>
			<span>></span>
			<a href="#">구매안내</a>
			<h2>구매안내</h2>
		</div>
		<!-- 내용1 -->
		<div class="row content">				
			<div class="col-sm-5">
						<dl style="padding-left: 100px;">
							<dt class="h2 mb30"><strong class="fcBlue">경매</strong>가 <strong>처음이신가요?</strong></dt>
							<dd class="fs16 lineH26">모든 구매자와 판매자에게 열려있는 오픈마켓! 당신을 환영합니다.<br>더 이상 헤매지 마십시오. 옥션에 다 있습니다.</dd>
						</dl>
			</div>
			<div class="col-sm-7">
						<img src="${pageContext.request.contextPath}/resources/img/Guide-img1.jpg">
			</div><br>
			
				<div>
					<h3>옥션를 이용하시기 전에 꼭! 확인해주세요.</h3>
					<ul>
						<li><p>입찰취소는 불가하니 신중한 입찰 부탁 드립니다.</p></li>
						<li><p>옥션의 모든 거래는 매매보호서비스를 통해 안전하게 거래되어 반품, 교환, 환불이 가능합니다.</p></li>
						<li><p>[입금신청]시 작성하신 입금 신청서와 동일한 정보로 입금해주시면 더 빨리 물건을 받아보실 수 있습니다.</p></li>
						<li><p>옥션의 입찰방식은 가장 높은 입찰금액을 제시한 사람에게 낙찰(판매)됩니다.</p></li>
					</ul>
					<div class="table-bordered">
						<h4 class="mb40 fs16"><strong>온라인 경매 구매 절차 한 눈에 보기</strong></h4>
						<div class="text-center mb30">
							<img src="${pageContext.request.contextPath}/resources/img/buyGuide-step-img4.jpg">
							
						</div>
						<ul>
							<li><p>[입금]에 앞서 꼭[입금신청]을 해주시기 바랍니다.</p></li>
							<li><p>낙찰일로부터 7일(토/공휴일포함)이 지나도록 입금이 안되면, 미입금으로 구매거부와 동일하게 경매취소로 자동 처리됩니다.</p></li>
						</ul>
						<p><strong>1건 미입금</strong> : 구매 거부 조치</p>
						<p><strong>2건 미입금</strong> : 7일간 회원아이디 정지 및 입찰수수료 입금 전까지 사이트 이용제한</p>
						<p><strong>3건 미입금</strong> : 회원아이디 임시정지</p>
						
					</div>
				</div>
			</div>
		<!-- 내용2 -->
		<div class="row content">
			<h2>
				구매 입찰보증금
			</h2>
			<div class="col-sm-4 ">				
			<table class="table table-bordered">
				<thead>
					<tr class="text-center active">
						<th>입찰보증금</th>
						<th>비교</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1000원</td>
						<td>판매상품가격이 5만원 미만</td>
					</tr>
					<tr>
						<td>5000원</td>
						<td>5만원 이상 판매상품가격이 20만원미만</td>
					</tr>
					<tr>
						<td>10000원</td>
						<td>20만원이상 50만원미만</td>
					</tr>
					<tr>
						<td>30000원</td>
						<td>50만원이상 200만원미만</td>
					</tr>
					<tr>
						<td>100000원</td>
						<td>200만원이상</td>
					</tr>
					
				</tbody>
			</table>
			</div>
			
		</div>
		<div class="row text-center btn-col-2">
				<a class="btn btn-info" href="${pageContext.request.contextPath}/main">구매하기</a>
				<a class="btn btn-default"
					href="${pageContext.request.contextPath}/mypage/mypageMain">뒤로가기</a>
			</div>
	</div>			
	<!-- 오른쪽 여백 -->		
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />