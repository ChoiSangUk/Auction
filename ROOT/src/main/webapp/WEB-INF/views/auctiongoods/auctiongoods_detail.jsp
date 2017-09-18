<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<div style="margin-right: 100px; margin-left: 100px; margin-bottom:1px;"  id="top">
	<!-- 헤더 부분 -->
	<div>
		<div style="margin-top:5px;">
			<span>카테고리 뿌릴 곳</span>
		</div>
		<div style="text-align:center">
			<h1 style="font-size:300%">${auctionGoods.auctionGoodsName}</h1>
		</div>
	</div>
	<!-- 헤더 부분 end -->
	<hr>
	
	<!-- 물품 정보  -->
	<div class="row content">
		<!-- 왼쪽 물품 정보(사진) -->
		<div class="col-sm-12 col-md-6 image">
			<div class="bigImage" style="text-align:center">
				<img src="${auctionGoodsImages[0].auctionGoodsImagePath}" style="width:400px; height:450px;"/>
			</div>
		</div>	
		<!-- 왼쪽 물품 정보(사진)  end-->
		
		<!-- 오른쪽 물품 정보(내용) -->
		<div class="col-sm-12 col-md-6">
			<div style="text-align:center">
					<h3>
						<span style="color:blue">현재가 : </span>
						<span class="nowPrice" style="color:blue">1000(임시) </span>
					</h3>
						
					<h4>	
							<span >남은 시간</span>
						
						<span style="background-color:#B2EBF4">
							<span class="glyphicon glyphicon-hourglass"></span>
							<span id="timer"> 00:00:00 </span>
						</span>
					</h4>
			</div>
			
			<span id="instantBuySpan" style="display:none">${auctionGoods.auctionGoodsInstantBuyPrice}</span>
			<span id="SysSpan" style="display:none">${auctionGoods.auctionGoodsSys}</span>
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
						<th><span>${auctionGoods.auctionGoodsStartDate}</span> ~ <span id="endDate">${auctionGoods.auctionGoodsEndDate}</span></th>
					</tr>
					<tr>
						<th>시작가</th>
						<th>${auctionGoods.auctionGoodsStartPrice}</th>
					</tr>
					<tr>
						<th>경매방식</th>
						<th id="Sys"></th>
					</tr>
					<tr>
						<th>입찰방식</th>
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
			<div style="text-align:center;" class="myButton">
				<a class="btn btn-primary btn-lg" id="bidButton" href="#">입찰하기 </a>
				<a class="btn btn-default btn-lg" href="#">문의하기 </a>
			</div>
			<div id="auctionGoodsEnd" style="display:none; font-size:300%; text-align:center; color:red">판매 종료</div>
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
			<div style="width:100%;">${auctionGoods.auctionGoodsContents}</div>
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

//남은 시간 타이머
var endDate = $("#endDate").text();
var endDateArray = endDate.split('-');
var date = new Date(endDateArray[0]+'/'+endDateArray[1]+'/'+endDateArray[2]+' 00:00:00')

var now = new Date();
var result = date.getTime()-now.getTime()
var resultDate = parseInt((result/(1000*60*60*24)))
var resultHours = parseInt((result/(1000*60*60)) % 24)
var resultMin =parseInt((result/(1000*60)) % 60)
var resultSec = parseInt((result/1000) % 60)

var timer = function(){
	if(result > 0){
			console.log('timer')
			//console.log(result)
			result-=1000;
			resultDate = parseInt((result/(1000*60*60*24)))
			resultHours = parseInt((result/(1000*60*60)) % 24)
			resultMin =parseInt((result/(1000*60)) % 60)
			resultSec = parseInt((result/1000) % 60)
			$('#timer').text(resultDate+'일'+resultHours+'시'+resultMin+'분'+resultSec+'초')
	}
};

	
	$(document).ready(function(){
		//즉시구매 
		var auctionGoodsInstantBuyPrice = $('#instantBuySpan').text();
		if(auctionGoodsInstantBuyPrice == 0){
			$('#instantBuy').text("즉시구매 불가능");
		}else{
			$('#instantBuy').text(auctionGoodsInstantBuyPrice);
			$('#instantBuy').append('<a class="btn btn-primary" id="bidButton" href="#"> 즉시구매</a>');
		}
		
		//경매 방식
		var auctionGoodsSys = $('#SysSpan').text();
		var auctionGoodsBidSys = $('#bidSysSpan').text();
		
		if(auctionGoodsSys == 'normal'){
			$('#Sys').text("일반 경매");
		}else{
			$('#Sys').text("블라인드 경매");
		}
		if(auctionGoodsBidSys == 'normal'){
			$('#bidSys').text("공개");
		}else{
			$('#bidSys').text("비공개");
		}
		
		var sellerId = "${auctionGoods.userId}";
		var userId = "${userLoginInfo.userId}";
		var auctionGoodsCode = "${auctionGoods.auctionGoodsCode}";
		
		if(sellerId == userId){
			auctionGoodsState="${auctionGoods.auctionGoodsState}";
			console.log(auctionGoodsState)
			$('#bidButton').hide();
			
			//
			if(auctionGoodsState=="등록대기" || result>0){
				//post 방식으로 변경해야 함
				$('.myButton').append( '<a class="btn btn-default btn-lg"' +  
						'href="${pageContext.request.contextPath}/auctiongoods/auctiongoodsupdate?auctionGoodsCode='+auctionGoodsCode+' ">수정하기 </a>')
				//post 방식으로 변경해야 함
				//$('.myButton').append( '<a class="btn btn-default btn-lg"' +  
				//		'href="${pageContext.request.contextPath}/auctiongoods/auctiongoodsdelete?auctionGoodsCode='+auctionGoodsCode+' ">삭제하기 </a>')
			}
		}
		
		//타이머 실행
		timerStop=setInterval("timer()",1000)
		if(result<=0){
				clearInterval(timerStop)
				$('.myButton').hide();
				$('.bidButton').hide();
				$('#auctionGoodsEnd').show();
		}
	})
	
	
</script>


<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />