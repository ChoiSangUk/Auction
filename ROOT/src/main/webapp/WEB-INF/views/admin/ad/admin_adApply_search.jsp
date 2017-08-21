<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" />

<div class="container-fluid text-center">
	<div class="row content">
		<!-- 광고신청 리스트  -->
		<div class="col-sm-12 text-left">
			<h1>광고신청 리스트 화면</h1>
			<!-- 광고신청리스트 검색 -->
			<form class="form-horizontal" action="#" method="post">
				<div class="form-group">
					<div class="col-sm-2">
						<select class="form-control" name="sk">
							<option value="adApplyCode">광고신청코드</option>
							<option value="userId">아이디</option>
							<option value="adApplyRegistDate">광고신청일</option>
							<option value="adApplyState">광고신청상태</option>
						</select>
					</div>
					<div class="input-group col-sm-4">
						<input type="text" class="form-control" name="sv" placeholder="Search">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</div>
			</form>
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>광고신청 코드</th>
							<th>아이디</th>
							<th>광고신청일</th>
							<th>광고시작일</th>
							<th>광고종료일</th>
							<th>광고신청상태</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<c:forEach var="ad" items="${adApplyList}">
						<tbody>
							<tr>
								<td>${ad.adApplyCode}</td>
								<td>${ad.userId}</td>
								<td>${ad.adApplyCode}</td>
								<td>${ad.adApplyRegistDate}</td>
								<td>${ad.adApplyEndDate}</td>
								<td>${ad.adApplyState}</td>
								<td><a
									href="${pageContext.request.contextPath}/ad/adminAdApplyDetail?adApplyCode=${ad.adApplyCode}"><button>상세보기</button></a>
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