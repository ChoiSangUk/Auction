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
	width: 80%;
	margin: auto;
}


</style>

<div class="container-fluid text-left">
	<h1>광고신청 상세 화면</h1>
	<div class="row content">	
		<div class="col-sm-12">
			<!-- 광고신청 상세보기 폼 -->
			<form class="form-horizontal" action="${pageContext.request.contextPath}/ad/adminAdApplyDetail" method="post">
				<div class="form-group">
					<label class="col-sm-2 control-label">광고신청코드</label>
					<div class="col-sm-2">
						<input class="form-control" type="text" name="adApplyCode" value="${adApplyList.adApplyCode}" readonly="readonly">
					</div>				
					<label class="col-sm-1 control-label">광고명</label>
					<div class="col-sm-2">
						<input class="form-control" type="text" name="adUnitPriceCode1" value="${adUnitPriceList.adUnitPriceName}" readonly="readonly">
					</div>
					<label class="col-sm-1 control-label">아이디</label>
					<div class="col-sm-2">
						<input class="form-control" type="text" name="userId" value="${adApplyList.userId}" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">광고등록일</label>
					<div class="col-sm-2">
						<input class="form-control" type="datetime" name="adApplyRegistDate1" value="${adApplyList.adApplyRegistDate}" readonly="readonly">
					</div>
					<label class="col-sm-1 control-label">광고시작일</label>
					<div class="col-sm-2">
						<input class="form-control" type="datetime" name="adApplyStartDate1" value="${adApplyList.adApplyStartDate}" readonly="readonly">
					</div>
					<label class="col-sm-1 control-label">광고종료일</label>
					<div class="col-sm-2">
						<input class="form-control" type="datetime" name="adApplyEndDate1" value="${adApplyList.adApplyEndDate}" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">광고신청상태</label>
					<div class="col-sm-2">
						<input type="hidden" id="radioCheck" value="${adApplyList.adApplyState}">
						<label class="radio-inline"><input type="radio" name="adApplyState" value="승인대기" id="stateWait">승인대기</label>
						<label class="radio-inline"><input type="radio" name="adApplyState" value="승인완료" id="stateSuccess">승인완료</label>
					</div>
				</div>
				<div class="form-group">
					<textarea class="form-controll" id="summernote" name="adImageName">
					<img alt="" src="${pageContext.request.contextPath}/resources/files/${adImageList.adImageName}">
					</textarea>			
				</div>
				<div class="form-group submit text-center">
					<input class="btn btn-info" type="submit" value="수정">
					<input class="btn btn-default" type="reset" value="다시쓰기">
				</div>
			</form>
		</div>
	</div>
</div>

<script>
// summernote 불러오기 및 설정
$(document).ready(function() {
	$('#summernote').summernote({
		height : 500,
		lang : 'ko-KR',
	});
});

var radioCheck = $('#radioCheck').val();
if(radioCheck == '승인대기') {
	$('#stateWait').attr("checked", true);
} else {
	$('#stateSuccess').attr("checked", true);
}
</script>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8"/>