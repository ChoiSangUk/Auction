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
				<a href="${pageContext.request.contextPath}/auctiongoods/auctiongoodslist" class="list-group-item list-group-item-info">전체보기</a>
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
			<div class="col-sm-12">
				<h1>경매물품 리스트</h1>
				<hr>
				<div class="row goodsList" style="margin-left: 20px">
				<!-- -----------------물품이 보여지는 곳 start----------------- -->
					<!-- <div class="col-sm-2" style="border: 1px solid #48BAE4; padding: 1px; margin: 8px">
						<div style="border-bottom:none;">
 							<img src="#" onerror="#" border="0"/>
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
					</div> -->
					
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
		
		
		//전체 물품을 뿌려주기 위한 ajax
		$.ajax({
			url : '${pageContext.request.contextPath}/auctiongoods/auctiongoodslist_getallgoods',
			type : 'get',
			dataType : 'json',
			error : function(xhr, status, e) {
				alert('auction goodsList ajax Error');
			},
			success : function(getData){
				var obj = jQuery.parseJSON(JSON.stringify(getData));
				//var parseObj = jQuery.parseJSON(JSON.stringify(obj[0]))
				console.log(obj[0].auctionGoodsImageVo);
				console.log(obj[0].auctionGoodsVo.auctionGoodsName);
				
				for(var i=0; i<obj.length; i++){
					var auctionGoodsCode = obj[i].auctionGoodsVo.auctionGoodsCode; //물품코드
					var userId =obj[i].auctionGoodsVo.userId;							//판매자아이디
					var auctionGoodsName=obj[i].auctionGoodsVo.auctionGoodsName; 		//물품명
					var auctionGoodsSys=obj[i].auctionGoodsVo.auctionGoodsSys;			//경매방식
					if(auctionGoodsSys=="normal"){
						auctionGoodsSys="일반경매";
					}else{
						auctionGoodsSys="블라인드경매";
					}
					
					var auctionGoodsTerm=obj[i].auctionGoodsVo.auctionGoodsTerm;		//판매기간
					var auctionGoodsStartDate=obj[i].auctionGoodsVo.auctionGoodsStartDate;	//시작일
					var auctionGoodsEndDate=obj[i].auctionGoodsVo.auctionGoodsEndDate;		
					var auctionGoodsStartPrice=obj[i].auctionGoodsVo.auctionGoodsStartPrice;
					var auctionGoodsInstantBuyState=obj[i].auctionGoodsVo.auctionGoodsInstantBuyState;
					var auctionGoodsInstantBuyPrice=obj[i].auctionGoodsVo.auctionGoodsInstantBuyPrice;
					
					var auctionGoodsState=obj[i].auctionGoodsVo.auctionGoodsState;
					var auctionGoodsHits=obj[i].auctionGoodsVo.auctionGoodsHits;
					var auctionGoodsBidHits=obj[i].auctionGoodsVo.auctionGoodsBidHits;
					var auctionGoodsImagePath=obj[i].auctionGoodsImageVo.auctionGoodsImagePath;
					
					var nowPrice=null;
					if(nowPrice == null){
						nowPrice=auctionGoodsStartPrice
					};
					//즉시구매가가 존재하면 태그를 추가
					if(auctionGoodsInstantBuyPrice!='0'){
						var auctionGoodsInstantBuyPriceTag = $('<div class="auctionGoodsInstantBuyPrice">'+'즉시구매가 : <strong>'+auctionGoodsInstantBuyPrice +'원</strong></div>');	
						
					}else{
						var auctionGoodsInstantBuyPriceTag = $('<div class="auctionGoodsInstantBuyPrice">'+'즉시구매 불가능</strong></div>');
					}
					var mainDivTag = $('<div class="col-sm-2 mainDiv btn btn-default" style="border:1px solid #48BAE4; padding: 1px; margin: 8px;"><span class="auctionGoodsCode" style="display:none;">'+auctionGoodsCode+'</span></div>');
					var imgDivTag = $('<div class="img" style="border-bottom:none;"><img src="'+auctionGoodsImagePath+'" style="width:90%; height:200px;" onerror="#" border="0"/></div>');
					var bottomDivTag = $('<div class="bottom"></div>');
					var auctionGoodsNameDivTag = $('<div class="auctionGoodsName">'+auctionGoodsName+'</div>');
					var auctionGoodsSysTag = $('<div class="auctionGoodsSys">'+auctionGoodsSys+'</div>');
					var nowPriceDivTag = $('<div class="nowPrice">'+'현재가 <strong>'+nowPrice +'원(입찰가로)</strong></div>');
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
					bottomDivTag.append(auctionGoodsSysTag);
					bottomDivTag.append(nowPriceDivTag);
					bottomDivTag.append(auctionGoodsInstantBuyPriceTag);
					bottomDivTag.append(remainingTimeDivTag);
					bottomDivTag.append(sellerIdDivTag);
					bottomDivTag.append(divTag);
					
					mainDivTag.append(imgDivTag);
					mainDivTag.append(bottomDivTag);
					
					$('.goodsList').append(mainDivTag);
				}
			
			//물품 클릭시 상세 페이지로 이동
			$('.mainDiv').click(function(){
				var auctionGoodsCode = $(this).find('.auctionGoodsCode').text();
				
				location.href = '${pageContext.request.contextPath}/auctiongoods/auctiongoods_detail?auctionGoodsCode='+auctionGoodsCode;
			});
			}
		})
	})
</script>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />


