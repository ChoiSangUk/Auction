<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" />

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<form name="AdminRemoveUserSeach" id="AdminRemoveUserSeach" method="post"
		class="form-horizontal"
		action="${pageContext.request.contextPath}/user/adminRemoveUserSearch">
		<div class="col-sm-10">
			<div class="row title">
				<!-- 메인화면  -->
				<h1>탈퇴회원검색</h1>
				<div>
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/user/adminUserSearch">회원검색</a></li>
						<li><a
							href="${pageContext.request.contextPath}/user/adminRemoveUserSearch">탈퇴회원검색</a></li>
					</ul>
				</div>

			</div>

			<div class="tableDefault mb30">
				<div class="tableDefault mb30">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th class="text-center active">탈퇴구분</th>
								<td>

									<div>
										<label class="checkbox-inline"> <input type="checkbox"
											value="재가입 " name="userRemoveReasonArray"> 재가입
										</label><label class="checkbox-inline"> <input type="checkbox"
											value="미사용" name="userRemoveReasonArray"> 미사용
										</label> <label class="checkbox-inline"> <input type="checkbox"
											value="기타" name="userRemoveReasonArray"> 기타
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center active">최신순</th>
								<td>

									<div>
										<label class="radio-inline"> <input type="radio"
											value="day" name="userRemoveDate"> 일별보기
										</label> <label class="radio-inline"> <input type="radio"
											value="range-7d" name="userRemoveDate"> 최근일주
										</label> <label class="radio-inline"> <input type="radio"
											value="range-1m" name="userRemoveDate"> 최근1개월
										</label> <label class="radio-inline"> <input type="radio"
											value="range-3m" name="userRemoveDate"> 최근3개월
										</label> <label class="radio-inline"> <input type="radio"
											value="range-6m" name="userRemoveDate" checked> 최근6개월
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center active" rowspan="2">탈퇴기간검색</th>
								<td>
									<div>
										<label class="radio-inline"> <input type="radio"
											value="dateSearch" id="dateSearch" name="userRemoveDate">
											기간검색
										</label>
									</div>
									<div class="form-inline">
										<div class="col-sm-2 input-group date"
											data-provide="datepicker" id="date1">
											<input class="form-control" type="text" id="userRemoveStart"
												name="userRemoveDate1" disabled="disabled">
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
										<span>~</span>
										<div class="col-sm-2 input-group date"
											data-provide="datepicker" id="date2">
											<input class="form-control" type="text" id="userRemoveEndDate"
												name="userRemoveDate2" disabled="disabled">
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</td>
								<td>
							<tr>
								<td>

									<div class="col-sm-2">
										<select class="form-control" name="sk">
											<option value="userId">아이디</option>
										</select>
									</div>


									<div class="input-group col-sm-4">
										<input type="text" class="form-control" name="sv"
											placeholder="Search">
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
							<c:if test="${removeSearch ne null }">
				<h1>검색결과</h1>
			<table class="table table-bordered">
				<thead>
					<tr class="active">
						<th>탈퇴코드</th>
						<th>아이디</th>
						<th>사유</th>
						<th>사유이유</th>
						<th>가입날짜</th>
						<th>탈퇴날짜</th>
					</tr>
				</thead>
			<c:forEach var="removeSearch" items="${removeSearch}">
				<tbody>
					<tr>
						<td>${removeSearch.userRemoveCode}</td>
						<td>${removeSearch.userId}</td>
						<td>${removeSearch.userRemoveReason}</td>
						<td>${removeSearch.userRemoveReasonDetail}</td>
						<td>${removeSearch.userJoindate}</td>
						<td>${removeSearch.userRemoveDate}</td>					
					</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if>
			<!-- 결과값 테이블 -->
			<div class="row content text-center"></div>
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

$('input:radio[name=userRemoveDate]').click(function(){
	var checkVal = $('input:radio[name=userRemoveDate]:checked').val(); 
	console.log(checkVal);
	if(checkVal === 'day') {
		var subDate = moment().subtract(checkVal, 'days').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[id=userRemoveStart]').val(subDate);
		$('input:text[id=userRemoveEndDate]').val(nowDate);
		$('#userRemoveStart,#userRemoveEndDate').attr('disabled',true); 

	}else if(checkVal === 'range-7d') {
		checkVal = '7';
		var subDate = moment().subtract(checkVal, 'days').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[id=userRemoveStart]').val(subDate);
		$('input:text[id=userRemoveEndDate]').val(nowDate);
		$('#userRemoveStart,#userRemoveEndDate').attr('disabled',true); 
	}else if(checkVal === 'range-1m') {
		checkVal = '1';
		var subDate = moment().subtract(checkVal, 'months').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[id=userRemoveStart]').val(subDate);
		$('input:text[id=userRemoveEndDate]').val(nowDate);
		$('#userRemoveStart,#userRemoveEndDate').attr('disabled',true); 
	}else if(checkVal === 'range-3m') {
		checkVal = '3';
		var subDate = moment().subtract(checkVal, 'months').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[id=userRemoveStart]').val(subDate);
		$('input:text[id=userRemoveEndDate]').val(nowDate);
		$('#userRemoveStart,#userRemoveEndDate').attr('disabled',true); 
	}else if(checkVal === 'range-6m') {
		checkVal = '6';
		var subDate = moment().subtract(checkVal, 'months').format('YYYY-MM-DD');
		var nowDate = moment().format('YYYY-MM-DD');
		$('input:text[id=userRemoveStart]').val(subDate);
		$('input:text[id=userRemoveEndDate]').val(nowDate);
		$('#userRemoveStart,#userRemoveEndDate').attr('disabled',true); 
	}		
	console.log(subDate);
	console.log(nowDate);
});

	$('#dateSearch').click(function(){
		 $('#userRemoveStart,#userRemoveEndDate').removeAttr('disabled')
		 
	});

	
	

</script>
<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />