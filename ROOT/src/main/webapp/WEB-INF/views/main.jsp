<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8"/>
<style>
/* 물품이미지 */
.agListImg {
	padding: 5px 5px 5px 5px; 
	max-height: 180px;
	min-height: 180px;
}
/* 이미지 큰테두리 DIV*/
.agImgDiv {
	padding: 0px 5px 30px 5px;	
}
/* 이미지 보더를 위한 DIV */
.agImgBorderDib {
	border: 1px solid #BDBDBD;
	background-color: white;
}
/* 메인배너 물품리스트 제목 */
.mainAgListTitle {
	padding-bottom:16px;
	margin: 17px 5px 42px 5px;
	border-bottom: 1px;
	border-bottom-color: black;
	border-bottom-style: solid;
}

.mainAgList {
	padding: 0px;
}

.glyphicon-time {
	top: 0px !important;
}

.glyphicon-plus {
	color: #0000A5;
	padding-left: 10px;
	max-height: 25px;
	max-width: 28px;
	top: 1px !important;
}
/* 물품상세보기 링크 */
.agImgLink {
	text-decoration:none !important;
	color: black;
}
/* 모든물품리스트 링크 */
.agAllListLink {
	font-size: 15px;
	padding-top: 7px;
	vertical-align: bottom !important;	
}
.agAllListLink:hover { 
	text-decoration:none !important;
	color: #0000A5;
}
/* 물품정보(입찰수,조회수) */
.agInfoSpan {
	border-top: 1px solid #BDBDBD;
	border-bottom: 1px solid #BDBDBD;
	display:inline-block;
	min-width: 100%;
	background-color: #EAEAEA;
}
.agInfoTitleSpan {
	display:inline-block;
	min-width: 100%;
	text-align: center;
}
.agInfoPriceSpan {
	padding: 5px 5px 5px 5px;
	display:inline-block;
	min-width: 100%;
	text-align: center;
	color: #1F50B5;
	font-size: 16px;
}

.adInfoBidSpan {
	padding: 5px 5px 5px 5px;
	display: inline-block;
	min-width: 49%;
	text-align: center;
}

.adInfoUserSpan {
	padding: 5px 5px 3px 5px;
	display: inline-block;
	min-width: 100%;
	color: #7A7A7A;
}

.adInfoEndDateSpan {
	padding: 0 5px 5px 5px;
	display: inline-block;
	min-width: 100%;
	color: #7A7A7A;
}

.bidHighList {
	margin-left: 0px !important;
	background: url("${pageContext.request.contextPath}/resources/img/mainAgBackground.jpg");
	background-size: cover !important;
}
</style>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- 메인배너 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
	</ol>
	<!-- 메인배너 링크,이미지 -->
	<div class="carousel-inner" role="listbox">
		<div class="item active mainBanner">
			<a href="${pageContext.request.contextPath}/mypageAdInfo">
			<img src="${pageContext.request.contextPath}/resources/img/mainBanner.jpg" 
			style="width: 80%; height: 500px;" alt="Image" align="middle">
			</a>
		</div>
		<c:forEach var="ad" items="${adPaymentSuccessList}">
		<div class="item mainBanner">
			<a href="${pageContext.request.contextPath}/auctiongoods/auctiongoods_detail?auctionGoodsCode=${ad.adApplyVo.auctionGoodsCode}">
			<img src="${pageContext.request.contextPath}/resources/files/${ad.adImageVo.adImageName}" 
			style="width: 80%; height: 500px;" alt="Image" align="middle">
			</a>
		</div>
		</c:forEach>
	</div>

	<!-- 메인배너 선택기 -->
	<a class="left carousel-control" href="#myCarousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next"> <span
		class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>

<div class="container mainAgList text-center">
	<div class="row content">
		<div class="text-left">
		<!-- 인기경매(조회순  내림차순 정렬 8개) -->
		<h3 class="mainAgListTitle">
		Auction<strong> 인기경매</strong>
		<a href="${pageContext.request.contextPath}/auctiongoods/auctiongoodslist" class="pull-right agAllListLink">
		<span class="pull-right glyphicon glyphicon-plus"></span>
		전체보기
		</a>
		</h3>
		<c:forEach var="ag" items="${auctionGoodsListByHits}" begin="0" end="7">
		<c:set var="auctionGoodsState" value="${ag.auctionGoodsVo.auctionGoodsState}"/>
		<c:choose>
		<c:when test="${auctionGoodsState eq '판매중'}">
		<div class="col-sm-3 agImgDiv">
			<div class="col-sm-12 agImgBorderDib">
			<a href="${pageContext.request.contextPath}/auctiongoods/auctiongoods_detail?auctionGoodsCode=${ag.auctionGoodsVo.auctionGoodsCode}"
			class="agImgLink">
			<img src="${ag.auctionGoodsImageList.auctionGoodsImagePath}"
				class="img-responsive agListImg" style="width: 100%" alt="Image" 
				onERROR="this.src='${pageContext.request.contextPath}/resources/files/1504677731332_도자기.jpg'">
			<span class="agInfoTitleSpan">
			${ag.auctionGoodsVo.auctionGoodsName}
			</span>
			<span class="agInfoPriceSpan">
			경매시작가 <strong>${ag.auctionGoodsVo.auctionGoodsStartPrice}</strong> 원
			</span>
			<span class="agInfoSpan">
				<span class="adInfoBidSpan">입찰&nbsp;&nbsp;&nbsp;${ag.auctionGoodsVo.auctionGoodsBidHits}</span>
				<span class="adInfoBidSpan">조회수&nbsp;&nbsp;&nbsp;${ag.auctionGoodsVo.auctionGoodsHits}</span>
			</span>
			<span class="adInfoUserSpan">
			판매자&nbsp;&nbsp;${ag.auctionGoodsVo.userId}
			</span>
			<span class="adInfoEndDateSpan">
			<i class="glyphicon glyphicon-time"></i>
			경매마감일&nbsp;&nbsp;${ag.auctionGoodsVo.auctionGoodsEndDate}
			</span>
			</a>
			</div>
		</div>
		</c:when>
		</c:choose>
		</c:forEach>
		</div>
	</div>
</div>
<div class="container-fluid  bidHighList">
	<div class="container">
	<div class="row content">
		<div class="text-left">
		<!-- 인기경매(조회순  내림차순 정렬 8개) -->
		<h3 class="mainAgListTitle">
		Auction<strong> 입찰률이 높은 경매</strong>
		<a href="${pageContext.request.contextPath}/auctiongoods/auctiongoodslist" class="pull-right agAllListLink">
		<span class="pull-right glyphicon glyphicon-plus"></span>
		전체보기
		</a>
		</h3>
		<c:forEach var="ag" items="${auctionGoodsListByBidHits}" begin="0" end="7">
		<c:set var="auctionGoodsState" value="${ag.auctionGoodsVo.auctionGoodsState}"/>
		<c:choose>
		<c:when test="${auctionGoodsState eq '판매중'}">
		<div class="col-sm-3 agImgDiv">
			<div class="col-sm-12 agImgBorderDib">
			<a href="${pageContext.request.contextPath}/auctiongoods/auctiongoods_detail?auctionGoodsCode=${ag.auctionGoodsVo.auctionGoodsCode}"
			class="agImgLink">
			<img src="${ag.auctionGoodsImageList.auctionGoodsImagePath}"
				class="img-responsive agListImg" style="width: 100%" alt="Image" 
				onERROR="this.src='${pageContext.request.contextPath}/resources/files/1504677731332_도자기.jpg'">
			<span class="agInfoTitleSpan">
			${ag.auctionGoodsVo.auctionGoodsName}
			</span>
			<span class="agInfoPriceSpan">
			경매시작가 <strong>${ag.auctionGoodsVo.auctionGoodsStartPrice}</strong> 원
			</span>
			<span class="agInfoSpan">
				<span class="adInfoBidSpan">입찰&nbsp;&nbsp;&nbsp;${ag.auctionGoodsVo.auctionGoodsBidHits}</span>
				<span class="adInfoBidSpan">조회수&nbsp;&nbsp;&nbsp;${ag.auctionGoodsVo.auctionGoodsHits}</span>
			</span>
			<span class="adInfoUserSpan">
			판매자&nbsp;&nbsp;${ag.auctionGoodsVo.userId}
			</span>
			<span class="adInfoEndDateSpan">
			<i class="glyphicon glyphicon-time"></i>
			경매마감일&nbsp;&nbsp;${ag.auctionGoodsVo.auctionGoodsEndDate}
			</span>
			</a>
			</div>
		</div>
		</c:when>
		</c:choose>
		</c:forEach>
		</div>
	</div>
	</div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8"/>