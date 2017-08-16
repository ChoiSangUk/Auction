<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" />

<div class="container-fluid text-center">
	<div class="row content">
		<!-- 메인화면  -->
		<div class="col-sm-12 text-left">
		<h1>광고단가 화면</h1>
		<div class="table-responsive"> 
			<table class="table table-hover">
				<thead>
					<tr>
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
						<td>${ad.adUnitPirceCode}</td>
						<td>${ad.adUnitPirceName}</td>
						<td>${ad.adUnitPricePrice}</td>
						<td>${ad.adUnitPriceState}</td>
						<td>
						<a href="${pageContext.request.contextPath}/ad/adminAdUnitUpdateForm?send_cd=${ad.adUnitPirceCode}"><button>수정</button></a>
						</td>
					</tr>			
				</tbody>		
				</c:forEach>	
			</table>
		</div>
		</div>
	</div>
</div>

<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />