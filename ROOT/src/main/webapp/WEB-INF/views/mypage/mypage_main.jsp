<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<style>
.sm-box {
	height: 50px;
	margin-top: 20px;
}

.md-box {
	height: 50px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.lg-box {
	margin-top: 30px;
}

.panel {
	height: 170px;
	padding: 0px;
	margin: 0px;
}

.mypage-a {
	color: #000000 !important;
}

.glyphicon.glyphicon-cloud, .glyphicon.glyphicon-pencil, .glyphicon.glyphicon-stats,
	.glyphicon.glyphicon-list-alt {
	font-size: 50px;
	color: #2F9D27
}

.glyphicon.glyphicon-plus, .glyphicon.glyphicon-search {
	color: #0000A5;
}

.btn-blue {
	background-color: #0000A5;
	color: #ffffff;
	width: 147px;
}

/* a:link {text-decoration: none; color: #ffffff;}
a:visited {text-decoration: none; color: #ffffff;}
a:active {text-decoration: none; color: #blue;}
a:hover {text-decoration: underline; color: #000000;} */
</style>

<div class="container text-left">
	<h3>마이페이지</h3>
	<br>
	<div class="row">
		<!-- 마이페이지 기본정보 관리 -->
		<div class="col-sm-12">
			<div class="panel panel-default text-left col-sm-4 well">
				<div class="panel-body">
					<h4>
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						<strong>${userLoginInfo.userName}님</strong>
					</h4>

					<c:if test="${userLoginInfo.userLevel eq '판매자' }">
						<div class="sm-box">판매등급은 ? 입니다.</div>
						<a class="mypage-a btn btn-default" href="#">판매 혜택보기</a>
					</c:if>
					<c:if test="${userLoginInfo.userLevel eq '구매자' }">
						<div class="sm-box">구매등급은 ? 입니다.</div>
						<a class="mypage-a btn btn-default" href="#">구매 혜택보기</a>
					</c:if>

				</div>
			</div>
			<div class="panel panel-default text-center col-sm-3">
				<div class="panel-body">
					<div class="sm-box col-sm-12">
						<span>잔여 금액 : </span> <span>${userLoginInfo.userTotalcash}</span>
					</div>
					<div class="col-sm-6">
						<a class="btn btn-success" href="#">캐쉬 충전</a>
					</div>
					<div class="col-sm-6">
						<a class="btn btn-success" href="#">캐쉬 출금</a>
					</div>
				</div>
			</div>
			<div class="panel panel-default text-center col-sm-5">
				<div class="lg-box panel-body">
					<div class="col-sm-3">
						<a class="mypage-a" href="#"> <span
							class="glyphicon glyphicon-pencil" aria-hidden="true"
							aria-hidden="true"></span> <br>내 정보<br>수정
						</a>
					</div>
					<div class="col-sm-3">
						<a class="mypage-a" href="#"> <span
							class="glyphicon glyphicon-stats" aria-hidden="true"
							aria-hidden="true"></span> <br>내 신용도<br>조회
						</a>
					</div>
					<div class="col-sm-3">
						<a class="mypage-a" href=""> <span
							class="glyphicon glyphicon-cloud" aria-hidden="true"
							aria-hidden="true"></span> <br>내 계좌<br>관리
						</a>
					</div>
					<div class="col-sm-3">
						<a class="mypage-a" href="#"> <span
							class="glyphicon glyphicon-list-alt" aria-hidden="true"
							aria-hidden="true"></span> <br>캐쉬 내역<br>조회
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 구매내역 관리 -->
		<div class="row">
			<div class="col-sm-12 md-box">
				<h3>
					<span class="glyphicon glyphicon-search"></span> 구매현황 <a
						class="mypage-a" href="#"> <span
						class="pull-right glyphicon glyphicon-plus"></span> <span
						class="pull-right">구매관리 바로가기</span>
					</a>
				</h3>
			</div>
			<div class="table">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th colspan="4">d</th>
							<th colspan="4">d</th>
						</tr>
						<tr>
							<th>#</th>
							<th>#</th>
							<th>#</th>
							<th>#</th>
							<th>#</th>
							<th>#</th>
							<th>#</th>
							<th>#</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
							<td>5</td>
							<td>6</td>
							<td>7</td>
							<td>8</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 판매내역 관리 -->
			<c:if test="${userLoginInfo.userLevel eq '판매자'}">
				<div class="col-sm-12 md-box">
					<h3>
						<span class="glyphicon glyphicon-search"></span> 판매현황 <a
							class="mypage-a" href="#"> <span
							class="pull-right glyphicon glyphicon-plus"></span> <span
							class="pull-right">판매관리 바로가기</span>
						</a>
					</h3>
				</div>

				<div class="table">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>#</th>
								<th>#</th>
								<th>#</th>
								<th>#</th>
								<th>#</th>
								<th>#</th>
								<th>#</th>
								<th>#</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
								<td>6</td>
								<td>7</td>
								<td>8</td>
							</tr>
						</tbody>
					</table>
				</div>
			</c:if>
		</div>
	</div>
	<!-- 문의관리 버튼 -->
	<div class="row">
		<div class="col-sm-12 sm-box">
			<div class="col-sm-2">
				<a class="btn btn-blue btn-lg" href="#">1:1문의하기</a>
			</div>
			<div class="col-sm-2">
				<a class="btn btn-blue btn-lg" href="#">문의게시판</a>
			</div>
			<div class="col-sm-2">
				<a class="btn btn-blue btn-lg"
					href="${pageContext.request.contextPath}/mypage/mypageAdInfo">물품광고</a>
			</div>
			<div class="col-sm-2">
				<a class="btn btn-blue btn-lg" href="#">구매안내</a>
			</div>
			<c:if test="${userLoginInfo.userLevel eq '판매자'}">
				<div class="col-sm-2">
					<a class="btn btn-blue btn-lg" href="#">판매자수수료</a>
				</div>
				<div class="col-sm-2">
					<a class="btn btn-blue btn-lg" href="#">판매안내</a>
				</div>
			</c:if>
		</div>
	</div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />