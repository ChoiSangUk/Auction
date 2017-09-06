<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<div style="margin-right: 100px; margin-left: 100px;">
	<div class="col-md-12 container-fluid">
		<!-- ---------------------------대분류 부분------------------------ -->
		<div class="col-md-4 visible-lg visible-sm ">
			<h3 class="visible-lg visible-md visible-sm">대분류 전체</h3>
			<br>
			<div class="list-group largeCategoryList" style="overflow: auto; height: 300px;">
				<a href="#" class="list-group-item list-group-item-info">전체보기</a>
				<c:forEach var="largeCategory" items="${largeCategory}">
					<a class="list-group-item"
						href="${pageContext.request.contextPath}/auctiongoods/auctiongoodslist_middle?largeCategoryCode=${largeCategory.largeCategoryCode}">
						<span class="largeCategoryCode" style="display:none;">${largeCategory.largeCategoryCode}</span>
						${largeCategory.largeCategoryName} <!-- 대분류 코드 값을 넣어 전달하여 중분류 선택  -->
					</a>

				</c:forEach>
			</div>
		</div>
		<!-- ---------------------------대분류 부분 end------------------------ -->

		<!-- ---------------------------중분류 부분------------------------ -->
		<div class="col-md-4 visible-lg visible-sm">
			<h3 class="visible-lg visible-md visible-sm">중분류 전체</h3>
			<br>
			<div class="list-group" style="overflow: auto; height: 300px;">
				<a class="list-group-item list-group-item-info" href="#">전체보기</a>
				<c:forEach var="middleCategory" items="${middleCategoryList}">
					<a class="list-group-item"
						href="${pageContext.request.contextPath}/auctiongoods/auctiongoodslist_small?largeCategoryCode=${middleCategory.largeCategoryCode}&middleCategoryCode=${middleCategory.middleCategoryCode}">
						${middleCategory.middleCategoryName }
						</a>
				</c:forEach>
			</div>
		</div>
		<!-- ---------------------------중분류 부분 end------------------------ -->

		<!-- ---------------------------소분류 부분------------------------ -->
		<div class="col-md-4 visible-lg visible-sm">
			<h3 class="visible-lg visible-md visible-sm">소분류 전체</h3>
			<br>

			<div class="list-group" style="overflow: auto; height: 300px;">
				<a class="list-group-item list-group-item-info" href="#">전체보기</a>
				<c:forEach var="smallCategory" items="${smallCategoryList}">
					<a class="list-group-item" href="#">${smallCategory.smallCategoryName }</a>
				</c:forEach>
			</div>
		</div>
		<!-- ---------------------------소분류 부분 end------------------------ -->
	</div>
	<hr>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-12 text-left">
				<h1>경매물품 리스트</h1>
				<hr>
				<div class="row goodsList" style="margin-left: 20px">
				<!-- -----------------물품이 보여지는 곳 start----------------- -->
					<div class="col-sm-2" style="border: 1px solid #48BAE4; padding: 1px; margin: 8px">
						<div style="border-bottom:none;">
 							<!-- <img src="#" onerror="#" border="0"/> -->
						</div>
						<div>
							<div class="auctionGoodsName">
								물품명
							</div>
							<div class="nowPrice">
								현재가 : 1,000 원
							</div>
							<div class="remainingTime">
									<strong> 남은시간 : 9일 22시간 </strong>
							</div>
							<div class="sellerId">
									<strong> 판매자 아이디 </strong>
							</div>
							<div>
								<span style="width:45%; display:inline-block;">
									입찰수 :<span class="bidCount">0</span>
								</span>
								<span style="width:45%; display:inline-block;">		
										조회수 : <span class="auctionGoodsHits">0</span>
								</span>		
							</div>
						</div>
					</div>
					
						<!-- -----------------물품이 보여지는 곳 end----------------- -->
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		
		//대분류 코드를 뽑아서 
		var largeCategoryList =  $('.largeCategoryCode') //선택자를 변수에 담고
		var largeCategoryCode = new Array(); 			//선택자의 내용을 담을 변수 선언
		largeCategoryList.each(function(index){
		 	largeCategoryCode[index] = $(this).text();	//선택자의 개수만큼 각각의 largeCategoryCode[index]에 해당 선택자의 text 입력
		})
		
		$('.nowPrice').text('12341234')
		console.log($('.nowPrice').text())
		
		//전체 물품을 뿌려주기 위한 ajax
		$.ajax({
			url : '${pageContext.request.contextPath}/auctiongoods/auctiongoodslist_getallgoods',
			type : 'get',
			dataType : 'json',
			error : function(xhr, status, e) {
				alert('ajax Error');
			},
			success : function(getData){
				var obj = jQuery.parseJSON(JSON.stringify(getData));
				console.log('obj의 length'+obj.length);
				console.log(obj[1].auctionGoodsName);
				
				for(var i=0; i<obj.length; i++){
					var auctionGoodsCode = obj[i].auctionGoodsCode;
					var userId =obj[i].userId;
					var smallCategoryCode=obj[i].smallCategoryCode;
					var	middleCategoryCode=obj[i].middleCategoryCode;
					var largeCategoryCode=obj[i].largeCategoryCode;
					var auctionGoodsName=obj[i].auctionGoodsName;
					var auctionGoodsSys=obj[i].auctionGoodsSys;
					var auctionGoodsBidSys=obj[i].auctionGoodsBidSys;
					var auctionGoodsContents=obj[i].auctionGoodsContents;
					var auctionGoodsRegistDate=obj[i].auctionGoodsRegistDate;
					var auctionGoodsTerm=obj[i].auctionGoodsTerm;
					var auctionGoodsStartDate=obj[i].auctionGoodsStartDate;
					var auctionGoodsEndDate=obj[i].auctionGoodsEndDate;
					var auctionGoodsStartPrice=obj[i].auctionGoodsStartPrice;
					var auctionGoodsBidUnit=obj[i].auctionGoodsBidUnit;
					var auctionGoodsInstantBuyState=obj[i].auctionGoodsInstantBuyState;
					var auctionGoodsInstantBuyPrice=obj[i].auctionGoodsInstantBuyPrice;
					var auctionGoodsState=obj[i].auctionGoodsState;
					var auctionGoodsHits=obj[i].auctionGoodsHits;
					var auctionGoodsBidHits=obj[i].auctionGoodsBidHits;
					
					var mainDivTag = $('<div class="col-sm-2" style="border:1px solid #48BAE4; padding: 1px; margin: 8px"></div>');
					var imgDivTag = $('<div class="img" style="border-bottom:none;"></div>');
					var bottomDivTag = $('<div class="bottom"></div>');
					var auctionGoodsNameDivTag = $('<div class="auctionGoodsName">'+auctionGoodsName+'</div>');
					var nowPriceDivTag = $('<div class="nowPrice">'+'강산(현재가)원' +'</div>');
					var remainingTimeDivTag = $('<div class="remainingTime"><strong>'+'남은시간(미구현)'+'</strong></div>');
					var sellerIdDivTag = $('<div class="sellerId">판매자 : <strong>'+userId +'</strong></div>');
					var divTag = $('<div>'+
					                '<span style="width:45%; display:inline-block;">' +
									'입찰수 :<span class="bidCount">'+auctionGoodsBidHits +'</span>'+
									'</span>'+
									'<span style="width:45%; display:inline-block;">'+		
									'조회수 : <span class="auctionGoodsHits">'+auctionGoodsHits +'</span>'+
									'</span>'+		
									'</div>');
					
					bottomDivTag.append(auctionGoodsNameDivTag);
					bottomDivTag.append(nowPriceDivTag);
					bottomDivTag.append(remainingTimeDivTag);
					bottomDivTag.append(sellerIdDivTag);
					bottomDivTag.append(divTag);
					
					mainDivTag.append(imgDivTag);
					mainDivTag.append(bottomDivTag);
					
					$('.goodsList').append(mainDivTag);
				}
			}
		})
		
	})		
</script>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />














