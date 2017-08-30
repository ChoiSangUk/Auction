<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" />

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="row title">
		<!-- 메인화면  -->
		<h1>광고단가 화면</h1>
		</div>
		<div class="row content">
			<table class="table table-bordered">
				<thead>
					<tr class="active">
						<th>광고단가 코드</th>
						<th>광고명</th>
						<th>광고가격</th>
						<th>광고적용상태</th>
						<th>수정</th>
					</tr>
				</thead>
				<c:forEach var="ad" items="${list}">
				<tbody>
					<tr>					
						<td>${ad.adUnitPriceCode}</td>
						<td>${ad.adUnitPriceName}</td>
						<td>${ad.adUnitPricePrice}</td>
						<td>${ad.adUnitPriceState}</td>
						<td>
						<a href="${pageContext.request.contextPath}/ad/adminAdUnitUpdateForm?adUnitPriceCode=${ad.adUnitPriceCode}">
						<button>수정</button>
						</a>
						</td>
					</tr>			
				</tbody>		
				</c:forEach>	
			</table>
		</div>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />