<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<style>
.sm-box {
	height: 50px;
	margin-top: 20px;
}
.md-box {
	height: 80px;
	margin-top: 20px;
}
.lg-box {
	margin-top: 50px;
}
.panel {
	height: 170px;
	padding: 0px;
	margin: 0px;
}
</style>

<div class="container text-left">
	<!-- 마이페이지 내정보 목록 -->
	<h3>마이페이지</h3>
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default text-left col-sm-4 well">
				<div class="panel-body">				
						<h4>
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						<strong>박주호님</strong>
						</h4>
					<div class="sm-box">판매등급은 ? 입니다.</div>
					<a class="btn btn-default" href="#">판매 혜택보기</a>
				</div>
			</div>
			<div class="panel panel-default text-center col-sm-3">
				<div class="panel-body">
					<div class="md-box col-sm-12">
						<span class="pull-left">잔여 금액</span>
						<span class="pull-right">10000 원</span>
					</div>
					<div class="col-sm-6">
					<a class="btn btn-info" href="#">캐쉬 충전</a>
					</div>
					<div class="col-sm-6">
					<a class="btn btn-info" href="#">캐쉬 출금</a>
					</div>
				</div>
			</div>
			<div class="panel panel-default text-left col-sm-5">
				<div class="lg-box panel-body">
					<div class="col-sm-3">
						<a class="btn btn-default" href="#">내 정보 수정</a>
					</div>
					<div class="col-sm-3">
						<a class="btn btn-default" href="#">신용도 보기</a>
					</div>
					<div class="col-sm-3">
						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
								<span>계좌 관리</span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">등록 계좌</a></li>
								<li><a href="#">계좌 등록</a></li>
								<li><a href="#">계좌 수정</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<a class="btn btn-default" href="#">캐쉬사용</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />