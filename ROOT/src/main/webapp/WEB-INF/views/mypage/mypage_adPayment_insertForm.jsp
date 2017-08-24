<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8"/>

<div class="container-fluid text-left">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="row title" style="margin-top: 30px;">
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			<a href="${pageContext.request.contextPath}/main">홈</a>
			<span>></span>
			<a href="${pageContext.request.contextPath}/mypage/mypageAdInfo">광고소개</a>
			<span>></span>
			<a href="${pageContext.request.contextPath}/mypage/adApplyList">나의 광고신청 리스트</a>
			<span>></span>
			<span style="color: #1266FF">광고 결제</span>
			<h2>광고 결제</h2>
		</div>			
		<div class="row content">
				<!-- 물품광고신청 폼 -->
				<form class="form-horizontal" action="${pageContext.request.contextPath}/mypage/adApplyInsertForm"
					method="post">
					<div class="form-group">
						<label class="col-sm-1 control-label">광고 시작일</label>
						<div class="col-sm-2">
							<input class="form-control" type="date" name="adApplyStartDate">
						</div>
						<label class="col-sm-1 control-label">광고 종료일</label>
						<div class="col-sm-2">
							<input class="form-control" type="date" name="adApplyEndDate">
						</div>
					</div>
					<div class="form-group submit text-center">
						<input class="btn btn-info" type="submit" id="formSubmit" name="formSubmit" value="결제">
						<input class="btn btn-default" type="reset" value="다시쓰기">
					</div>
				</form>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>


<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8"/>