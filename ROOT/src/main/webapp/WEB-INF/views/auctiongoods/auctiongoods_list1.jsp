<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" />

<div class="container-fluid text-center">
	<div class="row content">
		<!-- 메인화면  -->
		<div class="col-sm-12 text-left">
			<h1>입찰창</h1>
			
			<div class="table-responsive">
				<table class="table table-hover">
				
					<thead>
						<tr>
							<th>품목명</th>
							<th>등록자</th>
							<th>입찰단위</th>
							<th>등록시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="auction" items="${list}">
							<tr>
								<td>${auction.auctionGoodsName}</td>
								<td>${auction.userId}</td>
								<td>${auction.auctionGoodsBidUnit}</td>
								<td>${auction.auctionGoodsRegistDate}</td>
								<td><a href="${pageContext.request.contextPath}
								/bid/bidform?auctionGoodsName=${auction.auctionGoodsName}
								&/bid/bidform?userId=${auction.userId}
								&/bid/bidform?auctionGoodsBidUnit=${auction.auctionGoodsBidUnit}
								">
								<button>입찰</button>
								</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />