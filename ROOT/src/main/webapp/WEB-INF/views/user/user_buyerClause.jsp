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
			<span style="color: #1266FF">회원가입</span> <span>></span> <span
				style="color: #1266FF">약관동의</span>
				<h1>회원가입</h1>
				<div>
				<div class="stepwizard col-md-offset-2">
			    <div class="stepwizard-row setup-panel">
			      <div class="stepwizard-step">
			        <a class="btn btn-default btn-circle step" disabled="disabled">STEP1<br><strong style="font-size: 25px;">회원선택</strong></a>			        
			      </div>
			      <div class="next-step">
			      	<span class="glyphicon glyphicon-hand-right" style="font-size: 30px;"></span>
			      </div>
			      <div class="stepwizard-step">
			       <a class="btn btn-primary btn-circle step">STEP2<br><strong style="font-size: 25px;">약관동의</strong></a>
			       </div>
			         <div class="next-step">
			      		<span class="glyphicon glyphicon-hand-right" style="font-size: 30px; color: #286090"></span>
			     	 </div>
			      <div class="stepwizard-step step">
			       <a class="btn btn-default btn-circle" disabled="disabled">STEP3<br><strong style="font-size: 25px;">정보입력</strong></a>
			      </div>
			      	<div class="next-step">
			      		<span class="glyphicon glyphicon-hand-right" style="font-size: 30px"></span>
			     	 </div>
			       <div class="stepwizard-step step">
			        <a class="btn btn-default btn-circle" disabled="disabled">STEP4<br><strong style="font-size: 25px;">가입완료</strong></a>			       
			      </div>
			    </div>
			  </div>
			</div>
		</div>
		<!-- 내용1 -->
		<div class="row content">				
				<h3>서비스 이용약관</h3>
	<div>
		<iframe width="100%" src="${pageContext.request.contextPath}/user/test"
			frameborder="1"></iframe>
	</div>
	<div>
		<p>‘서비스 이용약관’을 확인하고 이에 동의하십니까?</p>
		<p>
			<label class="checkbox-inline"> 
			<input type="radio" value="Y" name="agree1" id="agree1y"> 동의함
			</label> 
			<label class="checkbox-inline"> 
			<input type="radio"	value="N" name="agree1" id="agree1n"> 동의하지 않습니다.
			</label>
		</p>
	</div>

		</div>
		<!-- 내용2 -->
		<div class="row content">				
			<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/user/userBuyerInsertForm">회원가입</a>

		</div>
	</div>			
	<!-- 오른쪽 여백 -->		
	<div class="col-sm-1"></div>
</div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />