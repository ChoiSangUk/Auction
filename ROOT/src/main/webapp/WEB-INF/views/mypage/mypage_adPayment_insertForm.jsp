<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8"/>
<!-- summernote css/js 추가 css는 적용이 깨져서 cdn주소로 대체 -->
<link href="${pageContext.request.contextPath}/resources/css/summernote.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.7/summernote.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/summernote.js"></script>
<!-- summernote-ko-KR 한글 추가 -->
<script src="${pageContext.request.contextPath}/resources/font/summernote-ko-KR.js"></script>
<style>
.note-editor {	
	width : 80%;
	margin: auto;
}
</style>


<div class="container-fluid text-center">
	<div class="row content">
		<div class="col-sm-12 text-left"> 
			<h1>광고신청 화면</h1>
			<!-- 물품광고신청 폼 -->
	    	<form class="form-horizontal" action="${pageContext.request.contextPath}/mypage/adApplyInsertForm" method="post">
				<input class="form-control" type="hidden" name="adApplyCode">
				<input class="form-control" type="hidden" name="userId">
				<div class="form-group">
     				<label class="col-sm-2 control-label">물품명</label>
     				<div class="col-sm-3">
					<select class="form-control" name="auctionGoods" id="sk" onchange="">
						<option value="">모니터</option>
						<option value="">스피커</option>
					</select>
					</div>
				</div>
				<div class="form-group">
     				<label class="col-sm-2 control-label">광고명</label>
     				<div class="col-sm-3">
     				
					<select class="form-control" name="adUnitPriceCode" id="sk" onchange="">
					<c:forEach var="ad" items="${list}">
						<option value="${ad.adUnitPriceCode}">${ad.adUnitPriceName}</option>
					</c:forEach>
					</select>
					
					</div>
				</div>
				
				<div class="form-group">
		   			<label class="col-sm-2 control-label">광고신청일</label>
		   			<div class="col-sm-3">
					<input  class="form-control" type="date" name="adApplyDate">
					</div>
				</div>
				<!-- datepicker사용해서 광고가능한 스케줄 띄우기 -->
				<div class="form-group">
		   			<label class="col-sm-2 control-label">광고 시작일</label>
		   			<div class="col-sm-3">
					<input  class="form-control" type="date" name="adApplyStartDate">
					</div>
				</div>
				<div class="form-group">
		   			<label class="col-sm-2 control-label">광고 종료일</label>
		   			<div class="col-sm-3">
					<input  class="form-control" type="date" name="adApplyEndDate">
					</div>
				</div>
				<div class="form-group">
				<textarea class="form-controll" id="summernote" name="img"></textarea>
				</div>
				<div class="form-group submit text-center">
					<input class="btn btn-info" type ="submit" value = "신청">
					<input class="btn btn-default" type ="reset" value = "다시쓰기">
				</div>
			</form>    	
		</div>
	</div>
</div>

<script>
// summernote 불러오기 및 설정
$(document).ready(function() {
	$('#summernote').summernote({
		height: 500,
		lang: 'ko-KR',
		callbacks: {
		onImageUpload: function(files, editor, welEditable) {
			for (var i = files.length - 1; i >= 0; i--) {
				sendFile(files[i], this);
				}
			}
		}
	});
});
</script>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8"/>