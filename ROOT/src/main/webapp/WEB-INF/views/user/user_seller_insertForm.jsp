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
				style="color: #1266FF">정보입력</span>
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
			       <a class="btn btn-default btn-circle step" disabled="disabled">STEP2<br><strong style="font-size: 25px;">약관동의</strong></a>
			       </div>
			         <div class="next-step">
			      		<span class="glyphicon glyphicon-hand-right" style="font-size: 30px; color: #286090"></span>
			     	 </div>
			      <div class="stepwizard-step step">
			       <a class="btn btn-primary btn-circle">STEP3<br><strong style="font-size: 25px;">정보입력</strong></a>
			      </div>
			      	<div class="next-step">
			      		<span class="glyphicon glyphicon-hand-right" style="font-size: 30px; color: #286090"></span>
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
			<div>
	<form role="form" id="addForm" class="well form-search" action="${pageContext.request.contextPath}/user/userSellerInsertForm" method="post">
		<div class="form-group">
			<label for="userId">아이디</label> <input type="text"
				class="form-control" id="userId" name="userId" placeholder="아이디">
		</div>
		<div class="form-group">
			<label for="userPassword">비밀번호</label> <input type="password"
				class="form-control" id="userPassword" name="userPassword"
				placeholder="비밀번호">
		</div>
		<div class="form-group">
			<label for="chkpassword">비밀번호 확인</label> <input type="password"
				class="form-control" id="chkpassword" name="chkpassword"
				placeholder="비밀번호 확인">
			<font name="check" size="2" color="red"></font>
		</div>
		<div class="form-group">
			<label for="userName">이름</label> <input type="text"
				class="form-control" id="userName" name="userName"
				placeholder="이름을 입력해 주세요">
		</div>
		<div class="form-group">
			<label for="userGender">성별</label> <br> 남<input type="radio"
				id="userGender" name="userGender" value="남" placeholder="남">				
												여<input type="radio"
				id="userGender" name="userGender" value="여" placeholder="여">
		</div>
		<div class="form-group">
			<label for="userBirth">주민번호</label> <input type="text"
				class="form-control" id="userBirth" name="userBirth"
				placeholder="주민번호 입력해 주세요">
		</div>
		<div class="form-group">
			<label for="user_phone">연락처</label> <input type="text"
				class="form-control" id="userPhone" name="userPhone"
				placeholder="연락처 입력해 주세요">
		</div>
				<div class="form-group">
			<label for="user_email">이메일</label> <input type="email"
				class="form-control" id="userEmail" name="userEmail"
				placeholder="이메일 입력해 주세요">
		</div>
		<label for="user_email">주소</label> 
		<input type="text" id="sample6_postcode" name="userPostcode" placeholder="우편번호" readonly="readonly">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" name="userAddr" placeholder="주소" readonly="readonly">
		<input type="text" id="sample6_address2" name="userAddrdetail" placeholder="상세주소">
		<div class="form-group text-center">
			<button type="submit" class="btn btn-info">
				회원가입<i class="fa fa-check spaceLeft"></i>
			</button>
			
			<button type="reset" class="btn btn-warning">
				가입취소<i class="fa fa-times spaceLeft"></i>
			</button>
			<!-- 가입취소시  -->
		</div>
	</form>
</div>

		</div>
		<!-- 내용2 -->
		<div class="row content">				
			

		</div>
	</div>			
	<!-- 오른쪽 여백 -->		
	<div class="col-sm-1"></div>
</div>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/userinsertForm.js">
 
</script>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />