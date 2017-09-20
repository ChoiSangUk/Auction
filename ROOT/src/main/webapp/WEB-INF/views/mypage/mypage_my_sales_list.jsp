<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8"/>
<style>
td,th {
	text-align: center !important;
	vertical-align: middle !important;
}


</style>
<div class="container-fluid text-center">

	<h1>나의 등록 물품</h1>
	<hr>
	<div class="row" style="margin-left:50px; margin-right:50px">
		<table class="table table-bordered">
			
			 <c:forEach var="mySalesGoods" items="${mySalesGoodsList}">
			 <c:set var="auctionGoodsState" value="${mySalesGoods.auctionGoodsVo.auctionGoodsState}"></c:set> 
			 <tbody>
				<tr>
					<th rowspan="3">
					 <img src="${mySalesGoods.auctionGoodsImageVo.auctionGoodsImagePath}" style="width:100px; height:100px;"/> 
					</th>
					<th colspan="2">
					 ${mySalesGoods.auctionGoodsVo.auctionGoodsName} 
					 <c:choose>
					 	<c:when test="${auctionGoodsState eq '등록대기'}">
					 	<span class="pull-right" style="color:blue">${mySalesGoods.auctionGoodsVo.auctionGoodsState}</span> 
					 	</c:when>
					 	<c:when test="${auctionGoodsState eq '판매중'}">
					 	<span class="pull-right">${mySalesGoods.auctionGoodsVo.auctionGoodsState}</span> 
					 	</c:when>
					 	<c:when test="${auctionGoodsState eq '판매종료'}">
					 	<span class="pull-right" style="color:red">${mySalesGoods.auctionGoodsVo.auctionGoodsState}</span> 
					 	</c:when>
					 	<c:when test="${auctionGoodsState eq '낙찰'}">
					 	<span class="pull-right" style="color:green">${mySalesGoods.auctionGoodsVo.auctionGoodsState}</span> 
					 	</c:when>
					 </c:choose>
					 
					</th>
					<td rowspan="3">
						<a class="btn btn-primary" href="#">상세보기</a><br>
						입찰 수 : ${mySalesGoods.auctionGoodsVo.auctionGoodsBidHits}<br>
						조회 수 : ${mySalesGoods.auctionGoodsVo.auctionGoodsHits}
					</td>
				</tr>
				<tr>
					<td colspan="2">시작가 :${mySalesGoods.auctionGoodsVo.auctionGoodsStartPrice}</td> 
				</tr>	
				<tr>
					<td>시작일 :${mySalesGoods.auctionGoodsVo.auctionGoodsStartDate}</td>
					<td>마감일 :${mySalesGoods.auctionGoodsVo.auctionGoodsEndDate}</td>
				</tr>				
				</tbody>
				
					  
			 </c:forEach> 
			
		</table>
	</div>
	
</div>
<script>

</script>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8"/>