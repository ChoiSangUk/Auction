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
	width: 80%;
	margin: auto;
}


</style>

<div class="container-fluid text-left">
	<div class="row title">
		<div class="col-sm-12">
		<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
		<a href="${pageContext.request.contextPath}/main">홈</a>
		<span>></span>
		<span>광고신청</span>
		</div>
	</div><br>
	<div class="row content">	
		<div class="col-sm-12">		
			<!-- 물품광고신청 폼 -->
			<form class="form-horizontal" action="${pageContext.request.contextPath}/mypage/adApplyInsertForm"
				method="post" enctype="multipart/form-data">
				<input class="form-control" type="hidden" name="adApplyCode">
				<input class="form-control" type="hidden" name="userId">		
				<div class="form-group">
					<label class="col-sm-2 control-label">물품명</label>
					<div class="col-sm-2">
						<select class="form-control" name="auctionGoodsCode">
							<c:forEach var="ag" items="${auctionGoodsList}">
								<option value="${ag.auctionGoodsCode}">${ag.auctionGoodsName}</option>
							</c:forEach>
						</select>
					</div>				
					<label class="col-sm-1 control-label">광고명</label>
					<div class="col-sm-2">
						<select class="form-control" name="adUnitPriceCode">
							<c:forEach var="ad" items="${adUnitPriceList}">
								<option value="${ad.adUnitPriceCode}">${ad.adUnitPriceName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<!-- datepicker사용해서 광고가능한 스케줄 띄우기 -->
				<div class="form-group">
					<label class="col-sm-2 control-label">광고 시작일</label>
					<div class="col-sm-2">
						<input class="form-control" type="date" name="adApplyStartDate">
					</div>
					<label class="col-sm-1 control-label">광고 종료일</label>
					<div class="col-sm-2">
						<input class="form-control" type="date" name="adApplyEndDate">
					</div>
				</div>
				<!-- 매인배너에 걸릴 이미지 -->
				<div class="form-group">
					<label class="col-sm-2 control-label">물품 이미지</label>
					<div class="col-sm-2">
						<input class="form-control" type="file" name="adImage">
					</div>
					<p><span class="glyphicon glyphicon glyphicon-asterisk" aria-hidden="true"></span>
					메인배너에 사용 될 이미지를 첨부해주세요! (그림의 사이즈는 1200x400으로 맞춰집니다)</p>
				</div>
				<div class="form-group">
					<textarea class="form-controll" id="summernote" name=""></textarea>
				</div>
				<div class="form-group submit text-center">
					<input class="btn btn-default" type="submit" id="formSubmit" name="formSubmit" value="제출">
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
		lang : 'ko-KR'
	});
});
/* $(document).ready(function() {
$("#formSubmit").click(function() {
	var formData = $('#summernote').find('p').text();
	$.ajax({
		type : "POST",
		url : '/auction/mypage/adApplyInsertForm',
		cache : false,
		data : formData,
		success : function(formData){
			console.log(formData);
		},
		error : onError
		});
	});
}); */


</script>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8"/>