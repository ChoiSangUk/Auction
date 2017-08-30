<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" />

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="row title">
			<h1>광고단가 수정 화면</h1>
		</div>
		<div class="row content">			
	    	<form class="form-horizontal" action="${pageContext.request.contextPath}/ad/adminAdUnitUpdateForm" method="post">
	    	<table class="table table-bordered">
	    		<tr>
					<th class="col-sm-2 active">광고단가코드</th>
					<td>
						<div class="col-sm-3">
							<input  class="form-control" type="text" name="adUnitPriceCode" value = "${ad.adUnitPriceCode}" readonly>
						</div>
					</td>
				</tr>
				<tr>
					<th class="col-sm-2 active">광고명</th>
					<td>
						<div class="col-sm-3">
							<input  class="form-control" type="text" name="adUnitPriceName" value = "${ad.adUnitPriceName}">
						</div>
					</td>
				</tr>
				<tr>
					<th class="col-sm-2 active">광고가격</th>
					<td>
						<div class="col-sm-3">
							<input  class="form-control" type="text" name="adUnitPricePrice" value = "${ad.adUnitPricePrice}">
						</div>
					</td>
				</tr>
				<tr>
					<th class="col-sm-2 active">광고상태</th>
					<td>
						<div class="col-sm-3">
							<label class="radio-inline"><input type="radio" name="adUnitPriceState" checked="checked" value="on">on</label>
							<label class="radio-inline"><input type="radio" name="adUnitPriceState" value="off">off</label>
						</div>
					</td>
				</tr>
	    	</table>
				<div class="form-group text-center">
					<input class="btn btn-info" type ="submit" value = "수정">
					<input class="btn btn-default" type ="reset" value = "다시쓰기">
					<a class="btn btn-success" href="${pageContext.request.contextPath}/ad/adminAdManagement">광고단가 리스트</a>
				</div>
			</form>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />
