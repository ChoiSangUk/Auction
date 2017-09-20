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
	color: #2F9D27;
}

.glyphicon.glyphicon-plus, .glyphicon.glyphicon-search {
	color: #0000A5;
}
.btn-danger {
	width: 147px;
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

<div class="container-fluid">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="row title">
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			<a href="${pageContext.request.contextPath}/main">홈</a>
			<span>></span>
			<span style="color: #1266FF">마이페이지</span>
			<h2>마이페이지</h2>
		</div>
		<div class="row content">
		<!-- 마이페이지 기본정보 관리 -->
			<div class="panel panel-default text-left col-sm-4 well">
				<div class="panel-body">
					<h4>
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						<strong>${userLoginInfo.userName}님</strong>
					</h4>

					<c:if test="${userLoginInfo.userLevel eq '판매자' }">
						<div class="sm-box">판매등급은 ${grade.gradeName} 입니다.</div>
						<a class="mypage-a btn btn-default" href="#">판매혜택보기</a>
						<a class="mypage-a btn btn-default" href="#">회원등급안내</a>
					</c:if>
					<c:if test="${userLoginInfo.userLevel eq '구매자' }">
						<div class="sm-box">구매등급은 ${grade.gradeName} 입니다.</div>
						<form id="trans" action="${pageContext.request.contextPath}/mypage/mypageMain" method="post">
							<a class="mypage-a btn btn-default" href="#">구매혜택보기</a>
							<a class="mypage-a btn btn-default" href="#">회원등급안내</a>
							<button class="mypage-a btn btn-default" type="submit">판매자전환</button>
						</form>
					</c:if>

				</div>
			</div>
			<div class="panel panel-default text-center col-sm-3">
				<div class="panel-body">
					<div class="sm-box col-sm-12">
						<span>잔여 금액 : </span> <span>${userDetailInfo.userTotalcash}</span>
					</div>
					<div class="col-sm-6">
						<a class="btn btn-success" href="${pageContext.request.contextPath}/mypage/myinfo/Cash">캐쉬 충전</a>
					</div>
					<div class="col-sm-6">
						<a class="btn btn-success" href="${pageContext.request.contextPath}/mypage/myinfo/CashWithdraw">캐쉬 출금</a>
					</div>
				</div>
			</div>
			<div class="panel panel-default text-center col-sm-5">
				<div class="lg-box panel-body">
					<div class="col-sm-3">
						<a class="mypage-a" href="${pageContext.request.contextPath}/mypage/mypageMyinfoUpdate"> <span
							class="glyphicon glyphicon-pencil" aria-hidden="true"
							aria-hidden="true"></span> <br>내 정보<br>수정
						</a>
					</div>
					<div class="col-sm-3">
						<a class="mypage-a" href="${pageContext.request.contextPath}/mypage/mypageMyinfoCredit"> <span
							class="glyphicon glyphicon-stats" aria-hidden="true"
							aria-hidden="true"></span> <br>내 신용도<br>조회
						</a>
					</div>
					<div class="col-sm-3">
						<a class="mypage-a" href="${pageContext.request.contextPath}/mypage/myinfo/MyinfoAccount"> <span
							class="glyphicon glyphicon-cloud" aria-hidden="true"
							aria-hidden="true"></span> <br>내 계좌<br>관리
						</a>
					</div>
					<div class="col-sm-3">
						<a class="mypage-a" href="${pageContext.request.contextPath}/mypage/myinfo/CashDetail"> <span
							class="glyphicon glyphicon-list-alt" aria-hidden="true"
							aria-hidden="true"></span> <br>캐쉬 내역<br>조회
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 구매내역 관리 -->
		<div class="row content">
			<div class="col-sm-12 md-box">
				<h3>
					<span class="glyphicon glyphicon-search"></span> 구매현황 
					<a
						class="mypage-a" href="#"> <span
						class="pull-right glyphicon glyphicon-plus"></span> <span
						class="pull-right">구매관리 바로가기</span>
					</a>
					
					
					<%-- <a
						class="mypage-a" href="${pageContext.request.contextPath}/bid/bidusergoodsbidlist"> <span
						class="pull-right glyphicon glyphicon-plus"></span> <span
						class="pull-right">입찰관리 바로가기</span>
					</a> --%>
				</h3>
			</div>
			<div class="table">
				<table class="table table-bordered">
					<thead>
						<tr class="active">
							<th colspan="5">주문/배송 조회</th>
							<th colspan="5">취소/반품/미수령</th>
						</tr>
						<tr class="active">
							<th>>입금요청</a></th>
							<th>입금확인중</th>
							<th>결제완료<br>배송준비중</th>
							<th>배송중</th>
							<th>구매결정<br>대기</th>
							<th>구매거부</th>
							<th>반품</th>
							<th>미수령</th>
							<th>미입금</th>
							<th>판매거부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a 
						href="${pageContext.request.contextPath}/bid/bidusergoodsbidlist">1</a></td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
							<td>5</td>
							<td>6</td>
							<td>7</td>
							<td>8</td>
							<td>9</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 판매내역 관리 -->
			<c:if test="${userLoginInfo.userLevel eq '판매자'}">
				<div class="col-sm-12 md-box">
					<h3>
						<span class="glyphicon glyphicon-search"></span> 판매현황 <a
							class="mypage-a" href="${pageContext.request.contextPath}/auctiongoods/mySalesGoods?userId=${userLoginInfo.userId}"> <span
							class="pull-right glyphicon glyphicon-plus"></span> <span
							class="pull-right">내 판매물품</span>
						</a>
					</h3>
				</div>

							<div class="table">
				<table class="table table-bordered">
					<thead>
						<tr class="active">
							<th colspan="5">주문/배송 조회</th>
							<th colspan="5">취소/반품/미수령</th>
						</tr>
						<tr class="active">
							<th>입금요청</th>
							<th>입금확인중</th>
							<th>배송요청</th>
							<th>배송중</th>
							<th>구매결정<br>대기</th>
							<th>구매거부</th>
							<th>반품</th>
							<th>미수령</th>
							<th>미입금</th>
							<th>판매거부</th>
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
							<td>9</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>
			</div>
			</c:if>
		</div>
		<!-- 문의관리 버튼 -->
		<div class="row content">
			<div class="col-sm-12">
				<div class="col-sm-2">
					<a class="btn btn-danger btn-lg" href="#">1:1문의하기</a>
				</div>
				<div class="col-sm-2">
					<a class="btn btn-danger btn-lg" href="#">문의게시판</a>
				</div>
				<div class="col-sm-2">
					<a class="btn btn-blue btn-lg"
						href="${pageContext.request.contextPath}/mypage/mypageAdInfo">물품광고</a>
				</div>
				<div class="col-sm-2">
					<a class="btn btn-danger btn-lg" href="#">구매안내</a>
				</div>
				<c:if test="${userLoginInfo.userLevel eq '판매자'}">
					<div class="col-sm-2">
						<a class="btn btn-danger btn-lg" href="#">판매자수수료</a>
					</div>
					<div class="col-sm-2">
						<a class="btn btn-danger btn-lg" href="#">판매안내</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />