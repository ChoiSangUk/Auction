<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<body>
<div class="container-fluid text-center">
	<div class="row content">
		<!-- 메인화면  -->
		<div class="col-sm-12 text-left">
			<h1>입찰창</h1>
			<tr id = "totalcash">보유캐쉬:<fmt:formatNumber  value="${totalcash}"
									groupingUsed="true" />캐쉬</tr>
			<div class="table-responsive">
				<table class="table table-hover">

					<thead>
						<tr>※입찰보증금액표 :
						</tr>
						<div>판매상품가격이 5만원 미만 : 1,000원</div>
						<div>5만원 이상 20만원미만 : 5,000원</div>
						<div>20만원이상 50만원미만 : 10,000원</div>
						<div>50만원이상 200만원미만 : 30,000원</div>
						<div>200만원이상 : 100,000원</div>
						<tr>
							<h2>입찰하기</h2>
							<th>품목명: ${auctionGoodsName} </th>
							<th>시작가격:<fmt:formatNumber value="${auctionGoodsStartPrice}"
									groupingUsed="true" />원
							</th>
							<th>입찰단위:<fmt:formatNumber value="${auctionGoodsBidUnit}"
									groupingUsed="true" />원
							</th>
						</tr>
						<tr>
							<div>
								<td>
									<form id = "addForm" role="form" id="priceaddForm"
										action="${pageContext.request.contextPath}/bid/price"
										method="post">
										<div class="form-group">
											<label for="bidPrice">입찰금액</label> <input 
												class="form-control" id="bidPrice" name="bidPrice"
												placeholder="시작가 <fmt:formatNumber value="${auctionGoodsStartPrice}" groupingUsed="true"/>원">
												<input type="hidden" name="auctionGoodsCode" value="${auctionGoodsCode}">
												<input type="hidden" name="userId" value="${userId}">
												<input type="hidden" name="auctionGoodsName" value="${auctionGoodsName}">
												<input type="hidden" id="auctionGoodsBidUnit" name="auctionGoodsBidUnit" value="${auctionGoodsBidUnit} ">
												<input type="hidden" id="auctionGoodsStartPrice" name="auctionGoodsStartPrice" value="${auctionGoodsStartPrice}">								
											<!--   <button name = "addbutton" type="submit">입찰</button> -->
												 <input class="btn btn-default" id="addButton" type="button" value="입찰"/>
										</div>
									</form>
								</td>
							</div>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
			</div>
		</div>
	</div></div>
</body>
<script>

		var totalcash = parseInt($('#totalcash').val());
		var auctionGoodsBidUnit = parseInt($('#auctionGoodsBidUnit').val());
	    var highBidPrice  = parseInt($('#highBidPrice').val());
    	var auctionGoodsStartPrice = parseInt($('#auctionGoodsStartPrice').val());
 
    	console.log(auctionGoodsStartPrice);
    	console.log(highBidPrice);
    	console.log(auctionGoodsBidUnit);
    	
         $('#addButton').click(function(){
        	var bidPrice = parseInt($('#bidPrice').val());
        	if(totalcash < 999){
        		event.preventDefault();
        		alert('캐쉬가 부족합니다 충전 후 다시 입찰해주세요.');
        		
        	}else if(isNaN(bidPrice)){
        		event.preventDefault();
        		alert('숫자를 입력해주세요.');
        	}else if(bidPrice <= auctionGoodsStartPrice) {
            	event.preventDefault();
                alert('입찰금액은 시작가격이상 이어야 합니다.');
       		}else if(bidPrice = auctionGoodsBidUnit + highBidPrice) {
       			event.preventDefault();
                alert('입찰단위에 맞춰 입찰해주세요.');
            }else {
                $('#addForm').submit();
            }
        });
   
</script>
	<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />