<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" />

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

.paging {
	margin-left: 1px;
	margin-right: 1px;
}

</style>

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="row title">
			<h1>광고신청 리스트</h1>
		</div>
		<!-- 광고신청리스트 검색 -->
		<div class="row">			
			<form class="form-horizontal" action="${pageContext.request.contextPath}/ad/adminAdApplySearch" method="post">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th class="col-sm-2 active" rowspan="2">기간별 검색<br>(신청일 기준)</th>
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
										<option value="adApplyCode">광고신청코드</option>
										<option value="userId">아이디</option>
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
						<th>광고신청 코드</th>
						<th>아이디</th>
						<th>광고신청일</th>
						<th>광고시작일</th>
						<th>광고종료일</th>
						<th>광고신청상태</th>
						<th>광고승인/반려일</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<c:forEach var="ad" items="${adApplyList}">
				<tbody>
					<tr class="adApplyListTable">
						<td>${ad.adApplyCode}</td>
						<td>${ad.userId}</td>
						<td>${ad.adApplyRegistDate}</td>
						<td>${ad.adApplyStartDate}</td>
						<td>${ad.adApplyEndDate}</td>
						<td>${ad.adApplyState}</td>
						<td>${ad.adApplyApprovalDate}</td>
						<td><a class="btn btn-success"
							href="${pageContext.request.contextPath}/ad/adminAdApplyDetail?adApplyCode=${ad.adApplyCode}">상세보기</a>
						</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
			<div class="" id="paging"></div>
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

/* jquery pagin */

	
	$('#paging').paging({
		current:5,		
		max:50
	});
	$('.paging').focus(function(){
		var page = $(this).attr('href');
		console.log(page);
	$('.paging').attr('href','${pageContext.request.contextPath}/ad/adminAdApplySearch?currentPage='+page);
	});
	
</script>

<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />