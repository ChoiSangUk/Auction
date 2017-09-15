<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" />

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<form name="AdminSaleslogSeach" id="AdminSaleslogSeach" method="post"
			class="form-horizontal" action="${pageContext.request.contextPath}/saleslog/adminSalesLogList">
	<div class="col-sm-10">
		<div class="row title">
		<!-- 메인화면  -->
		<h1>매입/매출검색 </h1>
		</div>
		
		<div class="row content">
			<div class="tableDefault mb30">
						<div class="tableDefault mb30">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th class="text-center active">관련테이블</th>
									<td>
										
											<div>
												<label class="checkbox-inline" style="margin-left: 15px;"> 
												
												<input
													id="chk1" type="checkbox" value="ad_payment_tb" name="salesLogRelationArray"> 광고
												</label><input
													id="chk2" type="checkbox" value="ad_refund_apply_tb" name="salesLogRelationArray" hidden=""> 
												<label class="checkbox-inline"> <input
													id="chk3" type="checkbox" value="auction_goods_tb" name="salesLogRelationArray"> 판매자보증금
												</label><label class="checkbox-inline"> <input
													id="chk4" type="checkbox" value="cash_tb" name="salesLogRelationArray"> 캐쉬
												</label><label class="checkbox-inline"> <input
													id="chk5" type="checkbox" value="test_tb" name="salesLogRelationArray"> 테스트
												</label>
												
											</div>
										</td>
										
									</tr>
									<tr>
										<th class="text-center active">입/출금 관련</th>
									<td>
										
											<div>
												<label class="radio-inline" style="margin-left: 15px;"> <input
													type="radio" value="입금" name="salesLogDepositAndWithdrawal"> 입금
												</label><label class="radio-inline"> <input
													type="radio" value="출금" name="salesLogDepositAndWithdrawal"> 출금
												</label>
												
											</div>
										</td>
										
									</tr>
									<tr>
										<th class="text-center active">날짜순</th>
										<td>
											
											<div>
												<label class="radio-inline" style="margin-left: 15px;"> <input type="radio"
													value="day" name="salesLogDate" > 일별보기
												</label> <label class="radio-inline"> <input type="radio"
													value="range-7d" name="salesLogDate"> 최근일주
												</label> <label class="radio-inline"> <input type="radio"
													value="range-1m" name="salesLogDate"> 최근1개월
												</label> <label class="radio-inline"> <input type="radio"
													value="range-3m" name="salesLogDate"> 최근3개월
												</label> <label class="radio-inline"> <input type="radio"
													value="range-6m" name="salesLogDate" checked> 최근6개월
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th class="text-center active" rowspan="2">조회방법</th>
																				<td>
											<div style="margin-left: 15px;">
												<label class="radio-inline"> <input type="radio" value="dateSearch"
													id="dateSearch" name="salesLogDate" > 기간검색
												</label>
											</div>
											<div class="form-inline" style="margin-left: 15px;">
												<div class="col-sm-2 input-group date"
													data-provide="datepicker" id="date1">
													<input class="form-control" type="text"
														id="salesStartDate" name="salesLogDate1" value="${salesLogDate1}" disabled="disabled">
													<div class="input-group-addon">
														<span class="glyphicon glyphicon-th"></span>
													</div>
												</div>
												<span>~</span>
												<div class="col-sm-2 input-group date"
													data-provide="datepicker" id="date2">
													<input class="form-control" type="text"
														id="salesEndtDate" name="salesLogDate2" value="${salesLogDate2}" disabled="disabled">
													<div class="input-group-addon">
														<span class="glyphicon glyphicon-th"></span>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
																
											<div class="col-sm-2">
												<select class="form-control" name="sk">
													<option value="salesLogUserId">아이디</option>
												</select>
											</div>
											
											
											<div class="input-group col-sm-4">
												<input type="text" class="form-control" name="sv" value="${sv}" placeholder="Search">
											</div>
										</td>
									</tr>
								</tbody>

							</table>
						</div>
					</div>
					<div class="row text-center btn-col-2">
						<input class="btn btn-info btn-lg" type="submit" id="submitBtn" value="검색">
						<input class="btn btn-lg" type="reset" id="resetBtn" value="검색삭제">
					</div>
			<c:if test="${list ne null}">		
				<h1>검색결과 </h1>
			<table class="table table-bordered">
			
				<thead>
					<tr class="active">
						<th>입출금코드</th>
						<th>입/출금</th>
						<th>회원아이디</th>
						<th>가격</th>
						<th>날짜</th>
						<th>구분</th>
					</tr>
				</thead>
			
				<tbody>
				<c:forEach var="list" items="${list}">
					<tr>
					
						<td>${list.salesLogCode}</td>
						<td>${list.salesLogDepositAndWithdrawal}</td>
						<td>${list.salesLogUserId}</td>
						<td>${list.salesLogPrice}원</td>
						<td>${list.salesLogDate}</td>
						<td>${list.salesLogRemarks}</td>
					
											 
					</tr>
				</c:forEach>
					</tbody>
				
			</table>
		</c:if>
				</div>

		<!-- 결과값 테이블 -->
		<div class="row content text-center">
			
		</div>
	</div>
	</form>
	<div class="col-sm-1"></div>
	
</div>
<script>
$('#date1, #date2').datepicker({
	format: 'yyyy-mm-dd',
	language: 'ko',
	orientation: 'bottom'
});			

$('input:radio[name=salesLogDate]').click(function(){
	var checkVal = $('input:radio[name=salesLogDate]:checked').val(); 
	console.log(checkVal);
	if(checkVal === 'day') {
		var subDate = moment().subtract(checkVal, 'days').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[id=salesStartDate]').val(subDate);
		$('input:text[id=salesEndtDate]').val(nowDate);
		$('#salesStartDate,#salesEndtDate').attr('disabled',true); 

	}else if(checkVal === 'range-7d') {
		checkVal = '7';
		var subDate = moment().subtract(checkVal, 'days').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[id=salesStartDate]').val(subDate);
		$('input:text[id=salesEndtDate]').val(nowDate);
		$('#salesStartDate,#salesEndtDate').attr('disabled',true); 
	}else if(checkVal === 'range-1m') {
		checkVal = '1';
		var subDate = moment().subtract(checkVal, 'months').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[id=salesStartDate]').val(subDate);
		$('input:text[id=salesEndtDate]').val(nowDate);
		$('#salesStartDate,#salesEndtDate').attr('disabled',true); 
	}else if(checkVal === 'range-3m') {
		checkVal = '3';
		var subDate = moment().subtract(checkVal, 'months').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[id=salesStartDate]').val(subDate);
		$('input:text[id=salesEndtDate]').val(nowDate);
		$('#salesStartDate,#salesEndtDate').attr('disabled',true); 
	}else if(checkVal === 'range-6m') {
		checkVal = '6';
		var subDate = moment().subtract(checkVal, 'months').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[id=salesStartDate]').val(subDate);
		$('input:text[id=salesEndtDate]').val(nowDate);
		$('#salesStartDate,#salesEndtDate').attr('disabled',true); 
	}		
	console.log(subDate);
	console.log(nowDate);
});

	$('#dateSearch').click(function(){
		 $('#salesStartDate,#salesEndtDate').removeAttr('disabled')
		 
	});
	
	$('#chk1').click(function(){
		$("#chk2").prop('checked', true) ;
	

	});								
		
</script>

<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />