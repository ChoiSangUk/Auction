<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8"/>

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
						<option value="">메인배너</option>
						<option value="">실시간경매배너</option>
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
			   		<label class="col-sm-2 control-label"></label>&nbsp;&nbsp;&nbsp;
					<input class="btn btn-default" type ="submit" value = "신청">
					<input class="btn btn-default" type ="reset" value = "다시쓰기">
				</div>
			</form>    	
		</div>
	</div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8"/>