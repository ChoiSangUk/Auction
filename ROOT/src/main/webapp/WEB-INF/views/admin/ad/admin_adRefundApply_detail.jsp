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
.note-editor {
	width: 100%;
	margin: auto;
}
th {
	vertical-align: middle !important;
	text-align: center !important;
}

</style>

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="row title">
			<h1>광고환불신청 상세보기</h1>
		</div>
		<div class="row content">
			<!-- 광고신청 상세보기 폼 -->
			<form class="form-horizontal" action="${pageContext.request.contextPath}/ad/adminAdRefundApplyDetail" method="post">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th class="col-sm-2 active">광고환불신청코드</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="adRefundApplyCode" 
									value="${adRefundDetailList.adRefundApplyVo.adRefundApplyCode}" readonly="readonly">
								</div>
							</td>
							<th class="col-sm-2 active">광고결제코드</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="" 
									value="${adRefundDetailList.adRefundApplyVo.adPaymentCode}" readonly="readonly">
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">결제금액</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="" 
									value="${adRefundDetailList.adPaymentVo.adPaymentPrice}" readonly="readonly">
								</div>
							</td>
							<th class="col-sm-2 active">광고환불신청일</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="datetime" name="adRefundApplyRegistDate" 
									value="${adRefundDetailList.adRefundApplyVo.adRefundApplyRegistDate}" readonly="readonly">
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">환불금액</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="adRefundApplyPrice" 
									value="${adRefundDetailList.adRefundApplyVo.adRefundApplyPrice}" readonly="readonly">
								</div>
							</td>
							<th class="col-sm-2 active">광고환불처리일</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="adRefundApplySuccessDate" 
									value="${adRefundDetailList.adRefundApplyVo.adRefundApplySuccessDate}" readonly="readonly">
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">신청사유</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="adRefundApplyReason" 
									value="${adRefundDetailList.adRefundApplyVo.adRefundApplyReason}" readonly="readonly">
								</div>
							</td>
							<th class="col-sm-2 active">아이디</th>
							<td>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="userId" 
									value="${adRefundDetailList.adRefundApplyVo.userId}" readonly="readonly">
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">광고환불신청상태</th>
							<td colspan="3">
								<div class="col-sm-10">
									<input type="hidden" id="radioCheck" value="${adRefundDetailList.adRefundApplyVo.adRefundApplyState}">
									<label class="radio-inline"><input type="radio" name="adRefundApplyState" value="승인대기" id="stateWait">승인대기</label>
									<label class="radio-inline"><input type="radio" name="adRefundApplyState" value="승인완료" id="stateSuccess">승인완료</label>
									<label class="radio-inline"><input type="radio" name="adRefundApplyState" value="승인반려" id="stateReject">승인반려</label>
								</div>
							</td>
						</tr>						
					</tbody>
				</table>
				<div class="form-group submit text-center">
					<input class="btn btn-info" type="submit" value="수정">
					<input class="btn btn-default" type="reset" value="다시쓰기">
					<a class="btn btn-success" href="${pageContext.request.contextPath}/ad/adminAdRefundApplySearch">광고환불신청 리스트</a>
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