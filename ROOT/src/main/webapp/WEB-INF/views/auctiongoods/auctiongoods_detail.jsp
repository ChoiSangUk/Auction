<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<div style="margin-right: 100px; margin-left: 100px; margin-bottom:1px;"  id="top">
	<!-- 헤더 부분 -->
	<div>
		<div>
			<span>카테고리 뿌릴 곳</span>
		</div>
		<div>
			<h1>${auctionGoods.auctionGoodsName}</h1>
		</div>
	</div>
	<!-- 헤더 부분 end -->
	<hr>
	
	<!-- 물품 정보  -->
	<div class="row content">
		<!-- 왼쪽 물품 정보(사진) -->
		<div class="col-sm-12 col-md-6 image">
			<div class="bigImage">
				<img src="${auctionGoodsImages[0].auctionGoodsImagePath}" style="width:333px; height:500px;"/>
			</div>
		</div>	
		<!-- 왼쪽 물품 정보(사진)  end-->
		
		<!-- 오른쪽 물품 정보(내용) -->
		<div class="col-sm-12 col-md-6">
			<h3>
				<span>현재가 : </span>
				<span class="nowPrice">1000(임시)</span>
				<span> 남은 시간</span>
			</h3>
			<span id="instantBuySpan" style="display:none">${auctionGoods.auctionGoodsInstantBuyPrice}</span>
			<span id="bidSysSpan" style="display:none">${auctionGoods.auctionGoodsBidSys}</span>
			<table class="table">
				<tbody>
					<tr>
						<th>판매자</th>
						<th>${auctionGoods.userId}</th>
					</tr>
					<tr>
						<th>물품번호</th>
						<th>${auctionGoods.auctionGoodsCode}</th>
					</tr>
					<tr>
						<th>경매기간</th>
						<th>${auctionGoods.auctionGoodsStartDate} ~ ${auctionGoods.auctionGoodsEndDate}</th>
					</tr>
					<tr>
						<th>시작가</th>
						<th>${auctionGoods.auctionGoodsStartPrice}</th>
					</tr>
					<tr>
						<th>경매방식</th>
						<th id="bidSys"></th>
					</tr>
					<tr>
						<th>입찰단위</th>
						<th>${auctionGoods.auctionGoodsBidUnit}</th>
					</tr>
					<tr>
						<th>즉시구매</th>
						<th id="instantBuy"></th>
					</tr>
					<tr>
						<th>입찰 수</th>
						<th>${auctionGoods.auctionGoodsBidHits}</th>
					</tr>
					
				</tbody>
			</table>
			<div style="text-align:center;">
				<a class="btn btn-primary btn-lg" href="#">입찰하기 </a>
				<a class="btn btn-default btn-lg" href="#">문의하기 </a>
			</div>
		</div>
		<!-- 오른쪽 물품 정보(내용) end -->
	</div>
	<!-- 물품 정보 end -->
	
	<!-- 물품 상세정보 -->
	<div class="row content">
		<div>
			<ol class="breadcrumb" id="goodsDetail" style="font-size:large;">
				<li><a href="#top">맨 위로</a></li>
				<li class="breadcrumb-item active">물품 상세 내용</li>
				<li><a href="#goodsQuestion">물품 문의</a></li>
			</ol>
		</div>
		
		<div class="row" >
			<div style="width:100%; height:700px;">${auctionGoods.auctionGoodsContents}</div>
		</div>
		
		
		<div>
			<ol class="breadcrumb" id="goodsQuestion" style="font-size:large;">
				<li><a href="#top">맨 위로</a></li>
				<li><a href="#goodsDetail">물품 상세 내용</a></li>
				<li class="breadcrumb-item active">물품 문의</li>
			</ol>
		</div>
		<div class="row" >
			
		</div>
	</div>
	
</div>
<script>
	$(document).ready(function(){
		//즉시구매 
		var auctionGoodsInstantBuyPrice = $('#instantBuySpan').text();
		if(auctionGoodsInstantBuyPrice == 0){
			$('#instantBuy').text("즉시구매 불가능");
		}else{
			$('#instantBuy').text(auctionGoodsInstantBuyPrice);
		}
		
		//경매 방식
		var auctionGoodsBidSys = $('#bidSysSpan').text();
		if(auctionGoodsBidSys == 'normal'){
			$('#bidSys').text("일반 경매");
		}else{
			$('#bidSys').text("블라인드 경매");
		}
	})
</script>


<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />