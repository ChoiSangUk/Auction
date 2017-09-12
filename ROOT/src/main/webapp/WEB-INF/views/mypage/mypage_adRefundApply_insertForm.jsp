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
td {
	text-align: left !important;
}

input {
	max-width: 230px !important;

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
				<a href="${pageContext.request.contextPath}/mypage/adApplyList">나의 광고신청 리스트</a>
				<span>></span>
				<span style="color: #1266FF">광고환불 신청</span>
				<h2>광고환불 신청</h2>
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
								<div class="col-sm-8">
									<input class="form-control refundInput" type="text" name="adUnitPriceName" value="" readonly="readonly">
								</div>
							</td>
							<th class="col-sm-2 active">광고명</th>
							<td>
								<div class="col-sm-8">
									<input class="form-control refundInput" type="text" name="adUnitPriceName" value="" readonly="readonly">
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">환불신청사유</th>
							<td colspan="4">
								<div class="col-sm-3">
									<select class="form-control" name="adUnitPriceCode">
										<option></option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-2 active">환불금액</th>
							<td colspan="4">
								<div class="col-sm-3">
									<input class="form-control" type="text" name="adUnitPriceName" value="" readonly="readonly">
								</div>
							</td>
						</tr>

					</tbody>
				</table>					
				<div class="form-group submit text-center">
					<input class="btn btn-info" type="submit" id="ApplyBtn" name="applySubmit" value="신청">
					<input class="btn btn-default" type="reset" id="resetBtn" value="다시쓰기">
				</div>
			</sf:form>		
		</div>				
	</div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8"/>