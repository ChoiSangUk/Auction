<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<style>

.join-ico {
 position: absolute;
    top: 50px;
    right: 150px;
    width: 100px;
    height: 100px;
}
.boxBar {
    border: 1px solid #e0e0e0;
    padding: 50px 70px;
    border-top: 2px solid #111;
}
.stepwizard-step p {
    margin-top: 10px;
}
.stepwizard-row {
    display: table-row;
}
.stepwizard {
	padding: 50px 0 20px 0;
    display: table;
    width: 50%;
    position: relative;
}
.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}
.btn-circle {
    width: 30px;
    height: 30px;
    text-align: center;
    padding: 6px 0;
    font-size: 12px;
    line-height: 1.428571429;
    border-radius: 15px;
}
.setup-panel {
	
}
.btn-circle {
	min-width: 130px;
    min-height: 130px;
    font-size: 15px;
    padding-top: 33px;
}
.next-step {
	padding: 0px 30px 0px 30px;
}
.glyphicon-hand-right {
	vertical-align: middle;
}
</style>
<div class="container-fluid">
	<!-- 왼쪽 여백 -->
	<div class="col-sm-1"></div>
	<!-- 가운데 메인 -->
	<div class="col-sm-10">
		<!-- 네이게이션 & 페이지 타이틀 -->
		<div class="row title">
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span> <a
				href="${pageContext.request.contextPath}/main">홈</a> <span>></span>
			<span style="color: #1266FF">아이디/비밀번호찾기</span>
			<h1>아이디/비밀번호찾기</h1>
			<!-- <div>
				<ul>
					<li class="on"><span class="step">STEP01</span><span
						class="step-tit">회원선택</span><a
						class="glyphicon glyphicon-hand-right"></a></li>
					<li><span class="step">STEP02</span><span class="step-tit">약관동의</span></li>
					<li><span class="step">STEP03</span><span class="step-tit">정보입력</span></li>
					<li><span class="step">STEP04</span><span class="step-tit">가입완료</span></li>
				</ul>
			</div> -->
			<div>

				
				<div class="row col-sm-6">
					<div class="boxBar">
					<h3>
						<strong>구매/판매자 회원</strong>
					</h3>
					<p>
						실명확인이 가능한 14세 이상<br> 구매/판매회원				
					</p>
					
						<p>
							<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/user/userFindIdForm">아이디찾기
							</a>
						</p>
					<div class="join-ico">
							<img alt="" src="${pageContext.request.contextPath}/resources/img/userJoin.png">
					</div>
					
					</div>
					
				</div>
			
				<div class="row col-sm-6">
					<div class="boxBar">
						<h3>
							<strong>구매/판매자 회원</strong>
						</h3>
						<p>
							실명확인이 가능한 14세 이상<br>구매/판매회원
						</p>
						<div>
							<p>
								<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/user/userFindPwForm">비밀번호찾기</a>
							</p>
						<div class="join-ico">
							<img alt="" src="${pageContext.request.contextPath}/resources/img/userJoin.png">
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 내용1 -->

		<!-- 내용2 -->
		<div class="row content"></div>
	</div>
	<!-- 오른쪽 여백 -->
	<div class="col-sm-1"></div>
</div>





<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />