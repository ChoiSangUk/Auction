<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" />

<div class="container-fluid text-center">
	<div class="row content">
		<div class="col-sm-12 text-left"> 
			<h1>광고단가 수정 화면</h1>
	    	<form class="form-horizontal" action="${pageContext.request.contextPath}/ad/adminAdUnitUpdateForm" method="post">
		   		<div class="form-group">
		   			<label class="col-sm-1 control-label">광고단가코드</label>
		   			<div class="col-sm-3">
					<input  class="form-control" type="text" name="adUnitPriceCode" value = "${ad.adUnitPriceCode}" readonly>
					</div>
				</div>
				<div class="form-group">
		   			<label class="col-sm-1 control-label">광고명</label>
		   			<div class="col-sm-3">
					<input  class="form-control" type="text" name="adUnitPriceName" value = "${ad.adUnitPriceName}">
					</div>
				</div>
				<div class="form-group">
		   			<label class="col-sm-1 control-label">광고가격</label>
		   			<div class="col-sm-3">
					<input  class="form-control" type="text" name="adUnitPricePrice" value = "${ad.adUnitPricePrice}">
					</div>
				</div>
				<div class="form-group">
		   			<label class="col-sm-1 control-label">광고상태</label>
		   			<div class="col-sm-3">
					<label class="radio-inline"><input type="radio" name="adUnitPriceState" checked="checked" value="on">on</label>
					<label class="radio-inline"><input type="radio" name="adUnitPriceState" value="off">off</label>
					</div>
				</div>
				<div class="form-group">
			   		<label class="col-sm-1 control-label"></label>&nbsp;&nbsp;&nbsp;
					<input class="btn btn-default" type ="submit" value = "수정">
					<input class="btn btn-default" type ="reset" value = "다시쓰기">
					<a class="btn btn-default" href="${pageContext.request.contextPath}/ad/adminAdManagement">광고단가 리스트</a>
				</div>
			</form>
		</div>
	</div>
</div>

<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />
