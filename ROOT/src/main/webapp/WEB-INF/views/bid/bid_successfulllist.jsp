<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<style>
th {
	vertical-align: middle !important;
	text-align: center !important;
}

.btn-lg {
	width: 125px !important;
}

.adApplyListTable > td {
	vertical-align: middle !important;
	text-align: center !important;
}
</style>

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="row title">
			<h1>개인 구매 진행 리스트</h1>
		</div>
		<!-- 광고신청리스트 검색 -->
		<div class="row">			
			<form class="form-horizontal" action="${pageContext.request.contextPath}/ad/adminAdApplySearch" method="post">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th class="col-sm-2 active" rowspan="2">기간별 검색<br></th>
							<td>
								<label class="radio-inline" style="margin-left: 15px;">
								<input type="radio" name="type" value="7">최근일주일</label>
								<label class="radio-inline"><input type="radio" name="type" value="1">최근1개월</label>
								<label class="radio-inline"><input type="radio" name="type" value="3">최근3개월</label>
								<label class="radio-inline"><input type="radio" name="type" value="6">최근6개월</label>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-inline dt">
								<div class="col-sm-3 input-group date" data-provide="datepicker" id="sdate"
								style="margin-left: 15px;">
									<input class="form-control" type="text" name="sDate">
									<div class="input-group-addon">
						        		<span class="glyphicon glyphicon-th"></span>
						    		</div>
								</div>
								<span style="margin-left: 15px;">~</span>
								<div class="col-sm-3 input-group date" data-provide="datepicker" id="edate"
								style="margin-left: 15px;">
									<input class="form-control" type="text" name="eDate">
									<div class="input-group-addon">
						        		<span class="glyphicon glyphicon-th"></span>
						    		</div>
								</div>
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">검색어</th>
							<td>
								<div class="col-sm-2">
									<select class="form-control" name="sk">
										<option value="adApplyCode">물품명</option>
										<option value="userId">판매자아이디</option>
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
							</td>
						</tr>
					</tbody>
				</table>
				<div class="form-group text-center">
					<input class="btn btn-info btn-lg" type="submit" id="submitBtn" value="검색">
					<input class="btn btn-lg" type="reset" id="resetBtn" value="검색삭제">
				</div>
			</form>
		</div>
		<!-- 결과값 테이블 -->
		<div class="row content text-center">
			<table class="table table-bordered">
				<thead>
					<tr class="active">
						<th>입찰코드</th>
						<th>입찰품목명</th>
						<th>입찰금액</th>
						<th>입찰시간</th>
		
					</tr>
				</thead>
				<c:forEach var="usergoodsbid" items="${usergoodsbidlist}">
				<tbody>
					<tr class="adApplyListTable">
						<td>${usergoodsbid.bidCode}</td>
						<td>${usergoodsbid.auctionGoodsName}</td>
						<td><fmt:formatNumber value="${usergoodsbid.bidPrice}" groupingUsed="true"/>원</td>
						<td>${usergoodsbid.bidDate}</td>
					
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>

<script>
$('#sdate').datepicker({
	format: 'yyyy-mm-dd',
	language: 'ko',
	orientation: 'bottom'
});			
$('#edate').datepicker({
	format: 'yyyy-mm-dd',
	language: 'ko',
	orientation: 'bottom'
});
$('input:radio[name=type]').click(function(){
	var checkVal = $('input:radio[name=type]:checked').val(); 
	console.log(checkVal);
	if(checkVal === '7') {
		var subDate = moment().subtract(checkVal, 'days').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[name=sDate]').val(subDate);
		$('input:text[name=eDate]').val(nowDate);
	}else if(checkVal === '1') {
		var subDate = moment().subtract(checkVal, 'months').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[name=sDate]').val(subDate);
		$('input:text[name=eDate]').val(nowDate);
	}else if(checkVal === '3') {
		var subDate = moment().subtract(checkVal, 'months').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[name=sDate]').val(subDate);
		$('input:text[name=eDate]').val(nowDate);
	}else if(checkVal === '6') {
		var subDate = moment().subtract(checkVal, 'months').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[name=sDate]').val(subDate);
		$('input:text[name=eDate]').val(nowDate);
	}
});

</script>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />