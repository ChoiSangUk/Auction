<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8"/>
<!-- summernote css/js 추가 css는 적용이 깨져서 cdn주소로 대체 -->
<link href="${pageContext.request.contextPath}/resources/css/summernote.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.7/summernote.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/summernote.js"></script>
<!-- summernote-ko-KR 한글 추가 -->
<script src="${pageContext.request.contextPath}/resources/font/summernote-ko-KR.js"></script>
<style>
th {
	vertical-align: middle !important;
	text-align: center !important;
}
</style>

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="row title">
			<h1>광고신청 상세보기</h1>
		</div>
		<div class="row content">
			<!-- 광고신청 상세보기 폼 -->
			<form class="form-horizontal" action="${pageContext.request.contextPath}/ad/adminAdApplyDetail" method="post">
				<input type="hidden" name="adApplyApprovalDate" value="now">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th class="col-sm-2 active">광고신청코드</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="adApplyCode" 
									value="${adApplyList.adApplyCode}" readonly="readonly">
								</div>
							</td>
							<th class="col-sm-2 active">광고명</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="" 
									value="${adUnitPriceList.adUnitPriceName}" readonly="readonly">
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">신청인아이디</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="userId" 
									value="${adApplyList.userId}" readonly="readonly">
								</div>
							</td>
							<th class="col-sm-2 active">신청일</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="datetime" name="" 
									value="${adApplyList.adApplyRegistDate}" readonly="readonly">
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">광고시작일</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="" 
									value="${adApplyList.adApplyStartDate}" readonly="readonly">
								</div>
							</td>
							<th class="col-sm-2 active">광고종료일</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="" 
									value="${adApplyList.adApplyEndDate}" readonly="readonly">
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">광고신청상태</th>
							<td colspan="3">
								<div class="col-sm-10">
									<input type="hidden" id="radioCheck" value="${adApplyList.adApplyState}">
									<label class="radio-inline"><input type="radio" name="adApplyState" value="승인대기" id="stateWait">승인대기</label>
									<label class="radio-inline"><input type="radio" name="adApplyState" value="승인완료" id="stateSuccess">승인완료</label>
									<label class="radio-inline"><input type="radio" name="adApplyState" value="승인반려" id="stateReject">승인반려</label>
								</div>
							</td>
						</tr>
						<tr>
							<th class="active" colspan="4">광고 이미지</th>
						<tr>
						<tr>
							<td colspan="4">
								<div class="text-center">
								<img alt="" src="${pageContext.request.contextPath}/resources/files/${adImageList.adImageName}"
								style="width: 1000px; height: 500px;">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="form-group submit text-center">
					<input class="btn btn-info" type="submit" value="수정">
					<input class="btn btn-default" type="reset" value="다시쓰기">
					<a class="btn btn-success" href="${pageContext.request.contextPath}/ad/adminAdApplySearch">광고신청 리스트</a>
				</div>
			</form>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>

<script>

var radioCheck = $('#radioCheck').val();
if(radioCheck == '승인대기') {
	$('#stateWait').attr("checked", true);
} else if(radioCheck == '승인완료') {
	$('#stateSuccess').attr("checked", true);
} else if(radioCheck == '승인반려') {
	$('#stateReject').attr("checked", true);
}
</script>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8"/>