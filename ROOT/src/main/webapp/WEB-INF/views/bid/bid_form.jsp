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
							<h2>입찰하기</h2>
							<th>입찰품목:
							<td></td>
							</th>
						</tr>
						<tr>
							<div>
								<td>
									<form role="form" id="priceaddForm" action="${pageContext.request.contextPath}/bid/price" method="post">
										<div class="form-group">
											<label for="bidPrice">입찰금액</label>
											 <input type="int" class="form-control" id="bidPrice" name="bidPrice" placeholder="금액">
											<button type = "sumbit"> 입찰</button>
										</div>
									</form>
								</td>
							</div>

						</tr>
						<tr>
							<th>입찰자</th>
							<th>입찰가격</th>
							<th>입찰시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bid" items="${list}">
							<tr>
								<td>${bid.userBuyerId}</td>
								<td>${bid.bidPrice}</td>
								<td>${bid.bidDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />