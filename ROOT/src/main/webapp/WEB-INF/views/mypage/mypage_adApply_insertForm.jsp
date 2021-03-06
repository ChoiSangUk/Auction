<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8"/>
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
	height: 51px;
}
</style>


<div class="container-fluid">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="row title">
			<div class="col-sm-12">
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			<a href="${pageContext.request.contextPath}/main">홈</a>
			<span>></span>
			<a href="${pageContext.request.contextPath}/mypage/mypageAdInfo">광고 소개</a>
			<span>></span>
			<span>광고 신청</span><br>
			<h1>광고 신청</h1>
			</div>
		</div>
		<div class="row content text-left">	
			<!-- 물품광고신청 폼 -->
			<sf:form class="form-horizontal" commandName="adApplyVo" action="${pageContext.request.contextPath}/mypage/adApplyInsertForm"
				id="applyForm" method="post" enctype="multipart/form-data">
				<input class="form-control" type="hidden" name="adApplyCode">
				<input class="form-control" type="hidden" name="userId">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th class="col-sm-2 active">물품명</th>
							<td>
								<div class="col-sm-3">
									<sf:select path="auctionGoodsCode" class="form-control" name="auctionGoodsCode">
										<c:forEach var="ag" items="${auctionGoodsList}">
											<option value="${ag.auctionGoodsCode}">${ag.auctionGoodsName}</option>											
										</c:forEach>
									</sf:select>
									<sf:errors path="auctionGoodsCode" cssClass="error"/>
								</div>
								<div class="col-sm-3">
								<a class="btn btn-success" href="${pageContext.request.contextPath}/auctiongoods/auctiongoodsinsert">물품등록</a> 
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">광고명</th>
							<td>
								<div class="col-sm-3">
									<select class="form-control" name="adUnitPriceCode">
										<c:forEach var="ad" items="${adUnitPriceList}">
											<option value="${ad.adUnitPriceCode}">${ad.adUnitPriceName}</option>											
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">광고 등록일자</th>
							<td>
								<div class="form-inline dt" data-toggle="tooltip">
								<div class="col-sm-3 input-group date" data-provide="datepicker" id="sdate"
								style="margin-left: 15px;">
									<sf:input path="adApplyStartDate" class="form-control" type="text" name="adApplyStartDate" id="sd" readonly="readonly"/>									
									<div class="input-group-addon">
						        		<span class="glyphicon glyphicon-th"></span>
						    		</div>					    		
								</div>								
								<sf:errors path="adApplyStartDate" cssClass="error"/>
								<span style="margin-left: 15px;">~</span>
								<div class="col-sm-3 input-group date" data-provide="datepicker" id="edate"
								style="margin-left: 15px;">
									<sf:input path="adApplyEndDate" class="form-control" type="text" name="adApplyEndDate" id="ed" readonly="readonly"/>
									<div class="input-group-addon">
						        		<span class="glyphicon glyphicon-th"></span>
						    		</div>							    			    		
								</div>
								<sf:errors path="adApplyEndDate" cssClass="error"/>								
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 text-center active">물품 이미지</th>
							<td>
								<div class="col-sm-4">
									<input class="form-control" type="file" name="adImage" id="adImage" value="">
									<span class="error" id="fileCheck"></span>
								</div>
								<div style="margin-top: 8px;">
								<span class="glyphicon glyphicon glyphicon-asterisk" aria-hidden="true"></span>
								메인배너에 사용 될 이미지를 첨부해주세요! (그림의 사이즈는 1200x400으로 맞춰집니다)
								</div>
							</td>
						</tr>
					</tbody>
				</table>					
				<!-- <div class="form-group">
					<textarea class="form-controll" id="summernote" name=""></textarea>
				</div> -->
				<div class="form-group submit text-center">
					<input class="btn btn-info" type="submit" id="ApplyBtn" name="applySubmit" value="신청">
					<input class="btn btn-default" type="reset" id="resetBtn" value="다시쓰기">
				</div>
			</sf:form>		
		</div>				
	</div>
</div>

<script>
// summernote 불러오기 및 설정
/* $(document).ready(function() {
	$('#summernote').summernote({
		height : 500,
		lang : 'ko-KR'
	});
}); */

/* 툴팁 설정 */
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip({
    	html: true,
        animated : 'fade',
        placement : 'top',
        title: '<strong style="color: red;">※메인배너 등록일자 주의사항※</strong><br>메인배너는 최대 3개까지 등록가능합니다.<br>메인배너가 모두 등록되어있을 경우 가장 먼저<br>종료되는 광고의 종료일자 이후부터 선택이 가능합니다.'
    });   
});
/* 파일등록 유효성검사 */
$(document).ready(function() {
	$('#ApplyBtn').click(function() {		
		if($('#adImage').val() == '') {
			 console.log('확인');
			 $('#fileCheck').text('파일첨부는 필수사항입니다.');
			 event.preventDefault();
		}else {
			$('#applyForm').submit();
		}
	});	
});
/* 다시쓰기버튼 클릭시 유효성검사글자 제거 */
$('#resetBtn').click(function() {
	console.log('reset');
	$('.error').text('');
});


/***************************************
 * - datepicker -
 * 메인배너가 3개로 차있을 경우 가장 먼저 종료되는 메인배너의
 * 종료일자 이후부터 선택이 가능하다.
 * 메인배너가 3개 이하일 현재날짜 이후부터 선택이 가능하다. 
 ***************************************/
$.ajax({
	url: '${pageContext.request.contextPath}/dateAjax',
	type: 'post',
		success: function(data){
			var startData = data;
			console.log(data);
			
		if(data != '') {
			console.log('null X');
			$('#sdate').datepicker({
		    	format: 'yyyy-mm-dd',
		    	language: 'ko',
		    	orientation: 'bottom',
		    	startDate: data 
		    });			
			$('#edate').datepicker({
		    	format: 'yyyy-mm-dd',
		    	language: 'ko',
		    	orientation: 'bottom',
		    	startDate: data 
		    });
		} else if(data == ''){
			console.log('null');
			var nowDate = moment().format('YYYY-MM-DD');
			$('#sdate').datepicker({
		    	format: 'yyyy-mm-dd',
		    	language: 'ko',
		    	orientation: 'bottom',
		    	startDate: nowDate 
		    });				
			$('#edate').datepicker({
		    	format: 'yyyy-mm-dd',
		    	language: 'ko',
		    	orientation: 'bottom',
		    	startDate: nowDate
		    });
		}
	},
	/* 광고신청이 하나도없을 시 */
	error: function(data){
		console.log('error'+data);
		var nowDate = moment().format('YYYY-MM-DD');
		$('#sdate').datepicker({
	    	format: 'yyyy-mm-dd',
	    	language: 'ko',
	    	orientation: 'bottom',
	    	startDate: nowDate
	    });
		$('#edate').datepicker({
	    	format: 'yyyy-mm-dd',
	    	language: 'ko',
	    	orientation: 'bottom',
	    	startDate: nowDate
	    });
	}
});
    

</script>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8"/>